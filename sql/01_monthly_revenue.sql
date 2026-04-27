-- =========================================================
-- BUSINESS QUESTION:
-- How is monthly revenue trending over time?
--
-- WHY THIS MATTERS:
-- Tracks business growth, seasonality, and demand stability
-- Used by founders + finance to understand revenue health
-- =========================================================

SELECT 
    DATE_TRUNC('month', created_at) AS order_month,
    COUNT(*) AS orders,
    SUM(total_price) AS revenue,
    AVG(total_price) AS aov
FROM orders
GROUP BY 1
ORDER BY 1;

-- Insight:
-- Revenue shows steady growth from January to April, driven primarily by an increase in order volume rather than changes in average order value. After peaking in April–June, revenue stabilizes and slightly declines toward the end of the period, while AOV remains relatively stable with a temporary spike in August, indicating demand fluctuations rather than pricing changes.
