package tracker

import (
	"context"
	"io"
	"log/slog"
	"regexp"
	"testing"
	"time"

	"github.com/DATA-DOG/go-sqlmock"
	"github.com/stretchr/testify/assert"
	"github.com/stretchr/testify/require"
)

func TestTracker_RunErpCycle_HappyPath(t *testing.T) {
	// --- Arrange ---
	trackerRepo := &mockTrackerRepository{}
	logger := slog.New(slog.NewTextHandler(io.Discard, nil))

	db, mock, err := sqlmock.New()
	require.NoError(t, err)
	defer db.Close()

	ctx, cancel := context.WithTimeout(context.Background(), 250*time.Millisecond)
	defer cancel()

	tracker := &Tracker{
		aggregates: []Aggregate{{Name: "fabric"}, {Name: "customer"}},
		repository: trackerRepo,
		logger:     logger,
		db:         db,
	}
	query := "SELECT * FROM changes WHERE version > @version"
	// version := int64(0)

	mock.ExpectQuery(regexp.QuoteMeta(query)).WithArgs(sqlmock.AnyArg()).WillReturnRows(
		sqlmock.NewRows([]string{"change_operation", "change_version", "aggregate_key", "payload"}).
			AddRow("I", 1, "C4CA4238A0B923820DCC509A6F75849A", `{}`).
			AddRow("U", 1, "C4CA4238A0B923820DCC509A6F75849B", `{}`).
			AddRow("D", 1, "C4CA4238A0B923820DCC509A6F75849C", `{}`),
	)
	// --- Act ---
	err = tracker.runErpCycle(ctx, "fabric", query)
	require.NoError(t, err, "runErpCycle should start without error")

	// --- Assert ---
	assert.True(t, trackerRepo.GetChangeVersionCalled, "GetChangeVersion should be called")
	assert.True(t, trackerRepo.UpdateChangeVersionCalled, "UpdateChangeVersion should not be called")
}

func TestTracker_RunErpCycle_FetchErpChanges(t *testing.T) {
	// --- Arrange ---
	trackerRepo := &mockTrackerRepository{}
	logger := slog.New(slog.NewTextHandler(io.Discard, nil))

	db, mock, err := sqlmock.New()
	require.NoError(t, err)
	defer db.Close()

	tracker := &Tracker{
		aggregates: []Aggregate{{Name: "fabric"}, {Name: "customer"}},
		repository: trackerRepo,
		logger:     logger,
		db:         db,
	}
	query := "SELECT * FROM changes WHERE version > @version"
	version := int64(0)

	mock.ExpectQuery(regexp.QuoteMeta(query)).WithArgs(sqlmock.AnyArg()).WillReturnRows(
		sqlmock.NewRows([]string{"change_operation", "change_version", "aggregate_key", "payload"}).
			AddRow("I", 1, "C4CA4238A0B923820DCC509A6F75849A", `{}`).
			AddRow("U", 1, "C4CA4238A0B923820DCC509A6F75849B", `{}`).
			AddRow("D", 1, "C4CA4238A0B923820DCC509A6F75849C", `{}`),
	)

	// trackerRepo := &mockTrackerRepository{}
	// logger := slog.New(slog.NewTextHandler(io.Discard, nil))
	ctx, cancel := context.WithTimeout(context.Background(), 250*time.Millisecond)
	defer cancel()

	// --- Act ---
	counter, ver, err := tracker.fetchErpChanges(ctx, query, version)
	require.NoError(t, err, "runErpCycle should start without error")

	// --- Assert ---
	assert.Equal(t, counter, 3, "fetchErpChanges should return 3 change events")
	assert.Equal(t, int64(1), ver, "fetchErpChanges should return new version 1")
}
