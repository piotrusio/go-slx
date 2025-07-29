package database

import (
	"context"
	"database/sql"
	"fmt"
	"log/slog"
	"time"

	_ "github.com/microsoft/go-mssqldb"
)

// SQLServer implements the storage.StateStore interface for Microsoft SQL Server.
type SQLServer struct {
	Pool   *sql.DB
	logger *slog.Logger
}

// New creates a new SQL Server database connection pool.
func New(
	ctx context.Context, uri string, maxOpenConns, maxIdleConns int,
	maxIdleTime time.Duration, logger *slog.Logger,
) (*SQLServer, error) {

	if uri == "" {
		return nil, fmt.Errorf("database uri string is empty")
	}

	pool, err := sql.Open("sqlserver", uri)
	if err != nil {
		return nil, fmt.Errorf("failed to open database connection: %w", err)
	}

	pool.SetMaxOpenConns(maxOpenConns)
	pool.SetMaxIdleConns(maxIdleConns)
	pool.SetConnMaxIdleTime(maxIdleTime)

	// Verify the connection with a ping and timeout (use startup context)
	pingCtx, cancel := context.WithTimeout(ctx, 5*time.Second)
	defer cancel()

	err = pool.PingContext(pingCtx)
	if err != nil {
		// Ensure pool is closed if ping fails to prevent leaks
		if closeErr := pool.Close(); closeErr != nil {
			logger.Error("Failed to close pool after ping error",
				"closeError", closeErr)
		}
		logger.Error("Database ping failed", "error", err)
		// Don't wrap the original driver error directly in production
		// logs to avoid leaking details.
		return nil, fmt.Errorf("unable to verify database connection")
	}

	logger.Info("Database connection pool established",
		"maxOpenConns", maxOpenConns,
		"maxIdleConns", maxIdleConns,
		"maxIdleTime", maxIdleTime,
	)

	// Return the wrapper struct containing the pool and logger
	return &SQLServer{Pool: pool, logger: logger}, nil
}

func (s *SQLServer) Close() {
	if s.Pool != nil {
		s.logger.Info("Closing database connection pool.")
		// sql.DB.Close() waits for connections to be returned before closing.
		if err := s.Pool.Close(); err != nil {
			s.logger.Error("Error closing database connection pool",
				"error", err)
		}
	}
}
