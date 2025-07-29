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

	"github.com/getsentry/sentry-go"
	"github.com/nats-io/nats.go"
	"gworks.dev/slx/internal/database"

	sentryslog "github.com/getsentry/sentry-go/slog"
)

type config struct {
	env    string
	db     dbConfig
	nats   publisherConfig
	sentry loggerConfig
}

type dbConfig struct {
	uri          string
	maxOpenConns int
	maxIdleConns int
	maxIdleTime  time.Duration
}

type publisherConfig struct {
	url   string
	creds string
}

type loggerConfig struct {
	DSN string
}

func main() {
	if err := run(); err != nil {
		fmt.Printf("Error: %v\n", err)
		os.Exit(1)
	}
}

func run() error {
	cfg := loadConfig()

	// Initialize Sentry SDK for non-development environments
	if cfg.env != "development" && cfg.sentry.DSN != "" {
		err := sentry.Init(sentry.ClientOptions{
			Dsn:        cfg.sentry.DSN,
			EnableLogs: true,
		})
		if err != nil {
			fmt.Fprintf(os.Stderr, "sentry.Init: %s", err)
			os.Exit(1)
		}
		// Flush buffered events before the program terminates.
		// Set the timeout to the maximum duration the program can afford to wait.
		defer sentry.Flush(2 * time.Second)
	}
	logger := newLogger(context.Background(), cfg.env)
	logger.Info("SLX Service Starting", "env", cfg.env)

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
	logger.Info("succesfully connected to sqlserver database")

	// 	Setup NATS connection
	if cfg.nats.url == "" {
		return fmt.Errorf("NATS_URL is not configured")
	}

	if cfg.nats.creds == "" {
		return fmt.Errorf("NATS_CREDS is not configured")
	}

	natsconn, err := nats.Connect(cfg.nats.url, nats.UserCredentials(cfg.nats.creds))
	if err != nil {
		return fmt.Errorf("failed to connect to NATS: %w", err)
	}
	defer natsconn.Close()
	logger.Info("connected to NATS server", "url", cfg.nats.url)

	go func(logger *slog.Logger, appCtx context.Context) {
		ticker := time.NewTicker(10 * time.Second)
		defer ticker.Stop()

		for {
			select {
			case <-appCtx.Done():
				logger.Info("app context done, stopping ticker")
				return
			case <-ticker.C:
				logger.Info("ticker ticked", "time", time.Now().Format(time.RFC3339))
			}
		}
	}(logger, appCtx)

	<-appCtx.Done()
	logger.Info("shutdown initiated", "signal", "termination")

	// shutdownCtx, shutdownCancel := context.WithTimeout(context.Background(), 10*time.Second)
	// defer shutdownCancel()

	var shutdownErr error
	logger.Info("service exiting.")
	return shutdownErr
}

func loadConfig() config {
	var cfg config

	cfg.env = os.Getenv("ENV")
	if cfg.env == "" {
		cfg.env = "development"
	}

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
		cfg.db.uri = "sqlserver://sa:SalesW0rk5@localhost:1433?database=GOWORKS&trustServerCertificate=true"
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

	return cfg
}

func newLogger(ctx context.Context, env string) *slog.Logger {
	var handler slog.Handler
	if env != "development" {
		handler = sentryslog.Option{
			// Only Error level will be sent as events
			EventLevel: []slog.Level{slog.LevelError},
			// Only Warn and Info levels will be sent as logs
			LogLevel: []slog.Level{slog.LevelWarn, slog.LevelInfo},
		}.NewSentryHandler(ctx)
	} else {
		// Default to console for development or if no log file is specified.
		handler = slog.NewTextHandler(os.Stdout, &slog.HandlerOptions{Level: slog.LevelDebug})
	}
	return slog.New(handler)
}
