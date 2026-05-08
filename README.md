# 📊 Forma Active — End-to-End Ecommerce Analytics Engineering Pipeline

## Overview

This project simulates a real-world analytics engineering workflow for a direct-to-consumer (DTC) ecommerce brand (“Forma Active”). It demonstrates a full end-to-end data pipeline covering data extraction, transformation, modeling, and business intelligence.

The project follows a production-style analytics architecture using Python, SQL, PostgreSQL, dbt, and Tableau to analyze revenue performance, customer behavior, product analytics, and retention patterns.

---

## Business Questions

This project was designed to answer key ecommerce analytics questions:

- How is revenue trending over time?
- Which customers generate the highest lifetime value (LTV)?
- Which products contribute most to revenue?
- Is growth driven by acquisition or retention?
- How concentrated is revenue across customers and SKUs?
- What do cohort retention patterns reveal about customer behavior?

## Data Architecture

```text
Shopify API
    ↓
Python ETL (data extraction + transformation)
    ↓
Synthetic Data Scaling (10 → 300 orders simulation layer)
    ↓
PostgreSQL (Neon data warehouse)
    ↓
SQL Analytics Layer (Q1–Q7 queries)
    ↓
dbt Transformation Layer (staging + marts + tests)
    ↓
Tableau Dashboards & Storytelling Layer
```


## Dataset

- Source: Shopify Admin API (development store)
- Initial dataset: 10 real orders
- Expanded dataset: 300 synthetic orders (relational integrity preserved)

### Core Entities
- customers  
- orders  
- order_line_items  
- products  

---

## Tech Stack

- Python (Pandas, Requests)
- PostgreSQL (Neon)
- SQL (analytics queries)
- dbt (data modeling + testing)
- Tableau (dashboards)
- Git & GitHub (version control)

---

# 🧱 DBT + SQL LAYER

## Data Modeling (dbt Layer)

### Staging Models
- stg_customers  
- stg_orders  
- stg_order_line_items  
- stg_products  

**Responsibilities:**
- Cleaning raw data  
- Type normalization  
- Deduplication  
- Schema consistency  

---

### Mart Models (Business Layer)
- rpt_monthly_revenue — revenue trends  
- rpt_customer_ltv — customer lifetime value  
- rpt_product_performance — SKU ranking  
- rpt_aov_tiers — order value segmentation  
- rpt_pareto_products — revenue concentration  
- rpt_cohort_ltv — cohort retention + LTV  

---

## Data Quality & Testing

### Automated dbt Tests
- not_null constraints  
- unique key validation  
- referential integrity checks  

### Results
- dbt run: 10/10 models successful  
- dbt test: 9/9 tests passed  

Validation stored in `/dbt/`.

---

## SQL Analytics Layer

Exploratory SQL analysis included:

- Monthly revenue trends  
- Top customer analysis  
- Product performance ranking  
- Repeat purchase behavior  
- AOV segmentation  
- Pareto revenue analysis  
- Cohort LTV analysis  

---

# 📊 Tableau Dashboards

## Interactive Dashboards
- Executive revenue overview  
- Customer segmentation analysis  
- Cohort retention heatmap  
- Product performance distribution  
- Revenue concentration (80/20 analysis)  

**Tableau File:**
`tableau_public/Forma Active – Revenue & Retention Analysis.twbx`

---

## Key Insights

- Revenue is heavily concentrated in a small number of products (Pareto effect)
- A small group of customers drives most revenue
- Repeat purchases significantly increase LTV
- Growth is primarily acquisition-driven rather than retention-driven
- Cohort retention drops after initial purchase cycle

---

## Data Engineering Notes

- Synthetic scaling (10 → 300 orders) simulates production workload
- All transformations are fully reproducible via SQL + dbt
- Notebook exploration was refactored into a production-style pipeline

---

## Data Modeling (dbt Layer)

The dbt project implements a modular analytics engineering architecture:

---

### Staging Layer

Standardized raw warehouse tables:

- stg_customers  
- stg_orders  
- stg_order_line_items  
- stg_products  

**Responsibilities:**
- Data cleaning
- Type normalization
- Deduplication logic
- Schema consistency enforcement

---

### Mart Layer (Business Models)

Final analytical models used for reporting and dashboards:

- rpt_monthly_revenue — revenue trends over time  
- rpt_customer_ltv — customer lifetime value analysis  
- rpt_product_performance — SKU performance ranking  
- rpt_aov_tiers — order value segmentation  
- rpt_pareto_products — revenue concentration analysis  
- rpt_cohort_ltv — cohort retention and LTV tracking  

---

## Data Quality & Testing

All dbt models are validated using automated tests:

- not_null constraints  
- unique key validation  
- referential integrity checks  

### Execution Results

- dbt run: 10/10 models executed successfully  
- dbt test: 9/9 tests passed  

Validation evidence is available in the `/dbt/` folder.

## SQL Analytics (Exploratory Layer)

Before dbt modeling, SQL was used to validate business logic and explore key metrics:

- Monthly revenue trends  
- Top customer analysis  
- Product performance ranking  
- Repeat purchase behavior  
- AOV segmentation  
- Revenue concentration (Pareto analysis)  
- Cohort LTV analysis  

---

## Tableau Dashboards

Interactive dashboards built in Tableau Public:

- Executive revenue performance overview  
- Customer behavior segmentation  
- Cohort retention heatmap  
- Product performance distribution  
- Revenue concentration (80/20 analysis)  

📊 Tableau File:
tableau_public/Forma Active – Revenue & Retention Analysis.twbx  

---

## Key Business Insights

- Revenue is highly concentrated in a small number of products (Pareto effect)
- A small segment of customers drives disproportionate revenue
- Repeat purchases significantly increase total LTV
- Growth is primarily acquisition-driven rather than retention-driven
- Cohort analysis shows declining engagement after first purchase cycle


## Data Engineering Notes

- Synthetic scaling (10 → 300 orders) was used to simulate production-level analytics workload while preserving relational integrity
- All transformations are reproducible through SQL + dbt layers
- Notebook exploration was consolidated into a production-style pipeline for portfolio clarity

---

## Repository Structure

```text
ecommerce-analytics-forma-active/
│
├── dbt_project/
├── sql/
├── data/query_outputs/
├── notebooks/
├── tableau_public/
├── visuals/
├── docs/
└── README.md
```
## Data Dictionary

Available in:  
`docs/data_dictionary.md`

---

## Project Status

✔ End-to-end analytics pipeline completed  
✔ dbt transformation layer implemented  
✔ SQL analytical layer (Q1–Q7) completed  
✔ Tableau dashboards built  
✔ Data quality testing implemented  
✔ Portfolio-ready analytics engineering project  

---

## Future Improvements

- Airflow or Prefect orchestration  
- Incremental dbt models for scalability  
- Live Shopify API integration  
- Automated data quality monitoring  
- Public BI deployment for dashboards  

---

## Data Source

Shopify Admin API (development store simulation)

---

## Closing Note

This project demonstrates a complete analytics engineering workflow, integrating extraction, transformation, modeling, and visualization into a reproducible end-to-end data pipeline.
