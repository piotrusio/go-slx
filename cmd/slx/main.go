package main

import (
	"context"
	"fmt"
	"log/slog"
	"os"
	"os/signal"
	"strconv"
	"syscall"
	"time"

	"github.com/nats-io/nats.go"
	"gopkg.in/natefinch/lumberjack.v2"
	"gworks.dev/slx/internal/database"
	"gworks.dev/slx/internal/dispatcher"
	"gworks.dev/slx/internal/messaging"
	"gworks.dev/slx/internal/repository"
	"gworks.dev/slx/internal/tracker"
)

type config struct {
	env     string
	db      dbConfig
	nats    publisherConfig
	log     loggerConfig
	disp    dispatcherConfig
	aggPath string
}

type dbConfig struct {
	uri          string
	maxOpenConns int
	maxIdleConns int
	maxIdleTime  time.Duration
	path         string
}

type publisherConfig struct {
	url   string
	creds string
}

type loggerConfig struct {
    Filename   string
    MaxSize    int
    MaxBackups int
    MaxAge     int
    Compress   bool
}

type dispatcherConfig struct {
	numWorkers   int
	jobQueueSize int
}

func main() {
	if err := run(); err != nil {
		fmt.Printf("Error: %v\n", err)
		os.Exit(1)
	}
}

func run() error {
	cfg := loadConfig()

	logger := newLogger(context.Background(), cfg.env, cfg.log)
	logger.Info("SLX service starting", "env", cfg.env)

	// main context for graceful shutdown
	appCtx, stop := signal.NotifyContext(
		context.Background(), syscall.SIGINT, syscall.SIGTERM,
	)
	defer stop()

	// context for external services startup
	startupCtx, startupCancel := context.WithTimeout(appCtx, 30*time.Second)
	defer startupCancel()

	// Initialize the SQL Server database connection pool
	db, err := database.New(
		startupCtx,
		cfg.db.uri,
		cfg.db.maxOpenConns,
		cfg.db.maxIdleConns,
		cfg.db.maxIdleTime,
		logger,
	)
	if err != nil {
		logger.Error("failed to initialized sqlserver database", "error", err)
		return fmt.Errorf("failed to connect to sqlserver database: %w", err)
	}
	defer func() {
		db.Close()
		logger.Info("database connection pool closed")
	}()
	logger.Info("SQL Server database initialized")

	// Initialize NATS publisher
	natsconn, err := nats.Connect(cfg.nats.url, nats.UserCredentials(cfg.nats.creds))
	if err != nil {
		return fmt.Errorf("failed to connect to NATS: %w", err)
	}
	defer natsconn.Close()
	publisher := messaging.NewNatsPublisher(natsconn, logger)
	defer publisher.Close()
	logger.Info("NATS publisher initialized")

	// Initialize Dispatcher
	disp := dispatcher.NewDispatcher(cfg.disp.numWorkers, cfg.disp.jobQueueSize, publisher, logger)
	disp.Start()
	defer disp.Stop()
	logger.Info("dispatcher initialized", "numWorkers", cfg.disp.numWorkers, "jobQueueSize", cfg.disp.jobQueueSize)

	// Register Aggregates
	repo, err := repository.NewBBoltRepository(cfg.db.path, logger)
	if err != nil {
		logger.Error("failed to initialize repository", "error", err)
		return fmt.Errorf("failed to initialize repository: %w", err)
	}
	defer repo.Close()

	// Initialize Tracker
	trackerInstance, err := tracker.NewTracker(startupCtx, cfg.aggPath, repo, logger, db.Pool, disp)
	if err != nil {
		logger.Error("failed to initialize tracker", "error", err)
		return fmt.Errorf("failed to initialize tracker: %w", err)
	}
	err = trackerInstance.Start(appCtx)
	if err != nil {
		logger.Error("failed to start tracker", "error", err)
		return fmt.Errorf("failed to start tracker: %w", err)
	}
	logger.Info("tracker started")

	<-appCtx.Done()
	logger.Info("SLX Service shutdown initiated", "signal", "termination")

	// shutdownCtx, shutdownCancel := context.WithTimeout(context.Background(), 10*time.Second)
	// defer shutdownCancel()

	var shutdownErr error
	logger.Info("SLX Service exiting.")
	return shutdownErr
}

func loadConfig() config {
	var cfg config

	cfg.env = os.Getenv("ENV")
	if cfg.env == "" {
		cfg.env = "development"
	}

	cfg.log.Filename = os.Getenv("LOG_FILENAME")
    if cfg.log.Filename == "" {
        cfg.log.Filename = "./.logs/slx.log"
    }

    maxSize, _ := strconv.Atoi(os.Getenv("LOG_MAX_SIZE"))
    if maxSize == 0 {
        maxSize = 100 // 100 MB
    }
    cfg.log.MaxSize = maxSize

    maxBackups, _ := strconv.Atoi(os.Getenv("LOG_MAX_BACKUPS"))
    if maxBackups == 0 {
        maxBackups = 3
    }
    cfg.log.MaxBackups = maxBackups

    maxAge, _ := strconv.Atoi(os.Getenv("LOG_MAX_AGE"))
    if maxAge == 0 {
        maxAge = 28 // days
    }
    cfg.log.MaxAge = maxAge

    compress := os.Getenv("LOG_COMPRESS")
    cfg.log.Compress = compress == "true"

	cfg.nats.url = os.Getenv("NATS_URL")
	if cfg.nats.url == "" {
		cfg.nats.url = "nats://localhost:4222"
	}

	cfg.nats.creds = os.Getenv("NATS_CREDS")
	if cfg.nats.creds == "" {
		cfg.nats.creds = "synadia.creds"
	}

	cfg.db.uri = os.Getenv("SQLSERVER_URI")
	if cfg.db.uri == "" {
		// Default to local SQL Server for development
		cfg.db.uri = "sqlserver://sa:SalesW0rk5@localhost:1433?database=ERPXL_GO&trustServerCertificate=true"
	}

	openConns, _ := strconv.Atoi(os.Getenv("DB_MAX_OPEN_CONNS"))
	if openConns == 0 {
		openConns = 10
	}
	cfg.db.maxOpenConns = openConns

	idleConns, _ := strconv.Atoi(os.Getenv("DB_MAX_IDLE_CONNS"))
	if idleConns == 0 {
		idleConns = 10
	}
	cfg.db.maxIdleConns = idleConns

	idleTime, err := time.ParseDuration(os.Getenv("DB_MAX_IDLE_TIME"))
	if err != nil {
		idleTime = 5 * time.Minute
	}
	cfg.db.maxIdleTime = idleTime

	numberWorkers, err := strconv.Atoi(os.Getenv("DISPATCHER_NUM_WORKERS"))
	if err != nil || numberWorkers <= 0 {
		numberWorkers = 10
	}
	cfg.disp.numWorkers = numberWorkers

	jobQueueSize, err := strconv.Atoi(os.Getenv("DISPATCHER_JOB_QUEUE_SIZE"))
	if err != nil || jobQueueSize <= 0 {
		jobQueueSize = 100
	}
	cfg.disp.jobQueueSize = jobQueueSize

	cfg.db.path = os.Getenv("DB_PATH")
	if cfg.db.path == "" {
		cfg.db.path = "./.data/bbolt.db"
	}

	cfg.aggPath = os.Getenv("AGG_PATH")
	if cfg.aggPath == "" {
		cfg.aggPath = "./aggregates.yaml"
	}

	return cfg
}

func newLogger(ctx context.Context, env string, logCfg loggerConfig) *slog.Logger {
	var handler slog.Handler

	if env == "development" {
		handler = slog.NewTextHandler(os.Stdout, &slog.HandlerOptions{Level: slog.LevelDebug})
	} else {
		lumberjackLogger := &lumberjack.Logger{
			Filename:   logCfg.Filename,
			MaxSize:    logCfg.MaxSize,
			MaxBackups: logCfg.MaxBackups,
			MaxAge:     logCfg.MaxAge,
			Compress:   logCfg.Compress,
		}

		handler = slog.NewTextHandler(lumberjackLogger, &slog.HandlerOptions{
			Level: slog.LevelInfo,
		})
	}
	return slog.New(handler)
}
