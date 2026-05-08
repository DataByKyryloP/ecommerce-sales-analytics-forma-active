-- Business Question:
-- How concentrated is revenue across products? Do a small number of SKUs drive most revenue?
-- Relevant to: Finance / Operations

WITH product_revenue AS (
    SELECT
        product_id,
        SUM(price * quantity) AS revenue
    FROM order_line_items
    GROUP BY product_id
),

ranked_products AS (
    SELECT
        product_id,
        revenue,
        SUM(revenue) OVER (ORDER BY revenue DESC) AS cumulative_revenue,
        SUM(revenue) OVER () AS total_revenue
    FROM product_revenue
),

final AS (
    SELECT
        product_id,
        revenue,
        cumulative_revenue / total_revenue AS revenue_ratio,
        CASE
            WHEN cumulative_revenue / total_revenue <= 0.8 THEN 'Top 80%'
            ELSE 'Bottom 20%'
        END AS pareto_flag
    FROM ranked_products
)

SELECT COUNT(*)
FROM final
WHERE pareto_flag = 'Top 80%';

