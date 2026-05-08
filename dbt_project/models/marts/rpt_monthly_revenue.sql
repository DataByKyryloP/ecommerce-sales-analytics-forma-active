-- Monthly revenue trend

SELECT 
    DATE_TRUNC('month', created_at) AS order_month,
    COUNT(*) AS orders,
    SUM(total_price) AS revenue,
    AVG(total_price) AS aov
FROM {{ ref('stg_orders') }}
GROUP BY 1
ORDER BY 1