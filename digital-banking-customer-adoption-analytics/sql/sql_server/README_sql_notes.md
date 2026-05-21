# SQL Layer Notes — Digital Banking Customer Adoption & Channel Migration Analytics

This folder contains the SQL layer used to reproduce the core KPI calculations for the project.

## Files

1. `01_schema.sql`  
   Creates tables for sector-level TBB data, selected bank core metrics, and supporting indicators.

2. `02_seed_data.sql`  
   Inserts the cleaned project dataset into the SQL tables.

3. `03_kpi_views.sql`  
   Creates calculated KPI views, including:
   - reported digital penetration
   - digital customers per branch
   - digital customers per employee
   - digital customer YoY growth
   - directional Digital Adoption Index
   - equal-weight sensitivity check

4. `04_validation_queries.sql`  
   Checks table row counts and previews the KPI view.

5. `05_analysis_queries.sql`  
   Contains the main SQL analysis queries used for the dashboard and README.

## Methodology Notes

- Mobile/app user metrics are excluded from the core benchmark because Akbank does not disclose a comparable mobile banking customer series.
- POS metrics are excluded from the core benchmark because POS definitions differ across banks.
- Digital customer metrics are based on each bank's public disclosures and may not follow a fully standardized taxonomy.
- İşbank 2025 customer base is treated as a proxy because the annual report was not available during data collection.
- The Digital Adoption Index is a project-specific directional framework, not an official regulatory ranking.
