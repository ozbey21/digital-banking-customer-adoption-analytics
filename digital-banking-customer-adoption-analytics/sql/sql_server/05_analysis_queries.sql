/*
Main analysis queries for PostgreSQL.
These queries reproduce the core KPI logic used in the dashboard and README.
*/

-- 1) TBB sector mobile-first trend.
SELECT
    year,
    total_active_digital_customers_m,
    only_mobile_customers_m,
    only_internet_customers_m,
    only_mobile_share_pct,
    only_internet_share_pct,
    total_yoy_growth_pct
FROM dbo.sector_tbb
ORDER BY year;

-- 2) 2025 selected-bank benchmark using core comparable metrics.
SELECT
    bank_name,
    digital_customers,
    reported_customer_base,
    reported_digital_penetration_pct,
    branches,
    employees,
    digital_customers_per_branch,
    digital_customers_per_employee,
    data_quality
FROM dbo.bank_kpis
WHERE year = 2025
ORDER BY digital_customers_per_branch DESC;

-- 3) Digital customer growth from 2021 to 2025.
WITH growth AS (
    SELECT
        bank_name,
        MAX(CASE WHEN year = 2021 THEN digital_customers END) AS digital_customers_2021,
        MAX(CASE WHEN year = 2025 THEN digital_customers END) AS digital_customers_2025
    FROM dbo.bank_core_metrics
    GROUP BY bank_name
)
SELECT
    bank_name,
    digital_customers_2021,
    digital_customers_2025,
    ROUND(((digital_customers_2025 / NULLIF(digital_customers_2021, 0)) - 1) * 100, 1) AS growth_2021_2025_pct
FROM growth
ORDER BY growth_2021_2025_pct DESC;

-- 4) Branch count change from 2021 to 2025.
WITH branch_change AS (
    SELECT
        bank_name,
        MAX(CASE WHEN year = 2021 THEN branches END) AS branches_2021,
        MAX(CASE WHEN year = 2025 THEN branches END) AS branches_2025
    FROM dbo.bank_core_metrics
    GROUP BY bank_name
)
SELECT
    bank_name,
    branches_2021,
    branches_2025,
    ROUND(((branches_2025 / NULLIF(branches_2021, 0)) - 1) * 100, 1) AS branch_change_2021_2025_pct
FROM branch_change
ORDER BY branch_change_2021_2025_pct;

-- 5) Branch-to-digital efficiency uplift.
WITH efficiency AS (
    SELECT
        bank_name,
        MAX(CASE WHEN year = 2021 THEN digital_customers_per_branch END) AS dcpb_2021,
        MAX(CASE WHEN year = 2025 THEN digital_customers_per_branch END) AS dcpb_2025
    FROM dbo.bank_kpis
    GROUP BY bank_name
)
SELECT
    bank_name,
    dcpb_2021 AS digital_customers_per_branch_2021,
    dcpb_2025 AS digital_customers_per_branch_2025,
    ROUND(((dcpb_2025 / NULLIF(dcpb_2021, 0)) - 1) * 100, 1) AS efficiency_uplift_pct
FROM efficiency
ORDER BY efficiency_uplift_pct DESC;

-- 6) Digital growth versus branch change: decoupling gap.
WITH base AS (
    SELECT
        bank_name,
        MAX(CASE WHEN year = 2021 THEN digital_customers END) AS digital_2021,
        MAX(CASE WHEN year = 2025 THEN digital_customers END) AS digital_2025,
        MAX(CASE WHEN year = 2021 THEN branches END) AS branches_2021,
        MAX(CASE WHEN year = 2025 THEN branches END) AS branches_2025
    FROM dbo.bank_core_metrics
    GROUP BY bank_name
)
SELECT
    bank_name,
    ROUND(((digital_2025 / NULLIF(digital_2021, 0)) - 1) * 100, 1) AS digital_growth_pct,
    ROUND(((branches_2025 / NULLIF(branches_2021, 0)) - 1) * 100, 1) AS branch_change_pct,
    ROUND(
        (((digital_2025 / NULLIF(digital_2021, 0)) - 1) * 100)
        - (((branches_2025 / NULLIF(branches_2021, 0)) - 1) * 100),
        1
    ) AS branch_to_digital_decoupling_gap
FROM base
ORDER BY branch_to_digital_decoupling_gap DESC;

-- 7) Digital Adoption Index: base-weight framework.
SELECT
    bank_name,
    reported_digital_penetration_pct,
    digital_customers_per_branch,
    digital_customers_per_employee,
    digital_customer_growth_2021_2025_pct,
    penetration_score,
    branch_efficiency_score,
    employee_efficiency_score,
    growth_score,
    digital_adoption_index,
    index_rank,
    methodology_note
FROM dbo.digital_adoption_index_2025
ORDER BY index_rank;

-- 8) Equal-weight sensitivity check.
SELECT
    bank_name,
    equal_weight_index,
    equal_weight_rank,
    methodology_note
FROM dbo.digital_adoption_index_2025_equal_weight
ORDER BY equal_weight_rank;

-- 9) Supporting mobile/app indicators: not used in core score.
SELECT
    bank_name,
    year,
    indicator_name,
    indicator_value,
    unit,
    usage_note
FROM dbo.supporting_indicators
WHERE indicator_category = 'Mobile/App Channel'
ORDER BY bank_name, year, indicator_name;

-- 10) Supporting POS indicators: not used in core score.
SELECT
    bank_name,
    year,
    indicator_name,
    indicator_value,
    unit,
    usage_note
FROM dbo.supporting_indicators
WHERE indicator_category = 'Payment Infrastructure'
ORDER BY bank_name, year;
