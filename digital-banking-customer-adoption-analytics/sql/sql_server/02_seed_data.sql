/*
Digital Banking Customer Adoption & Channel Migration Analytics
PostgreSQL seed data script

This script inserts manually curated project data into the analytical tables.
Core benchmark deliberately excludes mobile/app user and POS metrics because
those disclosures are not consistently comparable across the selected banks.
*/

INSERT INTO dbo.sector_tbb (
    year,
    only_internet_customers_m,
    only_mobile_customers_m,
    both_internet_mobile_customers_m,
    total_active_digital_customers_m,
    only_mobile_share_pct,
    only_internet_share_pct,
    both_channel_share_pct,
    total_yoy_growth_pct,
    methodology_note
) VALUES
(2021, 2.764, 65.954, 9.214, 77.932, 84.6, 3.5, 11.8, NULL, 'TBB sector-level digital banking records; not deduplicated across banks.'),
(2022, 2.301, 82.304, 9.786, 94.390, 87.2, 2.4, 10.4, 21.1, 'TBB sector-level digital banking records; not deduplicated across banks.'),
(2023, 1.802, 98.543, 10.243, 110.588, 89.1, 1.6, 9.3, 17.2, 'TBB sector-level digital banking records; not deduplicated across banks.'),
(2024, 1.368, 109.644, 8.111, 119.123, 92.0, 1.1, 6.8, 7.7, 'TBB sector-level digital banking records; not deduplicated across banks.'),
(2025, 1.079, 119.780, 6.818, 127.677, 93.8, 0.8, 5.3, 7.2, 'TBB sector-level digital banking records; not deduplicated across banks.');

INSERT INTO dbo.bank_core_metrics (
    bank_name,
    year,
    reported_customer_base,
    digital_customers,
    branches,
    employees,
    atms,
    data_quality,
    customer_base_definition,
    digital_customer_definition,
    methodology_note
) VALUES
-- Garanti BBVA: core metrics from disclosed in-numbers table.
('Garanti BBVA', 2021, 20376831, 11040150, 872, 20962, 5401, 'Exact', 'Total customers', 'Digital banking customers', 'Garanti BBVA values are taken from disclosed annual in-numbers table.'),
('Garanti BBVA', 2022, 23179429, 13386156, 838, 21684, 5450, 'Exact', 'Total customers', 'Digital banking customers', 'Garanti BBVA values are taken from disclosed annual in-numbers table.'),
('Garanti BBVA', 2023, 25351113, 15046929, 805, 22016, 5511, 'Exact', 'Total customers', 'Digital banking customers', 'Garanti BBVA values are taken from disclosed annual in-numbers table.'),
('Garanti BBVA', 2024, 27717447, 16718413, 795, 22664, 5820, 'Exact', 'Total customers', 'Digital banking customers', 'Garanti BBVA values are taken from disclosed annual in-numbers table.'),
('Garanti BBVA', 2025, 30141660, 18040749, 795, 23311, 6558, 'Exact', 'Total customers', 'Digital banking customers', 'Garanti BBVA values are taken from disclosed annual in-numbers table.'),

-- Akbank: digital banking users used as digital customer proxy.
('Akbank', 2021, 10000000, 6600000, 711, 12000, 5300, 'Approximate', 'Over 10 million customers', 'Digital banking users', 'Akbank 2021 customer base, employees and ATMs are approximate disclosures.'),
('Akbank', 2022, 10800000, 8700000, 711, 12000, 5900, 'Approximate', 'Over 10.8 million active customers', 'Digital banking users', 'Akbank 2022 customer base, employees and ATMs are approximate disclosures.'),
('Akbank', 2023, 13100000, 11200000, 705, 12000, 5854, 'Approximate', 'More than 13.1 million net active customers', 'Digital banking users', 'Akbank 2023 customer base and employees are approximate disclosures.'),
('Akbank', 2024, 14500000, 12500000, 694, 12778, 6210, 'Mixed', 'Total/customers disclosed customer base', 'Active digital customers / digital banking users', 'Akbank 2024 values combine disclosed customer base and exact operational indicators.'),
('Akbank', 2025, 15200000, 13200000, 647, 12591, 6351, 'Mixed', 'Active customers', 'Active digital users', 'Akbank 2025 digital penetration is consistent with disclosed 87% value.'),

-- Isbank: 2025 customer base is a proxy due to unavailable annual report.
('Isbank', 2021, 20700000, 10200000, 1174, 22802, 6476, 'Exact', 'Customers served by Isbank', 'Digital banking customers', 'Isbank 2021 values are from annual report disclosures.'),
('Isbank', 2022, 22800000, 13000000, 1110, 23309, 6169, 'Exact', 'Customers served by Isbank', 'Digital banking customers', 'Isbank 2022 values are from annual report disclosures.'),
('Isbank', 2023, 24300000, 15000000, 1066, 21167, 6312, 'Approximate', 'Customers served by Isbank', 'Approximately 15 million digital banking customers', 'Isbank 2023 digital customer value is approximate.'),
('Isbank', 2024, 25000000, 16700000, 1012, 20560, 6496, 'Approximate', 'Approximately 25 million customers', 'Digital banking customers', 'Isbank 2024 customer base is approximate.'),
('Isbank', 2025, 25500000, 16200000, 997, 20630, 6855, 'Proxy', 'Proxy: approx. 22.7M retail + over 2.8M commercial customers', 'Customers actively using digital banking channels', 'Isbank 2025 annual report was unavailable; values use 4Q25 investor presentation and 2026 Offering Circular.');

INSERT INTO dbo.supporting_indicators (
    bank_name,
    year,
    indicator_name,
    indicator_value,
    unit,
    indicator_category,
    usage_note,
    comparability_level,
    source_note
) VALUES
-- Garanti BBVA mobile and POS indicators. Excluded from core score due to inconsistent cross-bank disclosure.
('Garanti BBVA', 2021, 'mobile_banking_customers', 10608777, 'customers', 'Mobile/App Channel', 'Supporting mobile-first signal; excluded from core benchmark because Akbank lacks comparable mobile customer series.', 'Medium', 'Garanti BBVA disclosed in-numbers table.'),
('Garanti BBVA', 2022, 'mobile_banking_customers', 13032549, 'customers', 'Mobile/App Channel', 'Supporting mobile-first signal; excluded from core benchmark because Akbank lacks comparable mobile customer series.', 'Medium', 'Garanti BBVA disclosed in-numbers table.'),
('Garanti BBVA', 2023, 'mobile_banking_customers', 14768620, 'customers', 'Mobile/App Channel', 'Supporting mobile-first signal; excluded from core benchmark because Akbank lacks comparable mobile customer series.', 'Medium', 'Garanti BBVA disclosed in-numbers table.'),
('Garanti BBVA', 2024, 'mobile_banking_customers', 16520118, 'customers', 'Mobile/App Channel', 'Supporting mobile-first signal; excluded from core benchmark because Akbank lacks comparable mobile customer series.', 'Medium', 'Garanti BBVA disclosed in-numbers table.'),
('Garanti BBVA', 2025, 'mobile_banking_customers', 17893337, 'customers', 'Mobile/App Channel', 'Supporting mobile-first signal; excluded from core benchmark because Akbank lacks comparable mobile customer series.', 'Medium', 'Garanti BBVA disclosed in-numbers table.'),
('Garanti BBVA', 2021, 'pos_terminals', 700616, 'count', 'Payment Infrastructure', 'Supporting payment ecosystem metric; excluded from score due to inconsistent POS definitions across banks.', 'Low', 'Garanti BBVA disclosed in-numbers table.'),
('Garanti BBVA', 2022, 'pos_terminals', 777497, 'count', 'Payment Infrastructure', 'Supporting payment ecosystem metric; excluded from score due to inconsistent POS definitions across banks.', 'Low', 'Garanti BBVA disclosed in-numbers table.'),
('Garanti BBVA', 2023, 'pos_terminals', 808478, 'count', 'Payment Infrastructure', 'Supporting payment ecosystem metric; excluded from score due to inconsistent POS definitions across banks.', 'Low', 'Garanti BBVA disclosed in-numbers table.'),
('Garanti BBVA', 2024, 'pos_terminals', 864055, 'count', 'Payment Infrastructure', 'Supporting payment ecosystem metric; excluded from score due to inconsistent POS definitions across banks.', 'Low', 'Garanti BBVA disclosed in-numbers table.'),
('Garanti BBVA', 2025, 'pos_terminals', 870653, 'count', 'Payment Infrastructure', 'Supporting payment ecosystem metric; excluded from score due to inconsistent POS definitions across banks.', 'Low', 'Garanti BBVA disclosed in-numbers table.'),

-- Akbank supporting digital sales and channel indicators.
('Akbank', 2021, 'personal_loans_mobile_channel_share', 84, 'percent', 'Digital Sales', 'Supporting product-channel digitalization signal; not used in core index.', 'Low', 'Akbank annual report KPI visual.'),
('Akbank', 2022, 'personal_loans_mobile_channel_share', 82, 'percent', 'Digital Sales', 'Supporting product-channel digitalization signal; not used in core index.', 'Low', 'Akbank annual report KPI visual.'),
('Akbank', 2023, 'personal_loans_mobile_channel_share', 90, 'percent', 'Digital Sales', 'Supporting product-channel digitalization signal; not used in core index.', 'Low', 'Akbank annual report KPI visual.'),
('Akbank', 2021, 'credit_cards_sold_digital_channel_share', 52, 'percent', 'Digital Sales', 'Supporting digital sales signal; not used in core index.', 'Low', 'Akbank annual report KPI visual.'),
('Akbank', 2022, 'credit_cards_sold_digital_channel_share', 54, 'percent', 'Digital Sales', 'Supporting digital sales signal; not used in core index.', 'Low', 'Akbank annual report KPI visual.'),
('Akbank', 2023, 'credit_cards_sold_digital_channel_share', 70, 'percent', 'Digital Sales', 'Supporting digital sales signal; not used in core index.', 'Low', 'Akbank annual report KPI visual.'),
('Akbank', 2025, 'transactions_moved_to_digital_channels', 95, 'percent', 'Digital Channel Usage', 'Supporting channel migration signal; disclosed as more than 95%.', 'Low', 'Akbank 2025 integrated annual report.'),
('Akbank', 2025, 'avg_monthly_mobile_app_logins', 30, 'times per month', 'Mobile/App Channel', 'Supporting mobile engagement signal; not comparable with mobile customer count.', 'Low', 'Akbank 2025 integrated annual report.'),
('Akbank', 2025, 'digital_time_deposit_opening_share', 80, 'percent', 'Digital Sales', 'Supporting digital sales signal; not used in core index.', 'Low', 'Akbank 2025 integrated annual report.'),

-- Isbank supporting indicators.
('Isbank', 2021, 'iscep_users', 10000000, 'users', 'Mobile/App Channel', 'Supporting mobile-first signal; used as mobile proxy, excluded from core score.', 'Medium', 'Isbank annual report.'),
('Isbank', 2022, 'iscep_users', 11900000, 'users', 'Mobile/App Channel', 'Supporting mobile-first signal; used as mobile proxy, excluded from core score.', 'Medium', 'Isbank annual report.'),
('Isbank', 2023, 'iscep_users', 13700000, 'users', 'Mobile/App Channel', 'Supporting mobile-first signal; used as mobile proxy, excluded from core score.', 'Medium', 'Isbank annual report.'),
('Isbank', 2024, 'iscep_users', 15200000, 'users', 'Mobile/App Channel', 'Supporting mobile-first signal; used as mobile proxy, excluded from core score.', 'Medium', 'Isbank annual report.'),
('Isbank', 2025, 'iscep_users', 15900000, 'users', 'Mobile/App Channel', 'Supporting mobile-first signal; used as mobile proxy, excluded from core score.', 'Medium', 'Isbank 4Q25 investor presentation.'),
('Isbank', 2021, 'non_branch_transaction_ratio', 95.6, 'percent', 'Digital Channel Usage', 'Supporting mature non-branch channel signal; excluded from core index due to missing comparable series for all banks.', 'Medium', 'Isbank annual report.'),
('Isbank', 2022, 'non_branch_transaction_ratio', 96.2, 'percent', 'Digital Channel Usage', 'Supporting mature non-branch channel signal; excluded from core index due to missing comparable series for all banks.', 'Medium', 'Isbank annual report.'),
('Isbank', 2023, 'non_branch_transaction_ratio', 97.0, 'percent', 'Digital Channel Usage', 'Supporting mature non-branch channel signal; excluded from core index due to missing comparable series for all banks.', 'Medium', 'Isbank annual report.'),
('Isbank', 2024, 'non_branch_transaction_ratio', 97.0, 'percent', 'Digital Channel Usage', 'Supporting mature non-branch channel signal; excluded from core index due to missing comparable series for all banks.', 'Medium', 'Isbank annual report.'),
('Isbank', 2025, 'non_branch_transaction_ratio', 96.5, 'percent', 'Digital Channel Usage', 'Offering Circular value used; Q4 slide rounds to 97%.', 'Medium', 'Isbank 2026 Offering Circular.'),
('Isbank', 2021, 'pos_devices', 570212, 'count', 'Payment Infrastructure', 'Supporting payment ecosystem metric; excluded from score due to inconsistent POS definitions across banks.', 'Low', 'Isbank 2021 annual report.'),
('Isbank', 2022, 'pos_devices', 611429, 'count', 'Payment Infrastructure', 'Supporting payment ecosystem metric; excluded from score due to inconsistent POS definitions across banks.', 'Low', 'Isbank 2022 annual report.'),
('Isbank', 2023, 'pos_devices', 660375, 'count', 'Payment Infrastructure', 'Supporting payment ecosystem metric; excluded from score due to inconsistent POS definitions across banks.', 'Low', 'Isbank 2023 annual report.'),
('Isbank', 2024, 'pos_devices', 671000, 'count', 'Payment Infrastructure', 'Supporting payment ecosystem metric; excluded from score due to inconsistent POS definitions across banks.', 'Low', 'Isbank 2024 annual report.'),
('Isbank', 2025, 'pos_devices', 602000, 'count', 'Payment Infrastructure', 'Over 602,000 POS terminals owned by the Bank or including the Bank software; excluded from score due to definition risk.', 'Low', 'Isbank 2026 Offering Circular.'),
('Isbank', 2022, 'iscep_transaction_share', 73.2, 'percent', 'Mobile/App Channel', 'Supporting mobile transaction share signal; excluded from core score.', 'Low', 'Isbank annual report.'),
('Isbank', 2023, 'iscep_transaction_share', 75.26, 'percent', 'Mobile/App Channel', 'Supporting mobile transaction share signal; excluded from core score.', 'Low', 'Isbank annual report.'),
('Isbank', 2024, 'iscep_transaction_share', 77.8, 'percent', 'Mobile/App Channel', 'Supporting mobile transaction share signal; excluded from core score.', 'Low', 'Isbank annual report.');
