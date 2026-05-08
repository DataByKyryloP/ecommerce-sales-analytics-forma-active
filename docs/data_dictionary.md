# Data Dictionary — Forma Active Ecommerce Analytics

---

## customers (Neon)

| Column | Type | Description | Business Meaning | Example |
|--------|------|-------------|------------------|---------|
| customer_id | TEXT | Unique customer identifier | Tracks user-level purchasing behavior | CUST-001 |
| first_order | TIMESTAMP | First purchase timestamp | Used to define cohort start | 2026-04-01 |
| total_orders | BIGINT | Total number of orders per customer | Measures retention strength | 5 |
| lifetime_value | DOUBLE | Total revenue per customer | Core LTV metric | 1200.50 |
| cohort_month | TEXT | Month of first purchase | Used for cohort analysis | 2026-04 |
| cohort_index | BIGINT | Months since first order | Used in LTV curve analysis | 2 |
| segment | TEXT | Customer grouping | Used for marketing segmentation | VIP |

---

## orders (Neon)

| Column | Type | Description | Business Meaning | Example |
|--------|------|-------------|------------------|---------|
| order_id | TEXT | Unique order identifier | Tracks individual purchase events | CUST-001_1 |
| customer_id | TEXT | Links order to customer | Enables LTV + retention analysis | CUST-001 |
| created_at | TIMESTAMP | Order timestamp | Used for time-based revenue analysis | 2026-04-01 12:30:00 |
| total_price | BIGINT | Total order value | Core revenue metric per transaction | 165.00 |
| order_month | TEXT | Month extracted from created_at | Used for monthly revenue trends | 2026-04 |
| cohort_month | TEXT | Customer acquisition month | Used for cohort LTV analysis | 2026-04 |
| cohort_index | BIGINT | Months since first purchase | Measures customer lifecycle progression | 2 |

---

## order_line_items (Neon)

| Column | Type | Description | Business Meaning | Example |
|--------|------|-------------|------------------|---------|
| order_id | TEXT | Order reference ID | Links items to orders | CUST-001_1 |
| product_id | TEXT | Product identifier | Used for SKU performance analysis | 8189224517706 |
| variant_id | TEXT | Product variant ID | Tracks size/color-level variation | 43538059264074 |
| title | TEXT | Product name | Used for product analysis | The Complete Snowboard |
| quantity | BIGINT | Units purchased | Measures demand volume | 2 |
| price | DOUBLE | Unit price | Used for revenue calculation | 581.43 |
| revenue | DOUBLE | Total line revenue | Quantity × price | 1162.86 |
| created_at | TIMESTAMP | Order timestamp | Used for joins/time grouping | 2026-04-01 12:30:00 |

---

## products (Neon)

| Column | Type | Description | Business Meaning | Example |
|--------|------|-------------|------------------|---------|
| product_id | TEXT | Unique product identifier | Links SKUs across system | 8189224517706 |
| variant_id | TEXT | Variant-level ID | Differentiates product versions | 43538059264074 |
| title | TEXT | Product name | Used for merchandising analysis | The Complete Snowboard |
| price | DOUBLE | Base product price | Used for pricing comparisons | 581.43 |

---

## derived fields (analytics layer)

| Field | Type | Description | Business Meaning | Example |
|------|------|-------------|------------------|---------|
| order_month | TEXT (YYYY-MM) | Month extracted from order date | Enables time-series revenue analysis | 2026-04 |
| cohort_month | TEXT (YYYY-MM) | First purchase month per customer | Enables cohort-based LTV tracking | 2026-04 |
| cohort_index | BIGINT | Months since first purchase | Measures customer retention over time | 3 |
| revenue | DOUBLE | Line-level revenue (price × quantity) | Tracks product contribution to revenue | 1744.29 |

---

## data architecture note

This project follows a 3-layer analytics architecture:

1. **Raw Layer (Shopify API extract)**
   - Original transactional data
   - Limited structure and small sample size

2. **Transformed Layer (ETL + synthetic scaling)**
   - Expansion from 10 → 300 orders
   - Standardized schema for analytics consistency

3. **Warehouse Layer (Neon PostgreSQL)**
   - Analytical SQL queries (Q1–Q7)
   - Business metrics, cohort, LTV, and revenue analysis

---

## Grain Definition

- **customers**: 1 row per customer  
- **orders**: 1 row per order  
- **order_line_items**: 1 row per product per order  
- **products**: 1 row per product variant  

This ensures consistent aggregation logic across SQL, dbt, and BI layers.

---

## modeling assumption

All analytical metrics are based on a synthetic expansion of a 10-order Shopify development dataset scaled to 300 orders while preserving referential integrity.

