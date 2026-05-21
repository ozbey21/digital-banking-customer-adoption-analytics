# Methodology Notes

## Project Scope

This project analyzes digital banking customer adoption and channel migration in Turkey between 2021 and 2025.

The analysis combines:

- sector-level digital banking statistics from the Banks Association of Turkey (TBB),
- bank-level public disclosures from Garanti BBVA, Akbank and İşbank,
- a structured KPI framework,
- a directional Digital Adoption Index,
- an Excel dashboard and SQL query layer.

The selected peer group is limited to Garanti BBVA, Akbank and İşbank in order to maintain consistency with the broader Turkish bank peer analysis project and to focus on banks with sufficiently available public digital banking disclosures.

---

## Data Source Structure

The project uses two main data layers.

### 1. Sector-Level Data

Sector-level data comes from TBB digital, internet and mobile banking statistics.

This layer is used to analyze:

- active digital banking customer records,
- only-mobile digital banking users,
- only-internet digital banking users,
- users of both internet and mobile channels,
- mobile-only share,
- internet-only share,
- year-over-year growth in active digital banking records.

Important limitation:

> TBB data is sector-level and is not bank-level data. Therefore, it is used to explain the national digital banking trend, not to directly compare individual banks.

### 2. Bank-Level Data

Bank-level data comes from public disclosures of Garanti BBVA, Akbank and İşbank, including:

- annual reports,
- integrated annual reports,
- investor presentations,
- offering circulars,
- disclosed operational KPI tables.

This layer is used for selected bank benchmarking.

---

## Core Benchmark vs Supporting Indicators

A key methodological decision in this project is the separation of metrics into two groups:

1. **Core benchmark metrics**
2. **Supporting indicators**

This separation exists because not all banks report digital banking indicators under the same definitions.

---

## Core Benchmark Metrics

Core benchmark metrics are used for cross-bank comparison and the Digital Adoption Index.

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

## Supporting Indicators

Supporting indicators are used for qualitative interpretation and bank-specific context, but they are excluded from the core benchmark and Digital Adoption Index.

Supporting indicators include:

- mobile banking customers,
- İşCep users,
- Akbank mobile transaction indicators,
- POS devices,
- non-branch transaction ratio,
- digital sales ratio,
- İşCep transaction share,
- Nays users,
- Maximum Mobile users,
- mobile app engagement indicators.

These metrics are useful, but their definitions are not sufficiently consistent across all selected banks.

For example:

- Garanti BBVA discloses **mobile banking customers**.
- İşbank discloses **İşCep users / İşCep customers**.
- Akbank does not consistently disclose a comparable mobile banking customer count for the full 2021-2025 period, but it discloses digital banking users and mobile transaction indicators.

Therefore, mobile/app user metrics are kept outside the core benchmark.

---

## Why Mobile/App Users Were Excluded from the Core Benchmark

Mobile/app user metrics were excluded from the core benchmark because they are not consistently disclosed across the selected banks.

Using Garanti BBVA's mobile banking customers, İşbank's İşCep users and Akbank's mobile transaction indicators in the same direct ranking would create a methodological mismatch.

Instead:

- Garanti BBVA mobile banking customers are treated as a supporting mobile adoption signal.
- İşbank İşCep users are treated as a supporting mobile banking proxy.
- Akbank mobile transaction indicators are treated as supporting channel migration indicators.

This preserves the mobile-first narrative while avoiding an unfair cross-bank comparison.

---

## Why POS Was Excluded from the Core Benchmark

POS data was excluded from the core benchmark and Digital Adoption Index because POS definitions differ significantly across banks.

Banks may report:

- POS terminals,
- POS devices,
- virtual POS included,
- bank-owned POS terminals,
- POS terminals including bank software,
- member merchant points.

These are not always equivalent.

Therefore, POS is treated as a supporting payment ecosystem indicator, not a direct digital banking adoption metric.

---

## Customer Base Definition Risk

The term "customer base" is not perfectly standardized across the selected banks.

Examples:

- Garanti BBVA reports total customers.
- Akbank uses active customers / total customers / net active customers depending on the year and source.
- İşbank reports customers in annual reports; for 2025, a proxy was used based on disclosed retail and commercial customer figures.

Because of this, the project uses the term:

> reported customer base

rather than claiming a fully standardized unique customer count.

Reported digital penetration should therefore be interpreted as a directional indicator, not a regulatory-grade standardized penetration ratio.

---

## Digital Customer Definition Risk

The term "digital customers" is also not fully standardized.

Examples:

- Garanti BBVA reports digital banking customers.
- Akbank reports digital banking users / active digital users.
- İşbank reports digital banking customers.

These metrics are close enough for directional benchmarking, but not identical enough to claim exact regulatory comparability.

Therefore, the project uses the following interpretation:

> Digital customer metrics are based on each bank's public disclosures and may not follow a fully standardized taxonomy.

---

## İşbank 2025 Data Treatment

At the time of data collection, İşbank's 2025 annual report was not available.

Therefore, 2025 İşbank values were sourced from:

- 4Q25 investor presentation,
- 2026 Global Medium-Term Note Programme Offering Circular.

The 2025 İşbank customer base is treated as a proxy based on disclosed retail and commercial customer figures.

This is explicitly flagged in the dataset as a proxy and should not be interpreted as a fully audited annual report figure.

---

## Approximate and Proxy Values

Some values are exact, while others are approximate or proxy-based.

Examples:

- Akbank 2021-2023 customer and employee figures include approximate wording such as "over" or "approximately".
- İşbank 2025 customer base is a proxy.
- Some POS values are rounded or definition-dependent.

To manage this, the dataset includes data quality notes such as:

- Exact
- Approximate
- Mixed
- Proxy
- Supporting only

---

## Digital Adoption Index Methodology

The Digital Adoption Index is a project-specific directional framework.

It is based on four core components:

1. Reported digital penetration
2. Digital customers per branch
3. Digital customers per employee
4. Digital customer growth from 2021 to 2025

The index formula is:

```text
Digital Adoption Index =
0.30 × Digital Penetration Score
+ 0.30 × Digital Customers per Branch Score
+ 0.20 × Digital Customers per Employee Score
+ 0.20 × Digital Customer Growth Score
```

Each component is normalized across the selected peer group using min-max normalization.

Important:

> This index is not an official ranking, not a regulatory metric and not a complete digital maturity score. It is a directional analytical framework based on selected public indicators.

---

## Index Sensitivity

An equal-weight sensitivity check was also prepared to test whether index results are overly dependent on the selected weights.

This helps prevent overclaiming.

The index should be interpreted together with:

- raw KPI values,
- data quality notes,
- supporting indicators,
- methodology caveats.

---

## Interpretation Caveat for İşbank

İşbank may score lower in the core Digital Adoption Index because of its lower digital customers per branch and lower 2021-2025 digital customer growth relative to the selected peer group.

However, this does not mean İşbank is digitally weak.

Supporting indicators such as:

- İşCep users,
- non-branch transaction ratio,
- İşCep transaction share,

suggest that İşbank has a mature digital channel structure.

Therefore, the index should not be interpreted as a complete measure of digital banking maturity.

---

## TBB and Bank-Level Data Should Not Be Mixed Directly

TBB data and bank-level data are used for different analytical purposes.

- TBB data explains the national sector trend.
- Bank-level data supports selected peer benchmarking.

The project avoids directly comparing TBB total sector values with individual bank values in a way that would imply identical scope.

---

## Key Limitations

The main limitations are:

1. TBB data is sector-level, not bank-level.
2. Bank-level metrics are based on public disclosures.
3. Banks use different definitions for digital customers, users and customer base.
4. Mobile/app user metrics are not consistently available across all banks.
5. POS metrics are not consistently defined.
6. İşbank 2025 data comes from investor presentation and offering circular sources rather than a full annual report.
7. The Digital Adoption Index is directional and project-specific.
8. The project does not use customer-level transaction data, so it does not include cohort analysis, retention analysis or product-level behavioral modeling.

---

## Analytical Positioning

This project should be interpreted as:

> A public-disclosure-based banking analytics project that transforms fragmented sector and bank-level data into a structured KPI framework, selected peer benchmark, directional digital adoption index and strategic channel migration analysis.

It should not be interpreted as:

> A regulatory-grade bank ranking or a complete customer-level digital behavior study.
