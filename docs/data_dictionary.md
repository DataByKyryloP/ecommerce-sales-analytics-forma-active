### customers (Neon)

| Column | Type | Description | Business Meaning | Example |
|--------|------|-------------|------------------|---------|
| customer_id | TEXT | Unique customer identifier | Tracks user-level purchasing behavior | CUST-001 |
| first_order | TIMESTAMP | First purchase timestamp | Used to define cohort start | 2026-04-01 |
| total_orders | BIGINT | Total number of orders per customer | Measures retention strength | 5 |
| lifetime_value | DOUBLE | Total revenue per customer | Core LTV metric | 1200.50 |
| cohort_month | TEXT | Month of first purchase | Used for cohort analysis | 2026-04 |
| cohort_index | BIGINT | Months since first order | Used in LTV curve analysis | 2 |
| segment | TEXT | Customer grouping | Used for marketing segmentation | VIP |

### orders (Neon)

| Column | Type | Description | Business Meaning | Example |
|--------|------|-------------|------------------|---------|
| order_id | TEXT | Unique order identifier | Tracks individual purchase events | CUST-001_1 |
| customer_id | TEXT | Links order to customer | Enables LTV + retention analysis | CUST-001 |
| created_at | TIMESTAMP | Order timestamp | Used for time-based revenue analysis | 2026-04-01 12:30:00 |
| total_price | BIGINT | Total order value | Core revenue metric per transaction | 165.00 |
| order_month | TEXT | Month extracted from created_at | Used for monthly revenue trends | 2026-04 |
| cohort_month | TEXT | Customer acquisition month | Used for cohort LTV analysis | 2026-04 |
| cohort_index | BIGINT | Months since first purchase | Measures customer lifecycle progression | 2 |

### order_line_items (Neon)

| Column | Type | Description | Business Meaning | Example |
|--------|------|-------------|------------------|---------|
| order_id | TEXT | Order reference ID | Links items to orders | CUST-001_1 |
| product_id | DOUBLE | Product identifier | Used for SKU performance analysis | 8189224517706 |
| variant_id | DOUBLE | Product variant ID | Tracks size/color-level variation | 43538059264074 |
| title | TEXT | Product name | Used for product analysis | The Complete Snowboard |
| quantity | BIGINT | Units purchased | Measures demand volume | 2 |
| price | DOUBLE | Unit price | Used for revenue calculation | 581.43 |
| revenue | DOUBLE | Total line revenue | Quantity × price | 1162.86 |
| created_at | TEXT | Order timestamp (string) | Used for joins/time grouping | 2026-04-01 |

### products (Neon)

| Column | Type | Description | Business Meaning | Example |
|--------|------|-------------|------------------|---------|
| product_id | DOUBLE | Unique product identifier | Links SKUs across system | 8189224517706 |
| variant_id | DOUBLE | Variant-level ID | Differentiates product versions | 43538059264074 |
| title | TEXT | Product name | Used for merchandising analysis | The Complete Snowboard |
| price | DOUBLE | Base product price | Used for pricing comparisons | 581.43 |

### derived fields (analytics layer)

| Field        | Type                                                                                 | Description                       | Business Meaning                             | Example |
| ------------ | ------------------------------------------------------------------------------------ | --------------------------------- | -------------------------------------------- | ------- |
| order_month  | TEXT (derived monthly field; recommended to be cast to DATE in transformation layer) | Month extracted from order date   | Enables time-series revenue analysis         | 2026-04 |
| cohort_month | TEXT (derived monthly field; recommended to be cast to DATE in transformation layer) | First purchase month per customer | Enables cohort-based LTV tracking            | 2026-04 |
| cohort_index | BIGINT                                                                               | Months since first purchase       | Measures customer retention over time        | 3       |
| revenue      | DOUBLE (derived field: price × quantity)                                             | Line-level revenue per product    | Tracks product contribution to total revenue | 1744.29 |

### data architecture note

This project follows a 3-layer analytics architecture:

1. Raw Layer (Shopify API extract)
   - Original transactional data
   - Limited structure and small sample size

2. Transformed Layer (CSV / Jupyter output)
   - Synthetic scaling (SIM-0 → SIM-299)
   - Standardized schema for analytics consistency

3. Warehouse Layer (Neon PostgreSQL)
   - Analytical queries (Q1–Q7)
   - Business metrics + cohort + revenue analysis

