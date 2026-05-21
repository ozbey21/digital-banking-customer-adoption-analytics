/*
Digital Banking Customer Adoption & Channel Migration Analytics
SQL Server / T-SQL KPI and index view script
*/

DROP VIEW IF EXISTS dbo.digital_adoption_index_2025;
DROP VIEW IF EXISTS dbo.digital_adoption_index_2025_equal_weight;
DROP VIEW IF EXISTS dbo.bank_kpis;
GO

CREATE VIEW dbo.bank_kpis AS
SELECT
    bank_name,
    year,
    reported_customer_base,
    digital_customers,
    branches,
    employees,
    atms,
    ROUND((digital_customers / NULLIF(reported_customer_base, 0)) * 100, 2) AS reported_digital_penetration_pct,
    ROUND(digital_customers / NULLIF(branches, 0), 0) AS digital_customers_per_branch,
    ROUND(digital_customers / NULLIF(employees, 0), 0) AS digital_customers_per_employee,
    ROUND(digital_customers / NULLIF(atms, 0), 0) AS digital_customers_per_atm,
    ROUND(
        ((digital_customers / NULLIF(LAG(digital_customers) OVER (PARTITION BY bank_name ORDER BY year), 0)) - 1) * 100,
        2
    ) AS digital_customer_yoy_growth_pct,
    ROUND(
        ((branches / NULLIF(LAG(branches) OVER (PARTITION BY bank_name ORDER BY year), 0)) - 1) * 100,
        2
    ) AS branch_yoy_change_pct,
    data_quality,
    customer_base_definition,
    digital_customer_definition,
    methodology_note
FROM dbo.bank_core_metrics;
GO

CREATE VIEW dbo.digital_adoption_index_2025 AS
WITH growth AS (
    SELECT
        bank_name,
        MAX(CASE WHEN year = 2021 THEN digital_customers END) AS digital_customers_2021,
        MAX(CASE WHEN year = 2025 THEN digital_customers END) AS digital_customers_2025
    FROM dbo.bank_core_metrics
    GROUP BY bank_name
),
growth_calc AS (
    SELECT
        bank_name,
        ROUND(((digital_customers_2025 / NULLIF(digital_customers_2021, 0)) - 1) * 100, 2) AS digital_customer_growth_2021_2025_pct
    FROM growth
),
metrics AS (
    SELECT
        k.bank_name,
        k.reported_digital_penetration_pct,
        k.digital_customers_per_branch,
        k.digital_customers_per_employee,
        g.digital_customer_growth_2021_2025_pct
    FROM dbo.bank_kpis k
    JOIN growth_calc g ON k.bank_name = g.bank_name
    WHERE k.year = 2025
),
scores AS (
    SELECT
        *,
        ROUND(
            CASE
                WHEN MAX(reported_digital_penetration_pct) OVER () = MIN(reported_digital_penetration_pct) OVER () THEN 100
                ELSE ((reported_digital_penetration_pct - MIN(reported_digital_penetration_pct) OVER ())
                / NULLIF(MAX(reported_digital_penetration_pct) OVER () - MIN(reported_digital_penetration_pct) OVER (), 0)) * 100
            END, 2
        ) AS penetration_score,
        ROUND(
            CASE
                WHEN MAX(digital_customers_per_branch) OVER () = MIN(digital_customers_per_branch) OVER () THEN 100
                ELSE ((digital_customers_per_branch - MIN(digital_customers_per_branch) OVER ())
                / NULLIF(MAX(digital_customers_per_branch) OVER () - MIN(digital_customers_per_branch) OVER (), 0)) * 100
            END, 2
        ) AS branch_efficiency_score,
        ROUND(
            CASE
                WHEN MAX(digital_customers_per_employee) OVER () = MIN(digital_customers_per_employee) OVER () THEN 100
                ELSE ((digital_customers_per_employee - MIN(digital_customers_per_employee) OVER ())
                / NULLIF(MAX(digital_customers_per_employee) OVER () - MIN(digital_customers_per_employee) OVER (), 0)) * 100
            END, 2
        ) AS employee_efficiency_score,
        ROUND(
            CASE
                WHEN MAX(digital_customer_growth_2021_2025_pct) OVER () = MIN(digital_customer_growth_2021_2025_pct) OVER () THEN 100
                ELSE ((digital_customer_growth_2021_2025_pct - MIN(digital_customer_growth_2021_2025_pct) OVER ())
                / NULLIF(MAX(digital_customer_growth_2021_2025_pct) OVER () - MIN(digital_customer_growth_2021_2025_pct) OVER (), 0)) * 100
            END, 2
        ) AS growth_score
    FROM metrics
),
final_index AS (
    SELECT
        *,
        ROUND(
            0.30 * penetration_score
            + 0.30 * branch_efficiency_score
            + 0.20 * employee_efficiency_score
            + 0.20 * growth_score,
            2
        ) AS digital_adoption_index
    FROM scores
)
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
    RANK() OVER (ORDER BY digital_adoption_index DESC) AS index_rank,
    CAST('Directional project-specific index based on public disclosures; not an official regulatory ranking.' AS NVARCHAR(MAX)) AS methodology_note
FROM final_index;
GO

CREATE VIEW dbo.digital_adoption_index_2025_equal_weight AS
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
    ROUND((penetration_score + branch_efficiency_score + employee_efficiency_score + growth_score) / 4, 2) AS equal_weight_index,
    RANK() OVER (ORDER BY (penetration_score + branch_efficiency_score + employee_efficiency_score + growth_score) / 4 DESC) AS equal_weight_rank,
    CAST('Equal-weight sensitivity check. Used to test whether the index result is highly sensitive to weighting assumptions.' AS NVARCHAR(MAX)) AS methodology_note
FROM dbo.digital_adoption_index_2025;
GO
