-- Cohort LTV analysis

WITH base AS (
    SELECT
        customer_id,
        cohort_month
    FROM {{ ref('stg_customers') }}
),

orders_enriched AS (
    SELECT
        o.customer_id,
        o.created_at,
        o.total_price,
        c.cohort_month
    FROM {{ ref('stg_orders') }} o
    JOIN base c
        ON o.customer_id = c.customer_id
)

SELECT
    cohort_month,
    DATE_TRUNC('month', created_at) AS order_month,
    SUM(total_price) AS revenue,
    COUNT(DISTINCT customer_id) AS active_customers
FROM orders_enriched
GROUP BY 1,2
ORDER BY 1,2