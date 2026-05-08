# dbt Transformation Layer — Forma Active

## Overview

This dbt project implements a modular transformation layer on top of raw Shopify ecommerce data stored in PostgreSQL.

It follows a standard analytics engineering architecture:

Raw Data → Staging Models → Mart Models → BI Layer

---

## Tools

- dbt
- PostgreSQL (Neon)
- SQL
- Shopify API (source system)
- Tableau (downstream BI)

---

## Project Structure

### Staging Layer

Staging models standardize raw ingestion tables:

- customers
- orders
- order_line_items
- products

Responsibilities:
- Data type normalization
- Column standardization
- Null handling
- Grain definition enforcement

---

### Mart Layer (Business Models)

Mart models contain business-ready metrics used for analytics and reporting:

- rpt_monthly_revenue
- rpt_customer_ltv
- rpt_product_performance
- rpt_aov_tiers
- rpt_pareto_products
- rpt_cohort_ltv

These models serve as the foundation for SQL analysis and Tableau dashboards.

---

## Data Quality

Data quality is enforced using dbt schema tests:

- not_null constraints
- unique key validation
- referential integrity checks

Data quality validation screenshots are available in the /dbt/ folder of the repository.

---

## Execution Results

- dbt run: 10/10 models executed successfully (staging + marts)
- dbt test: 9/9 tests passed (data quality + integrity validation)

---

## Data Dictionary Alignment

This dbt layer is aligned with the project data dictionary located in:

docs/data_dictionary.md

Which defines:
- Table schemas
- Field-level business meaning
- Derived metrics
- Grain definitions

---

## Output Usage

dbt models feed into:
- SQL analytical queries (Q1–Q7)
- Tableau dashboards
- KPI reporting layer

---

## Business Impact

This dbt layer enables consistent, testable transformation logic for ecommerce analytics,
supporting revenue tracking, customer retention analysis, and product performance reporting.
