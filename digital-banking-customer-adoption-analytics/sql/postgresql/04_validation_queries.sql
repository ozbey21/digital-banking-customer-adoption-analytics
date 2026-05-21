/*
Validation queries for PostgreSQL.
Run after 01_schema.sql, 02_seed_data.sql and 03_kpi_views.sql.
*/

-- Expected: 5 rows.
SELECT COUNT(*) AS sector_row_count
FROM sector_tbb;

-- Expected: 15 rows.
SELECT COUNT(*) AS bank_core_row_count
FROM bank_core_metrics;

-- Expected: 15 rows.
SELECT COUNT(*) AS bank_kpi_row_count
FROM bank_kpis;

-- Expected: 3 banks, 5 rows per bank.
SELECT
    bank_name,
    COUNT(*) AS rows_per_bank,
    MIN(year) AS first_year,
    MAX(year) AS last_year
FROM bank_core_metrics
GROUP BY bank_name
ORDER BY bank_name;

-- Basic KPI preview.
SELECT *
FROM bank_kpis
ORDER BY bank_name, year;
