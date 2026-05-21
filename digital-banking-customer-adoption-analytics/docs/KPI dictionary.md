# KPI Dictionary

This document defines the main KPIs used in the **Digital Banking Customer Adoption & Channel Migration Analytics** project.

The project covers Turkey's digital banking market between 2021 and 2025 and focuses on TBB sector data plus selected bank-level disclosures from Garanti BBVA, Akbank and İşbank.

---

## KPI Groups

The KPIs are divided into three groups:

1. Sector-level KPIs
2. Bank-level core benchmark KPIs
3. Supporting indicators

Only core benchmark KPIs are used in the Digital Adoption Index.

---

# 1. Sector-Level KPIs

Sector-level KPIs are based on TBB digital, internet and mobile banking statistics.

These KPIs describe the national digital banking trend in Turkey.

---

## 1.1 Total Active Digital Banking Customers

**Definition**

Total active digital banking customer records reported at the sector level.

**Formula**

```text
Total Active Digital Banking Customers =
Only Internet Users + Only Mobile Users + Both Internet and Mobile Users
```

**Unit**

Million customer records

**Business Meaning**

Shows the scale of digital banking adoption across the Turkish banking sector.

**Important Caveat**

TBB figures are sector-level records and may not represent unique individuals across banks.

---

## 1.2 Only Mobile Users

**Definition**

Active digital banking customer records using only mobile banking.

**Formula**

```text
Only Mobile Users = TBB reported only-mobile active digital banking users
```

**Unit**

Million customer records

**Business Meaning**

Measures the dominance of mobile banking as the primary digital channel.

---

## 1.3 Only Internet Users

**Definition**

Active digital banking customer records using only internet banking.

**Formula**

```text
Only Internet Users = TBB reported only-internet active digital banking users
```

**Unit**

Million customer records

**Business Meaning**

Shows the standalone relevance of internet banking without mobile usage.

---

## 1.4 Both Internet and Mobile Users

**Definition**

Active digital banking customer records using both internet and mobile banking.

**Formula**

```text
Both Internet and Mobile Users = TBB reported both-channel users
```

**Unit**

Million customer records

**Business Meaning**

Shows multi-channel digital banking usage at the sector level.

---

## 1.5 Mobile-Only Share

**Definition**

The share of active digital banking customer records that use only mobile banking.

**Formula**

```text
Mobile-Only Share =
Only Mobile Users / Total Active Digital Banking Customers
```

**Unit**

Percentage

**Business Meaning**

A key indicator of the mobile-first transformation in digital banking.

---

## 1.6 Internet-Only Share

**Definition**

The share of active digital banking customer records that use only internet banking.

**Formula**

```text
Internet-Only Share =
Only Internet Users / Total Active Digital Banking Customers
```

**Unit**

Percentage

**Business Meaning**

Shows how much standalone internet banking remains within digital banking usage.

---

## 1.7 Total Digital Customer YoY Growth

**Definition**

Year-over-year growth in total active digital banking customer records.

**Formula**

```text
YoY Growth =
(Current Year Total Active Digital Customers / Previous Year Total Active Digital Customers) - 1
```

**Unit**

Percentage

**Business Meaning**

Measures the annual growth pace of digital banking adoption at the sector level.

---

# 2. Bank-Level Core Benchmark KPIs

Bank-level core benchmark KPIs are used for Garanti BBVA, Akbank and İşbank comparison.

These are the main metrics used in the dashboard, executive summary and Digital Adoption Index.

---

## 2.1 Reported Customer Base

**Definition**

The customer base disclosed by each bank in public reports.

**Formula**

```text
Reported Customer Base = Bank-disclosed customer base
```

**Unit**

Number of customers

**Business Meaning**

Used as the denominator for reported digital penetration.

**Important Caveat**

The definition differs by bank:

- Garanti BBVA reports total customers.
- Akbank may report active customers, total customers or net active customers depending on year/source.
- İşbank reports customers; 2025 uses a proxy based on retail + commercial customer disclosures.

Therefore, this KPI is called **reported customer base**, not standardized unique customers.

---

## 2.2 Reported Digital Customers / Users

**Definition**

The number of digital banking customers or users disclosed by each bank.

**Formula**

```text
Reported Digital Customers = Bank-disclosed digital banking customers/users
```

**Unit**

Number of customers/users

**Business Meaning**

Measures the scale of each bank's digital banking customer base.

**Important Caveat**

Terminology differs across banks:

- Garanti BBVA: digital banking customers
- Akbank: digital banking users / active digital users
- İşbank: digital banking customers

The metric is used directionally.

---

## 2.3 Reported Digital Penetration

**Definition**

The share of reported customer base represented by reported digital customers/users.

**Formula**

```text
Reported Digital Penetration =
Reported Digital Customers / Reported Customer Base
```

**Unit**

Percentage

**Business Meaning**

Shows how much of the reported customer base uses digital banking channels.

**Caveat**

Because customer base definitions differ, this is interpreted as a directional penetration metric.

---

## 2.4 Branches

**Definition**

Number of bank branches.

**Formula**

```text
Branches = Bank-disclosed branch count
```

**Unit**

Count

**Business Meaning**

Represents the scale of the physical branch network.

---

## 2.5 Employees

**Definition**

Number of employees disclosed by the bank.

**Formula**

```text
Employees = Bank-disclosed employee count
```

**Unit**

Count

**Business Meaning**

Used to calculate digital customers per employee as a directional operational efficiency proxy.

**Caveat**

Some Akbank employee figures for 2021-2023 are approximate disclosures.

---

## 2.6 ATMs

**Definition**

Number of ATMs disclosed by the bank.

**Formula**

```text
ATMs = Bank-disclosed ATM count
```

**Unit**

Count

**Business Meaning**

Represents the physical self-service channel network.

---

## 2.7 Digital Customers per Branch

**Definition**

Number of reported digital customers per branch.

**Formula**

```text
Digital Customers per Branch =
Reported Digital Customers / Branches
```

**Unit**

Customers per branch

**Business Meaning**

Measures how digital customer scale relates to the physical branch network.

This is one of the most important KPIs in the project because it supports the branch-to-digital efficiency narrative.

---

## 2.8 Digital Customers per Employee

**Definition**

Number of reported digital customers per employee.

**Formula**

```text
Digital Customers per Employee =
Reported Digital Customers / Employees
```

**Unit**

Customers per employee

**Business Meaning**

A directional proxy for operational scale.

**Caveat**

This is not a full productivity measure because employee roles and organizational structures differ across banks.

---

## 2.9 Digital Customers per ATM

**Definition**

Number of reported digital customers per ATM.

**Formula**

```text
Digital Customers per ATM =
Reported Digital Customers / ATMs
```

**Unit**

Customers per ATM

**Business Meaning**

Shows digital customer scale relative to the physical self-service channel network.

---

## 2.10 Digital Customer YoY Growth

**Definition**

Annual growth rate in reported digital customers/users.

**Formula**

```text
Digital Customer YoY Growth =
(Current Year Digital Customers / Previous Year Digital Customers) - 1
```

**Unit**

Percentage

**Business Meaning**

Measures yearly digital customer scale expansion.

---

## 2.11 Digital Customer Growth, 2021-2025

**Definition**

Total growth in reported digital customers/users over the full analysis period.

**Formula**

```text
Digital Customer Growth 2021-2025 =
(Digital Customers 2025 / Digital Customers 2021) - 1
```

**Unit**

Percentage

**Business Meaning**

Measures long-term digital scale expansion across the selected period.

---

## 2.12 Digital Customer CAGR

**Definition**

Compound annual growth rate of reported digital customers/users between 2021 and 2025.

**Formula**

```text
Digital Customer CAGR =
(Digital Customers 2025 / Digital Customers 2021)^(1/4) - 1
```

**Unit**

Percentage

**Business Meaning**

Shows the annualized growth rate of digital customer scale.

---

## 2.13 Branch Change, 2021-2025

**Definition**

Total change in branch count between 2021 and 2025.

**Formula**

```text
Branch Change 2021-2025 =
(Branches 2025 / Branches 2021) - 1
```

**Unit**

Percentage

**Business Meaning**

Shows whether the physical branch network expanded or contracted.

---

## 2.14 Branch-to-Digital Decoupling Gap

**Definition**

Difference between digital customer growth and branch growth.

**Formula**

```text
Branch-to-Digital Decoupling Gap =
Digital Customer Growth 2021-2025 - Branch Change 2021-2025
```

**Unit**

Percentage points

**Business Meaning**

Measures how strongly digital customer scale grew relative to branch network change.

A high positive value suggests that digital customer growth is not dependent on physical branch expansion.

---

## 2.15 Digital Customers per Branch Uplift

**Definition**

Change in digital customers per branch between 2021 and 2025.

**Formula**

```text
Digital Customers per Branch Uplift =
(Digital Customers per Branch 2025 / Digital Customers per Branch 2021) - 1
```

**Unit**

Percentage

**Business Meaning**

Measures branch-to-digital efficiency improvement.

---

# 3. Digital Adoption Index KPIs

The Digital Adoption Index is a project-specific directional framework.

It is not an official ranking.

---

## 3.1 Digital Penetration Score

**Definition**

Normalized score based on reported digital penetration.

**Formula**

```text
Digital Penetration Score =
(X - Min(X)) / (Max(X) - Min(X)) × 100
```

where X is reported digital penetration.

**Unit**

Score from 0 to 100

**Business Meaning**

Rewards banks with stronger reported digital adoption relative to their reported customer base.

---

## 3.2 Digital Customers per Branch Score

**Definition**

Normalized score based on digital customers per branch.

**Formula**

```text
Digital Customers per Branch Score =
(X - Min(X)) / (Max(X) - Min(X)) × 100
```

**Unit**

Score from 0 to 100

**Business Meaning**

Rewards banks with stronger digital customer scale relative to physical branch network size.

---

## 3.3 Digital Customers per Employee Score

**Definition**

Normalized score based on digital customers per employee.

**Formula**

```text
Digital Customers per Employee Score =
(X - Min(X)) / (Max(X) - Min(X)) × 100
```

**Unit**

Score from 0 to 100

**Business Meaning**

Rewards banks with higher digital customer scale relative to employee base.

---

## 3.4 Digital Customer Growth Score

**Definition**

Normalized score based on 2021-2025 digital customer growth.

**Formula**

```text
Digital Customer Growth Score =
(X - Min(X)) / (Max(X) - Min(X)) × 100
```

**Unit**

Score from 0 to 100

**Business Meaning**

Rewards banks with stronger long-term digital customer growth.

---

## 3.5 Digital Adoption Index

**Definition**

Weighted directional index based on four normalized core metrics.

**Formula**

```text
Digital Adoption Index =
0.30 × Digital Penetration Score
+ 0.30 × Digital Customers per Branch Score
+ 0.20 × Digital Customers per Employee Score
+ 0.20 × Digital Customer Growth Score
```

**Unit**

Score from 0 to 100

**Business Meaning**

Provides a structured directional comparison of digital adoption based on selected public indicators.

**Important Caveat**

This is not an official bank ranking. It is a project-specific analytical framework.

---

## 3.6 Equal-Weight Sensitivity Index

**Definition**

Alternative version of the index using equal weights.

**Formula**

```text
Equal-Weight Index =
0.25 × Digital Penetration Score
+ 0.25 × Digital Customers per Branch Score
+ 0.25 × Digital Customers per Employee Score
+ 0.25 × Digital Customer Growth Score
```

**Unit**

Score from 0 to 100

**Business Meaning**

Tests whether the Digital Adoption Index ranking is sensitive to weight selection.

---

# 4. Supporting Indicators

Supporting indicators are excluded from the core benchmark and Digital Adoption Index.

They are still useful for bank-specific interpretation.

---

## 4.1 Mobile Banking Customers

**Definition**

Number of mobile banking customers disclosed by a bank.

**Used For**

Supporting mobile-first interpretation.

**Caveat**

Not consistently available for all banks.

---

## 4.2 İşCep Users

**Definition**

Number of İşCep users/customers disclosed by İşbank.

**Used For**

Supporting mobile banking adoption interpretation for İşbank.

**Caveat**

Used as a mobile banking proxy, not as a fully standardized cross-bank metric.

---

## 4.3 Mobile Transaction Share

**Definition**

Share of transactions conducted through mobile banking channels.

**Used For**

Supporting channel migration interpretation, especially for Akbank.

---

## 4.4 Non-Branch Transaction Ratio

**Definition**

Share of total banking transactions conducted through non-branch channels.

**Used For**

Supporting channel maturity interpretation.

**Caveat**

Not consistently disclosed across all banks in the same format.

---

## 4.5 POS Devices

**Definition**

POS devices or terminals disclosed by a bank.

**Used For**

Supporting payment ecosystem context.

**Caveat**

Excluded from the core benchmark due to inconsistent definitions across banks.

---

## 4.6 Digital Sales Ratio

**Definition**

Share of selected product sales conducted through digital channels.

**Used For**

Supporting product-level digitalization interpretation.

**Caveat**

Not consistently available across all selected banks for 2021-2025.

---

## 4.7 Nays Users

**Definition**

Number of Nays users disclosed by İşbank.

**Used For**

Supporting digital ecosystem context.

---

## 4.8 Maximum Mobile Users

**Definition**

Number of Maximum Mobile users disclosed by İşbank.

**Used For**

Supporting digital ecosystem context.

---

# 5. Recommended KPI Usage

## Use in Core Benchmark

- Reported digital customers/users
- Reported customer base
- Reported digital penetration
- Branches
- Employees
- ATMs
- Digital customers per branch
- Digital customers per employee
- Digital customer growth
- Digital Adoption Index

## Use as Supporting Indicators

- Mobile/app users
- POS devices
- Non-branch transaction ratio
- Digital sales ratio
- Mobile transaction indicators
- İşCep transaction share
- Nays users
- Maximum Mobile users

---

# 6. Interpretation Principles

The project follows these interpretation principles:

1. Do not compare non-standard mobile/app metrics directly as a core benchmark.
2. Do not include POS in the Digital Adoption Index.
3. Interpret customer base and digital customer metrics as reported public disclosure figures.
4. Treat İşbank 2025 customer base as a proxy.
5. Treat the Digital Adoption Index as directional, not official.
6. Use supporting indicators to enrich interpretation, not to produce direct rankings.
7. Separate sector-level TBB trends from bank-level peer benchmarking.
