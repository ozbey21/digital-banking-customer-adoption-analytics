/*
Digital Banking Customer Adoption & Channel Migration Analytics
PostgreSQL schema script

Purpose:
Creates the core analytical tables for sector-level TBB data,
selected bank core metrics, and supporting indicators.
*/

DROP VIEW IF EXISTS digital_adoption_index_2025;
DROP VIEW IF EXISTS digital_adoption_index_2025_equal_weight;
DROP VIEW IF EXISTS bank_kpis;

DROP TABLE IF EXISTS supporting_indicators;
DROP TABLE IF EXISTS bank_core_metrics;
DROP TABLE IF EXISTS sector_tbb;

CREATE TABLE sector_tbb (
    year INTEGER PRIMARY KEY,
    only_internet_customers_m NUMERIC(18,3),
    only_mobile_customers_m NUMERIC(18,3),
    both_internet_mobile_customers_m NUMERIC(18,3),
    total_active_digital_customers_m NUMERIC(18,3),
    only_mobile_share_pct NUMERIC(18,2),
    only_internet_share_pct NUMERIC(18,2),
    both_channel_share_pct NUMERIC(18,2),
    total_yoy_growth_pct NUMERIC(18,2),
    methodology_note TEXT
);

CREATE TABLE bank_core_metrics (
    bank_name TEXT NOT NULL,
    year INTEGER NOT NULL,
    reported_customer_base NUMERIC(18,2),
    digital_customers NUMERIC(18,2),
    branches NUMERIC(18,2),
    employees NUMERIC(18,2),
    atms NUMERIC(18,2),
    data_quality TEXT,
    customer_base_definition TEXT,
    digital_customer_definition TEXT,
    methodology_note TEXT,
    PRIMARY KEY (bank_name, year)
);

CREATE TABLE supporting_indicators (
    indicator_id SERIAL PRIMARY KEY,
    bank_name TEXT NOT NULL,
    year INTEGER NOT NULL,
    indicator_name TEXT NOT NULL,
    indicator_value NUMERIC(18,4),
    unit TEXT,
    indicator_category TEXT,
    usage_note TEXT,
    comparability_level TEXT,
    source_note TEXT
);
