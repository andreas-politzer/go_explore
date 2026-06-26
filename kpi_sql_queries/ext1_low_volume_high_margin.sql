-- Extension 1: High-margin niche products for marketing promotions
SELECT
    p.Product_number AS product_number,
    p.Product_line AS product_line,
    SUM(ds.Quantity) AS total_quantity_sold,
    ROUND(AVG(ds.Unit_sale_price - p.Unit_cost), 2) AS avg_margin_per_unit,
    ROUND(SUM(ds.Quantity * (ds.Unit_sale_price - p.Unit_cost)), 2) AS total_profit
FROM `mystical-proj-500509.go_explore_project.daily_sales` ds
JOIN `mystical-proj-500509.go_explore_project.products` p 
    ON ds.Product_number = p.Product_number
GROUP BY product_number, product_line
HAVING SUM(ds.Quantity) < 5000 Definition für "Low-Volume"
ORDER BY avg_margin_per_unit DESC
LIMIT 10;