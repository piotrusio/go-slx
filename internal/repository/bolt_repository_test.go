package repository

import (
	"context"
	"io"
	"log/slog"
	"path/filepath"
	"testing"

	"github.com/stretchr/testify/assert"
	"github.com/stretchr/testify/require"
	"go.etcd.io/bbolt"
)

func TestBBoltRepository_RegisterAggregates(t *testing.T) {
	// --- Arrange ---
	tempDir := t.TempDir()
	dbPath := filepath.Join(tempDir, "test.db")
	logger := slog.New(slog.NewTextHandler(io.Discard, nil))
	ctx := context.Background()

	repo, err := NewBBoltRepository(dbPath, logger)
	require.NoError(t, err, "NewBBoltRepository should not return an error")
	defer repo.Close()

	aggregates := []string{"users", "orders", "products"}

	// --- Act ---
	err = repo.RegisterAggregates(ctx, aggregates)
	require.NoError(t, err, "RegisterAggregates should not return an error")

	// --- Assert ---
	err = repo.db.View(func(tx *bbolt.Tx) error {
		b := tx.Bucket([]byte("aggregates"))
		require.NotNil(t, b, "aggregates bucket should exist")

		for _, name := range aggregates {
			value := b.Get([]byte(name))
			assert.NotNil(t, value, "aggregate '%s' should exist", name)
			assert.Equal(t, "0", string(value), "counter should be '0' for aggregate '%s'", name)
		}
		return nil
	})
	require.NoError(t, err, "database verification should not return an error")
}

func TestBBoltRepository_UpdateChangeVersion(t *testing.T) {
	// --- Arrange ---
	tempDir := t.TempDir()
	dbPath := filepath.Join(tempDir, "test.db")
	logger := slog.New(slog.NewTextHandler(io.Discard, nil))
	ctx := context.Background()

	repo, err := NewBBoltRepository(dbPath, logger)
	require.NoError(t, err, "NewBBoltRepository should not return an error")
	defer repo.Close()

	// Register aggregate first
	err = repo.RegisterAggregates(ctx, []string{"test_aggregate"})
	require.NoError(t, err, "RegisterAggregates should not return an error")

	// --- Act ---
	err = repo.UpdateChangeVersion(ctx, "test_aggregate", int64(42))

	// --- Assert ---
	require.NoError(t, err, "UpdateChangeVersion should not return an error")

	// Verify the update worked
	version, err := repo.GetChangeVersion(ctx, "test_aggregate")
	require.NoError(t, err, "GetChangeVersion should not return an error")
	assert.Equal(t, int64(42), version, "should return the updated version")
}

func TestBBoltRepository_GetChangeVersion(t *testing.T) {
	// --- Arrange ---
	tempDir := t.TempDir()
	dbPath := filepath.Join(tempDir, "test.db")
	logger := slog.New(slog.NewTextHandler(io.Discard, nil))
	ctx := context.Background()

	repo, err := NewBBoltRepository(dbPath, logger)
	require.NoError(t, err, "NewBBoltRepository should not return an error")
	defer repo.Close()

	// Register and update version
	err = repo.RegisterAggregates(ctx, []string{"test_aggregate"})
	require.NoError(t, err, "RegisterAggregates should not return an error")
	err = repo.UpdateChangeVersion(ctx, "test_aggregate", int64(5))
	require.NoError(t, err, "UpdateChangeVersion should not return an error")

	// --- Act ---
	version, err := repo.GetChangeVersion(ctx, "test_aggregate")

	// --- Assert ---
	require.NoError(t, err, "GetChangeVersion should not return an error")
	assert.Equal(t, int64(5), version, "should return the updated version")
}
