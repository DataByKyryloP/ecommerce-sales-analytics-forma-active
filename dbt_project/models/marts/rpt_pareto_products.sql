-- SKU concentration (80/20 analysis)

WITH product_revenue AS (
    SELECT
        product_id,
        SUM(price * quantity) AS revenue
    FROM {{ ref('stg_order_line_items') }}
    GROUP BY product_id
),

ranked AS (
    SELECT *,
        SUM(revenue) OVER (ORDER BY revenue DESC) AS cumulative_revenue,
        SUM(revenue) OVER () AS total_revenue
    FROM product_revenue
)

SELECT
    product_id,
    revenue,
    cumulative_revenue / total_revenue AS revenue_ratio
FROM ranked