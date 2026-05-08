-- Customer LTV analysis

SELECT 
    customer_id,
    COUNT(*) AS orders,
    SUM(total_price) AS revenue,
    AVG(total_price) AS aov
FROM {{ ref('stg_orders') }}
GROUP BY customer_id
ORDER BY revenue DESC