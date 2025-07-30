package tracker

import (
	"bytes"
	"context"
	"fmt"
	"log/slog"
	"os"

	"gopkg.in/yaml.v3"
)

type TrackerRepository interface {
	RegisterAggregates(ctx context.Context, aggregates []string) error
}

type Aggregate struct {
	Name     string `yaml:"name"`
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
	logger     *slog.Logger
}

func NewTracker(
	ctx context.Context, aggregatesPath string, repo TrackerRepository, logger *slog.Logger,
) (*Tracker, error) {
	yamlFile, err := os.ReadFile(aggregatesPath)
	if err != nil {
		logger.Error("failed to read aggregates file", "path", aggregatesPath, "error", err)
		return nil, fmt.Errorf("failed to read aggregates file: %w", err)
	}

	tracker := &Tracker{
		logger: logger,
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

	err = repo.RegisterAggregates(ctx, aggregateNames)
	if err != nil {
		logger.Error("failed to save aggregates", "error", err)
		return nil, fmt.Errorf("failed to save aggregates: %w", err)
	}

	logger.Info("tracker initialized", "aggregates_count", len(tracker.aggregates))
	return tracker, nil
}

// start() will start goroutines for each aggregate
// - validate if aggregate name is registered -> table called
// - validate if change_tracking is enabled -> tables used in query
// - provide for each goroutine separate interval
// - provide for each goroutine Aggregate struct with its own parameteres
