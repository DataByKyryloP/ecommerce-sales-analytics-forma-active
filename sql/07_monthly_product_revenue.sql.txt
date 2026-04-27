-- Q7 Business Question:
-- How does monthly revenue and order activity evolve over time?

SELECT
    order_month,
    COUNT(*) AS order_count,
    SUM(total_price) AS total_revenue,
    AVG(total_price) AS avg_order_value
FROM orders
GROUP BY order_month
ORDER BY order_month;

-- Insight:
-- Revenue shows strong growth from January to a peak in April–June, driven primarily by an increase in order volume rather than significant changes in average order value. After June, revenue stabilizes and slightly declines, while AOV remains relatively stable overall, indicating that fluctuations in revenue are primarily demand-driven rather than pricing-driven.


