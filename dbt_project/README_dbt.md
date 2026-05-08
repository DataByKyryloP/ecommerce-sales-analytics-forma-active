# dbt Transformation Layer — Forma Active

## Overview

This dbt project implements a modular transformation layer on top of raw Shopify ecommerce data stored in PostgreSQL.

It follows a standard analytics engineering architecture:

Raw Data → Staging Models → Mart Models → BI Layer

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

- Revenue analysis (fct_revenue)
- Customer lifetime value (fct_customer_ltv)
- Product performance (fct_product_performance)
- Repeat purchase behavior (fct_repeat_purchase)
- Cohort retention analysis (fct_cohort_ltv)

These models serve as the foundation for SQL analysis and Tableau dashboards.

---

## Data Quality

Data quality is enforced using dbt schema tests:

- not_null constraints
- unique key validation
- referential integrity checks

---

## Execution Results

- dbt run: 10/10 models executed successfully
- dbt test: 9/9 tests passed

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