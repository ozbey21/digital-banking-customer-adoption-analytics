# Digital Banking Customer Adoption & Channel Migration Analytics

**Turkey, 2021–2025**  
**Selected Peer Group:** Garanti BBVA, Akbank, İşbank  
**Tools:** Excel Analytics, SQL, Public Disclosure Analysis, KPI Framework Design

---

## 1. Project Overview

This project analyzes the evolution of digital banking adoption in Turkey between 2021 and 2025.

The analysis combines:

- sector-level digital banking statistics from the Banks Association of Turkey (TBB),
- bank-level public disclosures from Garanti BBVA, Akbank and İşbank,
- a structured KPI framework,
- a directional Digital Adoption Index,
- an Excel dashboard,
- SQL scripts for reproducing the core KPI logic.

The main objective is to understand how digital banking customer adoption evolved in Turkey and how selected major banks scaled digital customer relationships relative to their physical branch networks.

---

## 2. Business Problem

Digital banking adoption has become one of the most important transformation areas in Turkish banking.

However, public disclosures are fragmented. Banks may report digital customers, digital users, mobile banking customers, app users, POS devices, non-branch transaction ratios or digital sales metrics under different definitions.

This project addresses the following analytical question:

> How did digital banking customer adoption evolve in Turkey, and how did selected major banks scale digital customer relationships relative to their branch networks?

The project is designed as a public-disclosure-based banking analytics case study, not as a regulatory ranking.

---

## 3. Data Sources

The project uses two main data layers.

### Sector-Level Data

Sector-level digital banking data comes from TBB Digital, Internet and Mobile Banking Statistics.

This layer is used to analyze:

- total active digital banking customer records,
- only-mobile users,
- only-internet users,
- users of both mobile and internet channels,
- mobile-only share,
- internet-only share,
- sector-level year-over-year digital banking growth.

### Bank-Level Data

Bank-level data comes from public disclosures of:

- Garanti BBVA,
- Akbank,
- İşbank.

Sources include annual reports, integrated annual reports, investor presentations and offering circulars.

---

## 4. Repository Structure

```text
digital-banking-customer-adoption-analytics/

├── data/
│   ├── master/
│   │   └── digital_banking_master_dataset_2021_2025_revised.xlsx
│   │
│   └── processed/
│       └── digital_banking_kpi_insights_summary_2021_2025_enhanced.xlsx
│
├── dashboard/
│   └── digital_banking_excel_dashboard_2021_2025.xlsx
│
├── sql/
│   ├── postgresql/
│   └── sql_server/
│
├── reports/
│   ├── executive_summary.pdf
│   ├── executive_summary.tex
│   └── methodology_notes.md
│
├── docs/
│   └── kpi_dictionary.md
│
└── README.md
```

---

## 5. Methodology

A key methodological decision in this project is the separation of metrics into two groups:

1. **Core benchmark metrics**
2. **Supporting indicators**

This separation is necessary because not all banks report digital banking indicators under the same definitions.

---

## 6. Core Benchmark Metrics

Core benchmark metrics are used for cross-bank comparison and for the Digital Adoption Index.

These metrics are relatively more consistently available across the selected banks:

- reported customer base,
- reported digital customers / digital banking users,
- branches,
- employees,
- ATMs,
- reported digital penetration,
- digital customers per branch,
- digital customers per employee,
- digital customers per ATM,
- digital customer growth,
- branch-to-digital decoupling.

These indicators form the main analytical backbone of the project.

---

## 7. Supporting Indicators

Supporting indicators are used for bank-specific interpretation, but they are excluded from the core benchmark and Digital Adoption Index.

Supporting indicators include:

- mobile banking customers,
- İşCep users,
- Akbank mobile transaction indicators,
- POS devices,
- non-branch transaction ratio,
- digital sales indicators,
- ecosystem metrics such as Nays and Maximum Mobile users.

These metrics are useful, but their definitions are not sufficiently consistent across all selected banks.

For example:

- Garanti BBVA discloses mobile banking customers.
- İşbank discloses İşCep users / İşCep customers.
- Akbank does not consistently disclose a comparable mobile banking customer count for the full 2021–2025 period, but it discloses digital banking users and mobile transaction indicators.

Therefore, mobile/app indicators are used as supporting signals rather than direct score components.

---

## 8. Why Mobile/App Users Were Excluded from the Core Score

Mobile/app user data was excluded from the core benchmark because the selected banks do not report a fully comparable mobile user metric.

Using Garanti BBVA mobile banking customers, İşbank İşCep users and Akbank mobile transaction indicators in the same direct ranking would create a methodological mismatch.

Instead:

- Garanti BBVA mobile banking customers are treated as a supporting mobile adoption signal.
- İşbank İşCep users are treated as a supporting mobile banking proxy.
- Akbank mobile transaction indicators are treated as supporting channel migration indicators.

This preserves the mobile-first narrative while avoiding unfair cross-bank comparison.

---

## 9. Why POS Was Excluded from the Core Score

POS data was excluded from the core benchmark because POS definitions differ significantly across banks.

Banks may report:

- POS terminals,
- POS devices,
- virtual POS included,
- bank-owned POS terminals,
- POS terminals including bank software,
- member merchant points.

These are not always equivalent.

Therefore, POS is treated as a supporting payment ecosystem indicator, not as a direct digital banking adoption metric.

---

## 10. KPI Framework

The main KPIs used in the analysis are:

| KPI | Formula | Business Meaning |
|---|---|---|
| Reported Digital Penetration | Digital Customers / Reported Customer Base | Measures the share of the reported customer base using digital banking channels. |
| Digital Customers per Branch | Digital Customers / Branches | Measures how digital customer scale relates to the physical branch network. |
| Digital Customers per Employee | Digital Customers / Employees | Directional operational efficiency proxy. |
| Digital Customer Growth | Digital Customers 2025 / Digital Customers 2021 - 1 | Measures digital customer scale expansion over the analysis period. |
| Branch-to-Digital Decoupling | Digital Customer Growth - Branch Growth | Shows whether digital customer scale is growing independently of branch network expansion. |

A full KPI dictionary is available in:

```text
docs/kpi_dictionary.md
```

---

## 11. Digital Adoption Index

A project-specific Digital Adoption Index was created to compare selected banks using more comparable core metrics.

The index uses four normalized components:

```text
Digital Adoption Index =
0.30 × Digital Penetration Score
+ 0.30 × Digital Customers per Branch Score
+ 0.20 × Digital Customers per Employee Score
+ 0.20 × Digital Customer Growth Score
```

Each component is normalized across the selected peer group using min-max normalization.

Important note:

> The Digital Adoption Index is a directional project-specific framework. It is not an official ranking, regulatory metric or complete digital maturity score.

An equal-weight sensitivity check was also prepared to evaluate whether the index is overly dependent on the selected weights.

---

## 12. Key Findings

### 12.1 Turkey Became Structurally Mobile-First

TBB sector data shows that Turkey's digital banking structure became strongly mobile-first between 2021 and 2025.

- Total active digital banking customer records increased from **77.9M** in 2021 to **127.7M** in 2025.
- Mobile-only share increased from **84.6%** to **93.8%**.
- Internet-only share declined from **3.5%** to **0.8%**.

This indicates that mobile banking became the dominant engine of digital banking adoption.

---

### 12.2 Digital Customer Scale Expanded Across Selected Banks

All three selected banks expanded their reported digital customer bases between 2021 and 2025.

| Bank | 2021 Digital Customers | 2025 Digital Customers | Interpretation |
|---|---:|---:|---|
| Garanti BBVA | 11.0M | 18.0M | Highest reported digital customer scale in 2025. |
| Akbank | 6.6M | 13.2M | Strongest relative growth among selected banks. |
| İşbank | 10.2M | 16.2M | Large digital base with strong supporting channel indicators. |

---

### 12.3 Branch-to-Digital Efficiency Improved

The strongest analytical message is not only that digital customers increased.

The more important finding is that digital customer scale expanded relative to branch networks.

Across the selected banks:

- digital customer bases increased,
- branch networks declined or remained constrained,
- digital customers per branch increased.

This supports a clear branch-to-digital efficiency narrative.

---

### 12.4 İşbank Requires Careful Interpretation

İşbank may score lower in the core Digital Adoption Index because its digital customers per branch and 2021–2025 digital customer growth are lower than selected peers.

However, this does not mean İşbank is digitally weak.

Supporting indicators such as İşCep users and non-branch transaction ratio suggest a mature digital channel structure.

This is why the project separates core benchmark metrics from supporting indicators.

---

## 13. Dashboard

The Excel dashboard summarizes the analysis across five views:

1. Executive Overview
2. Sector Mobile-First Trend
3. Selected Bank Benchmark
4. Branch-to-Digital Efficiency
5. Strategic Insights

Dashboard file:

```text
dashboard/digital_banking_excel_dashboard_2021_2025.xlsx
```

The dashboard is kept as an Excel workbook instead of static screenshots so that users can inspect the underlying sheets, filters, charts and KPI calculations directly.

---

## 14. SQL Layer

The SQL layer reproduces the core KPI logic used in the analysis.

It includes:

- table creation scripts,
- seed data scripts,
- KPI views,
- validation queries,
- analysis queries,
- Digital Adoption Index calculation logic.

Two SQL versions are provided:

```text
sql/postgresql/
sql/sql_server/
```

The SQL layer is included to demonstrate how the KPI framework can be reproduced from structured tables.

---

## 15. Strategic Recommendations

Based on the analysis, five strategic recommendations emerge:

1. **Treat mobile-first banking as the sector baseline.**  
   TBB data shows that mobile-only usage dominates digital banking adoption in Turkey.

2. **Track digital customers per branch as a channel efficiency KPI.**  
   This metric helps evaluate how digital scale grows relative to the physical network.

3. **Reposition branches toward advisory and complex services.**  
   As routine transactions migrate to digital channels, branches should focus more on higher-value interactions.

4. **Use mobile channels for engagement, retention and cross-sell.**  
   Mobile banking is not only an access channel but also a primary relationship channel.

5. **Separate comparable KPIs from supporting indicators.**  
   Banks should not be compared on mobile/app or POS metrics without checking definition consistency.

---

## 16. Limitations

The analysis has several limitations:

- TBB data is sector-level and not bank-level.
- Bank-level data is based on public disclosures and may not follow fully standardized definitions.
- Garanti BBVA, Akbank and İşbank use different terms such as digital customers, digital users and İşCep users.
- Akbank does not consistently disclose mobile banking customer count for the full 2021–2025 period.
- POS data is excluded from the core benchmark due to inconsistent definitions.
- İşbank 2025 data is based on 4Q25 investor presentation and 2026 Offering Circular because the 2025 annual report was not available at the time of data collection.
- The Digital Adoption Index is directional and project-specific.
- The project does not use customer-level transaction data, so it does not include cohort analysis, retention analysis or product-level behavioral modeling.

A detailed methodology document is available in:

```text
reports/methodology_notes.md
```

---

## 17. Final Interpretation

The project shows that Turkish digital banking became strongly mobile-first between 2021 and 2025.

At the selected bank level, Garanti BBVA, Akbank and İşbank all expanded their digital customer bases while physical branch networks declined or remained constrained.

The main analytical contribution is the transformation of fragmented public banking disclosures into a structured analytics framework covering:

- sector trend analysis,
- selected bank benchmarking,
- KPI design,
- Digital Adoption Index construction,
- methodology discipline,
- strategic channel migration insights.

---

## 18. Project Files

| File | Description |
|---|---|
| `data/master/digital_banking_master_dataset_2021_2025_revised.xlsx` | Main cleaned master dataset. |
| `data/processed/digital_banking_kpi_insights_summary_2021_2025_enhanced.xlsx` | Detailed KPI and insight analysis. |
| `dashboard/digital_banking_excel_dashboard_2021_2025.xlsx` | Excel dashboard. |
| `reports/executive_summary.pdf` | Executive summary report. |
| `reports/methodology_notes.md` | Methodology and data quality notes. |
| `docs/kpi_dictionary.md` | KPI definitions and formulas. |
| `sql/` | SQL scripts for KPI reproduction and benchmark queries. |

---

## 19. Author

**Ahmet Özbey**  
Mathematical Engineering Student  
Interested in Banking Analytics, Data Analytics, Business Analysis and Digital Transformation
