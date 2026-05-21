/*
Digital Banking Customer Adoption & Channel Migration Analytics
SQL Server / T-SQL schema script
*/

DROP VIEW IF EXISTS dbo.digital_adoption_index_2025;
DROP VIEW IF EXISTS dbo.digital_adoption_index_2025_equal_weight;
DROP VIEW IF EXISTS dbo.bank_kpis;
GO

DROP TABLE IF EXISTS dbo.supporting_indicators;
DROP TABLE IF EXISTS dbo.bank_core_metrics;
DROP TABLE IF EXISTS dbo.sector_tbb;
GO

CREATE TABLE dbo.sector_tbb (
    year INT PRIMARY KEY,
    only_internet_customers_m DECIMAL(18,3),
    only_mobile_customers_m DECIMAL(18,3),
    both_internet_mobile_customers_m DECIMAL(18,3),
    total_active_digital_customers_m DECIMAL(18,3),
    only_mobile_share_pct DECIMAL(18,2),
    only_internet_share_pct DECIMAL(18,2),
    both_channel_share_pct DECIMAL(18,2),
    total_yoy_growth_pct DECIMAL(18,2),
    methodology_note NVARCHAR(MAX)
);
GO

CREATE TABLE dbo.bank_core_metrics (
    bank_name NVARCHAR(100) NOT NULL,
    year INT NOT NULL,
    reported_customer_base DECIMAL(18,2),
    digital_customers DECIMAL(18,2),
    branches DECIMAL(18,2),
    employees DECIMAL(18,2),
    atms DECIMAL(18,2),
    data_quality NVARCHAR(100),
    customer_base_definition NVARCHAR(MAX),
    digital_customer_definition NVARCHAR(MAX),
    methodology_note NVARCHAR(MAX),
    CONSTRAINT pk_bank_core_metrics PRIMARY KEY (bank_name, year)
);
GO

CREATE TABLE dbo.supporting_indicators (
    indicator_id INT IDENTITY(1,1) PRIMARY KEY,
    bank_name NVARCHAR(100) NOT NULL,
    year INT NOT NULL,
    indicator_name NVARCHAR(200) NOT NULL,
    indicator_value DECIMAL(18,4),
    unit NVARCHAR(100),
    indicator_category NVARCHAR(100),
    usage_note NVARCHAR(MAX),
    comparability_level NVARCHAR(100),
    source_note NVARCHAR(MAX)
);
GO
