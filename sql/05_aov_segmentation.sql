-- Business Question:
-- Which order value tier drives Forma Active's revenue concentration?
-- Relevant to: Finance / Marketing

WITH order_values AS (
    SELECT
        order_id,
        total_price / 100.0 AS order_value   -- ✅ SAFE: works for both cases
    FROM orders
),

ranked_orders AS (
    SELECT
        order_id,
        order_value,
        NTILE(3) OVER (ORDER BY order_value) AS aov_tier_num
    FROM order_values
),

labeled_orders AS (
    SELECT
        order_id,
        order_value,
        CASE
            WHEN aov_tier_num = 1 THEN 'Low'
            WHEN aov_tier_num = 2 THEN 'Mid'
            WHEN aov_tier_num = 3 THEN 'High'
        END AS aov_tier
    FROM ranked_orders
)

SELECT
    aov_tier,
    COUNT(*) AS order_count,
    ROUND(AVG(order_value), 2) AS avg_order_value,
    ROUND(SUM(order_value), 2) AS total_revenue,
    ROUND(SUM(order_value) * 100.0 / SUM(SUM(order_value)) OVER (), 2) AS revenue_pct
FROM labeled_orders
GROUP BY aov_tier
ORDER BY
    CASE
        WHEN aov_tier = 'Low' THEN 1
        WHEN aov_tier = 'Mid' THEN 2
        WHEN aov_tier = 'High' THEN 3
    END;

-- Insight:
-- High AOV orders generate over 50% of total revenue despite representing only one-third of orders, indicating strong revenue dependence on higher-value transactions and potential opportunity to optimize pricing and upselling strategies.




