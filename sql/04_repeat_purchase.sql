-- =========================================================
-- BUSINESS QUESTION:
-- What percentage of customers make repeat purchases?
--
-- WHY THIS MATTERS:
-- Core retention metric — indicates product stickiness.
-- Critical for subscription / DTC growth evaluation.
-- =========================================================

WITH customer_orders AS (
    SELECT 
        customer_id,
        COUNT(*) AS order_count
    FROM orders
    GROUP BY customer_id
)

SELECT 
    order_count,
    COUNT(*) AS customers
FROM customer_orders
GROUP BY order_count
ORDER BY order_count;

-- Insight:
-- Revenue is heavily concentrated in a single dominant product, with a steep drop-off across remaining SKUs. This indicates strong reliance on one primary revenue driver, while secondary products contribute marginally to total sales, highlighting potential portfolio imbalance and risk exposure.

