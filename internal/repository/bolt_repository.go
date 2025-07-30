package repository

import (
	"context"
	"fmt"
	"log/slog"

	"go.etcd.io/bbolt"
)

// BBoltRepository implements TrackerRepository using BBolt
type BBoltRepository struct {
	db     *bbolt.DB
	logger *slog.Logger
}

// NewSimpleBBoltRepository creates a new BBolt repository
func NewBBoltRepository(dbPath string, logger *slog.Logger) (*BBoltRepository, error) {
	// Open database (creates if doesn't exist)
	db, err := bbolt.Open(dbPath, 0600, nil)
	if err != nil {
		return nil, fmt.Errorf("failed to open database: %w", err)
	}

	repo := &BBoltRepository{
		db:     db,
		logger: logger,
	}

	return repo, nil
}

// RegisterAggregates inserts aggregate names with counter = 0
func (r *BBoltRepository) RegisterAggregates(ctx context.Context, aggregates []string) error {
	return r.db.Update(func(tx *bbolt.Tx) error {
		b, err := tx.CreateBucketIfNotExists([]byte("aggregates"))
		if err != nil {
			return err
		}
		
		for _, name := range aggregates {
			b.Put([]byte(name), []byte("0"))
		}
		return nil
	})
}

// Close closes the database
func (r *BBoltRepository) Close() error {
	return r.db.Close()
}