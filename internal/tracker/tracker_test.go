package tracker

import (
	"context"
	"io"
	"log/slog"
	"os"
	"testing"
	"time"

	"github.com/stretchr/testify/assert"
	"github.com/stretchr/testify/require"
)

type mockTrackerRepository struct {
	RegisterAggregatesCalled bool
	errToReturn              error
}

func (m *mockTrackerRepository) RegisterAggregates(ctx context.Context, aggregates []string) error {
	if m.errToReturn != nil {
		return m.errToReturn
	}
	m.RegisterAggregatesCalled = true
	return nil
}

func TestTracker_NewTracker_HappyPath(t *testing.T) {
	// --- Arrange ---
	trackerRepo := &mockTrackerRepository{}
	logger := slog.New(slog.NewTextHandler(io.Discard, nil))
	ctx, cancel := context.WithTimeout(context.Background(), 250*time.Millisecond)
	defer cancel()

	tempDir := t.TempDir()
	testFile := tempDir + "/aggregates.yaml"
	testContent := `aggregates:
  - name: "fabric"
    get_query: |
      SELECT *
      FROM CHANGETABLE(CHANGES ERPXL_GO.CDN.TwrKarty, @version) AS c

  - name: "customer"
    get_query: |
      SELECT *
      FROM CHANGETABLE(CHANGES ERPXL_GO.CDN.KntKarty, @version) AS c
`

	err := os.WriteFile(testFile, []byte(testContent), 0644)
	if err != nil {
		t.Fatalf("failed to create test file: %v", err)
	}

	tracker, err := NewTracker(ctx, testFile, trackerRepo, logger)
	require.NoError(t, err, "NewTracker should not return an error")

	// --- Assert ---
	assert.NotNil(t, tracker, "ChangeTracker should not be nil")
	assert.True(t, trackerRepo.RegisterAggregatesCalled, "Save method should be called on the repository")
	assert.Equal(t, 2, len(tracker.aggregates), "Expected 2 aggregates")
	assert.Equal(t, "fabric", tracker.aggregates[0].Name, "Expected first aggregate name to be 'fabric'")
	assert.Equal(t, "customer", tracker.aggregates[1].Name, "Expected second aggregate name to be 'customer'")
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
	trackerRepo := &mockTrackerRepository{}
	logger := slog.New(slog.NewTextHandler(io.Discard, nil))
	ctx, cancel := context.WithTimeout(context.Background(), 250*time.Millisecond)
	defer cancel()

	tempDir := t.TempDir()
	testFile := tempDir + "/invalid_aggregates.yaml"
	testContent := `aggregates:
  - name: "fabric"
    get_query: |
      SELECT *
      FROM CHANGETABLE(CHANGES ERPXL_GO.CDN.TwrKarty, @version) AS c
  - name: "customer"
    get_query: |
      SELECT *
      FROM CHANGETABLE(CHANGES ERPXL_GO.CDN.KntKarty, @version) AS c
    extra_field: "unexpected"  # This should cause an error
`

	err := os.WriteFile(testFile, []byte(testContent), 0644)
	if err != nil {
		t.Fatalf("failed to create test file: %v", err)
	}

	// --- Act ---
	tracker, err := NewTracker(ctx, testFile, trackerRepo, logger)

	// --- Assert ---
	assert.Nil(t, tracker, "ChangeTracker should be nil")
	assert.Error(t, err, "Expected an error due to invalid YAML structure")
}
