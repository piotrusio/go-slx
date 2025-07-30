package tracker

import (
	"context"
	"database/sql"
	"fmt"
)

type ChangeEvent struct {
	ChangeOperation string `json:"change_operation"`
	ChangeVersion   int64  `json:"change_version"`
	AggregateKey    string `json:"aggregate_key"`
	Payload         string `json:"payload"`
}

func (t *Tracker) runErpCycle(ctx context.Context, agregateName, getQuery string) error {
	lastVersion, err := t.repository.GetChangeVersion(ctx, agregateName)
	if err != nil {
		t.logger.Error("failed to get last change version", "aggregate", agregateName, "error", err)
		return fmt.Errorf("failed to get last change version: %w", err)
	}

	count, version, err := t.fetchErpChanges(ctx, getQuery, lastVersion)
	if err != nil {
		t.logger.Error("failed to fetch ERP changes", "aggregate", agregateName, "error", err)
		return fmt.Errorf("failed to fetch ERP changes: %w", err)
	}
	if count == 0 {
		t.logger.Info("no changes found for aggregate", "name", agregateName)
		return nil
	}

	err = t.repository.UpdateChangeVersion(ctx, agregateName, version)
	if err != nil {
		t.logger.Error("failed to update change version", "aggregate", agregateName, "error", err)
		return fmt.Errorf("failed to update change version: %w", err)
	}

	t.logger.Info("ERP cycle completed", "aggregate", agregateName, "updated version", version)

	return nil
}

func (t *Tracker) fetchErpChanges(ctx context.Context, query string, version int64) (int, int64, error) {
	rows, err := t.db.QueryContext(ctx, query, sql.Named("version", version))
	if err != nil {
		t.logger.Error("failed to execute query", "query", query, "error", err)
		return 0, 0, fmt.Errorf("query execution failed for query '%s': %w", query, err)
	}
	defer rows.Close()

	var counter int
	var maxVersion int64 = version
	for rows.Next() {
		var event ChangeEvent
		if err := rows.Scan(
			&event.ChangeOperation,
			&event.ChangeVersion,
			&event.AggregateKey,
			&event.Payload,
		); err != nil {
			t.logger.Error("failed to scan row", "error", err)
			return 0, 0, fmt.Errorf("row scan failed: %w", err)
		}
		if event.ChangeVersion > maxVersion {
			maxVersion = event.ChangeVersion
		}
		// dispatch the change event
		err := t.dispatchErpChange(ctx, event)
		if err != nil {
			t.logger.Error("failed to dispatch ERP change", "event", event, "error", err)
			return 0, 0, fmt.Errorf("failed to dispatch ERP change: %w", err)
		}
		counter++
	}
	if err := rows.Err(); err != nil {
		t.logger.Error("error encountered during row iteration", "error", err)
		return 0, 0, fmt.Errorf("row iteration error: %w", err)
	}

	return counter, maxVersion, nil
}

// dispatchErpChanges is a placeholder for the actual implementation of dispatching ERP changes.
func (t *Tracker) dispatchErpChange(ctx context.Context, changeEvent interface{}) error {
	return nil
}
