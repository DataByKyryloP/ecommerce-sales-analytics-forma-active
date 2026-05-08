-- =========================================================
-- BUSINESS QUESTION:
-- Who are the highest value customers and how is revenue distributed?
--
-- WHY THIS MATTERS:
-- Identifies VIP customers driving disproportionate revenue.
-- Helps marketing target retention + loyalty programs.
-- =========================================================

SELECT 
    customer_id,
    COUNT(*) AS orders,
    SUM(total_price) AS revenue,
    AVG(total_price) AS aov
FROM orders
GROUP BY customer_id
ORDER BY revenue DESC;

-- Insight:
-- Revenue is distributed across a small group of high-value customers, with the top customers contributing a disproportionate share of total revenue. While order frequency varies, revenue concentration among top users indicates that retention of a small segment of customers is critical to overall performance.
