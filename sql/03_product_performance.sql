-- =========================================================
-- BUSINESS QUESTION:
-- Which products generate the most revenue and volume?
--
-- WHY THIS MATTERS:
-- Helps merchandising decisions and inventory prioritisation.
-- Identifies hero vs underperforming products.
-- =========================================================

SELECT 
    product_id,
    SUM(quantity) AS units_sold,
    SUM(revenue) AS revenue
FROM order_line_items
GROUP BY product_id
ORDER BY revenue DESC;
-- Insight:
-- Revenue is heavily concentrated in a single dominant product, with a steep drop-off across remaining SKUs. This indicates strong reliance on one primary revenue driver, while secondary products contribute marginally to total sales, highlighting potential portfolio imbalance and risk exposure.
