-- Product performance analysis

SELECT 
    product_id,
    SUM(quantity) AS units_sold,
    SUM(revenue) AS revenue
FROM {{ ref('stg_order_line_items') }}
GROUP BY product_id
ORDER BY revenue DESC