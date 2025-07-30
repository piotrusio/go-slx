package tracker

import (
	"bytes"
	"context"
	"database/sql"
	"fmt"
	"log/slog"
	"os"
	"time"

	"gopkg.in/yaml.v3"
)

// TrackerRepository defines the interface for the tracker repository
type TrackerRepository interface {
	// RegisterAggregates registers the names of aggregates in the repository and sets change_version
	RegisterAggregates(ctx context.Context, aggregates []string) error
	// GetChangeVersion returns the last change version for the given aggregate name
	GetChangeVersion(ctx context.Context, aggregateName string) (int64, error)
	// UpdateChangeVersion updates the change version for the given aggregate name
	UpdateChangeVersion(ctx context.Context, aggregateName string, newVersion int64) error
}

// Aggregate represents an aggregate with its name and query
type Aggregate struct {
	Name     string `yaml:"name"`
	Interval int    `yaml:"interval"`
	GetQuery string `yaml:"get_query"`
	// InsertCommand string `yaml:"insert_command"`
	// UpdateCommand string `yaml:"update_command"`
	// DeleteCommand string `yaml:"delete_command"`
}

type Config struct {
	Aggregates []Aggregate `yaml:"aggregates"`
}

type Tracker struct {
	aggregates []Aggregate
	repository TrackerRepository
	logger     *slog.Logger
	db         *sql.DB
}

func NewTracker(
	ctx context.Context, aggregatesPath string, repo TrackerRepository, logger *slog.Logger, db *sql.DB,
) (*Tracker, error) {
	yamlFile, err := os.ReadFile(aggregatesPath)
	if err != nil {
		logger.Error("failed to read aggregates file", "path", aggregatesPath, "error", err)
		return nil, fmt.Errorf("failed to read aggregates file: %w", err)
	}

	tracker := &Tracker{
		repository: repo,
		logger:     logger,
		db:         db,
	}

	var config Config

	decoder := yaml.NewDecoder(bytes.NewReader(yamlFile))
	decoder.KnownFields(true)
	err = decoder.Decode(&config)

	if err != nil {
		logger.Error("failed to unmarshal aggregates file", "path", aggregatesPath, "error", err)
		return nil, fmt.Errorf("failed to unmarshal aggregates file: %w", err)
	}

	tracker.aggregates = config.Aggregates

	aggregateNames := make([]string, len(tracker.aggregates))
	for i, aggregate := range tracker.aggregates {
		aggregateNames[i] = aggregate.Name
	}

	err = tracker.repository.RegisterAggregates(ctx, aggregateNames)
	if err != nil {
		logger.Error("failed to save aggregates", "error", err)
		return nil, fmt.Errorf("failed to save aggregates: %w", err)
	}

	logger.Info("tracker initialized", "aggregates_count", len(tracker.aggregates))
	return tracker, nil
}

func (t *Tracker) Start(ctx context.Context) error {
	for _, aggregate := range t.aggregates {

		// Start a goroutine for each aggregate to run erp changes cycle
		go func(ctx context.Context, agg Aggregate) {
			ticker := time.NewTicker(time.Duration(agg.Interval) * time.Second)
			defer ticker.Stop()
			for {
				select {
				case <-ctx.Done():
					t.logger.Info("tracker stopping", "reason", ctx.Err())
					return
				case <-ticker.C:
					// runErpChangesCycle(agg.Name, agg.GetQuery)
					t.logger.Debug("running erp cycle for aggregate", "name", agg.Name)
				}
			}
		}(ctx, aggregate)

		// Start a goroutine for each aggregate to run app changes cycle
		go func(ctx context.Context, agg Aggregate) {
			ticker := time.NewTicker(time.Duration(agg.Interval) * time.Second)
			defer ticker.Stop()
			for {
				select {
				case <-ctx.Done():
					t.logger.Info("tracker stopping", "reason", ctx.Err())
					return
				case <-ticker.C:
					// t.runAppChangesCycle(agg)
					t.logger.Debug("running app cycle for aggregate", "name", agg.Name)
				}
			}
		}(ctx, aggregate)
	}
	return nil
}
