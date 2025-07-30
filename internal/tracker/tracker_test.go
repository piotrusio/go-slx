package tracker

import (
	"context"
	"io"
	"log/slog"
	"os"
	"runtime"
	"testing"
	"time"

	"github.com/DATA-DOG/go-sqlmock"
	"github.com/stretchr/testify/assert"
	"github.com/stretchr/testify/require"
)

type mockTrackerRepository struct {
	RegisterAggregatesCalled  bool
	GetChangeVersionCalled    bool
	UpdateChangeVersionCalled bool
	errToReturn               error
}

func (m *mockTrackerRepository) RegisterAggregates(ctx context.Context, aggregates []string) error {
	if m.errToReturn != nil {
		return m.errToReturn
	}
	m.RegisterAggregatesCalled = true
	return nil
}

func (m *mockTrackerRepository) GetChangeVersion(
	ctx context.Context, aggregateName string,
) (int64, error) {
	if m.errToReturn != nil {
		return 0, m.errToReturn
	}
	m.GetChangeVersionCalled = true
	return 1, nil
}

func (m *mockTrackerRepository) UpdateChangeVersion(
	ctx context.Context, aggregateName string, newVersion int64,
) error {
	if m.errToReturn != nil {
		return m.errToReturn
	}
	m.UpdateChangeVersionCalled = true
	return nil
}

func TestTracker_NewTracker_HappyPath(t *testing.T) {
	// --- Arrange ---
	db, _, err := sqlmock.New()
	if err != nil {
		t.Fatalf("an error '%s' was not expected when opening a stub database connection", err)
	}
	defer db.Close()
	trackerRepo := &mockTrackerRepository{}
	logger := slog.New(slog.NewTextHandler(io.Discard, nil))
	ctx, cancel := context.WithTimeout(context.Background(), 250*time.Millisecond)
	defer cancel()

	tempDir := t.TempDir()
	testFile := tempDir + "/aggregates.yaml"
	testContent := `aggregates:
  - name: "fabric"
    interval: 60
    get_query: |
      SELECT *
      FROM CHANGETABLE(CHANGES ERPXL_GO.CDN.TwrKarty, @version) AS c

  - name: "customer"
    interval: 30
    get_query: |
      SELECT *
      FROM CHANGETABLE(CHANGES ERPXL_GO.CDN.KntKarty, @version) AS c
`

	err = os.WriteFile(testFile, []byte(testContent), 0644)
	if err != nil {
		t.Fatalf("failed to create test file: %v", err)
	}

	tracker, err := NewTracker(ctx, testFile, trackerRepo, logger, db)
	require.NoError(t, err, "NewTracker should not return an error")

	// --- Assert ---
	assert.NotNil(t, tracker, "ChangeTracker should not be nil")
	assert.Equal(t, trackerRepo, tracker.repository, "expected tracker.repository to be set")
	assert.True(t, trackerRepo.RegisterAggregatesCalled, "registerAggregates should be called")
	assert.Equal(t, 2, len(tracker.aggregates), "expected 2 aggregates")
	assert.Equal(t, "fabric", tracker.aggregates[0].Name, "expected aggregate name to be 'fabric'")
	assert.Equal(t, "customer", tracker.aggregates[1].Name, "expected aggregate name to be 'customer'")
	assert.Equal(
		t,
		"SELECT *\nFROM CHANGETABLE(CHANGES ERPXL_GO.CDN.TwrKarty, @version) AS c\n",
		tracker.aggregates[0].GetQuery,
		"Expected first aggregate get_query to match",
	)
	assert.Equal(
		t,
		"SELECT *\nFROM CHANGETABLE(CHANGES ERPXL_GO.CDN.KntKarty, @version) AS c\n",
		tracker.aggregates[1].GetQuery,
		"Expected second aggregate get_query to match",
	)
}

// TestTracker_NewTracker_InvalidFile tests the error handling when the aggregates file is invalid.
func TestTracker_NewTracker_InvalidFile(t *testing.T) {
	// --- Arrange ---
	db, _, err := sqlmock.New()
	if err != nil {
		t.Fatalf("an error '%s' was not expected when opening a stub database connection", err)
	}
	defer db.Close()
	trackerRepo := &mockTrackerRepository{}
	logger := slog.New(slog.NewTextHandler(io.Discard, nil))
	ctx, cancel := context.WithTimeout(context.Background(), 250*time.Millisecond)
	defer cancel()

	tempDir := t.TempDir()
	testFile := tempDir + "/invalid_aggregates.yaml"
	testContent := `aggregates:
  - name: "fabric"
  - name: "customer"
    extra_field: "unexpected"  # This should cause an error
`

	err = os.WriteFile(testFile, []byte(testContent), 0644)
	if err != nil {
		t.Fatalf("failed to create test file: %v", err)
	}

	// --- Act ---
	tracker, err := NewTracker(ctx, testFile, trackerRepo, logger, db)

	// --- Assert ---
	assert.Nil(t, tracker, "changeTracker should be nil")
	assert.Error(t, err, "expected an error due to invalid YAML structure")
}

func TestTracker_Start_TrackErpChanges(t *testing.T) {
	// --- Arrange ---
	trackerRepo := &mockTrackerRepository{}
	logger := slog.New(slog.NewTextHandler(io.Discard, nil))
	ctx, cancel := context.WithTimeout(context.Background(), 3*time.Second)
	defer cancel()

	tracker := &Tracker{
		aggregates: []Aggregate{
			{
				Name:     "fabric",
				Interval: 1,
				GetQuery: "SELECT * FROM ERPXL_GO.CDN.TwrKarty",
			},
			{
				Name:     "customer",
				Interval: 1,
				GetQuery: "SELECT * FROM ERPXL_GO.CDN.KntKarty",
			},
		},
		repository: trackerRepo,
		logger:     logger,
	}

	// --- Act ---
	initialCount := runtime.NumGoroutine()
	err := tracker.Start(ctx)
	require.NoError(t, err, "Start should not return an error")
	// Allow some time for goroutines to start
	time.Sleep(100 * time.Millisecond)
	afterCount := runtime.NumGoroutine()
	<-ctx.Done()

	// --- Assert ---
	expectedIncrease := len(tracker.aggregates) * 2
	actualIncrease := afterCount - initialCount
	assert.Equal(
		t, expectedIncrease, actualIncrease,
		"expected goroutines to increase by %d, got %d", expectedIncrease, actualIncrease,
	)
}
