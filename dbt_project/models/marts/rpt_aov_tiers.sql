-- AOV tier segmentation

WITH order_values AS (
    SELECT
        order_id,
        total_price AS order_value
    FROM {{ ref('stg_orders') }}
),

ranked AS (
    SELECT *,
        NTILE(3) OVER (ORDER BY order_value) AS tier
    FROM order_values
)

SELECT
    CASE 
        WHEN tier = 1 THEN 'Low'
        WHEN tier = 2 THEN 'Mid'
        WHEN tier = 3 THEN 'High'
    END AS aov_tier,
    COUNT(*) AS orders,
    AVG(order_value) AS avg_order_value,
    SUM(order_value) AS total_revenue
FROM ranked
GROUP BY 1
ORDER BY 1