USE ERPXL_GO;
GO

-- list tracking database
SELECT b.name as db_name, a.retention_period, a.retention_period_units_desc
FROM sys.change_tracking_databases AS a
	JOIN sys.databases AS b ON a.database_id = b.database_id;

--list tracking tables
SELECT a.object_id as tbl_id, b.name as tbl_name, a.begin_version, a.is_track_columns_updated_on
FROM sys.change_tracking_tables AS a
	JOIN sys.tables AS b on a.object_id = b.object_id
ORDER BY tbl_name;