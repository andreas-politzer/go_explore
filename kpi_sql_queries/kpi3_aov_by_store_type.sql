-- KPI 3: Average Order Value (AOV) by Store Type
-- Note: No native Order ID exists. We use Date + Retailer_code as a proxy for one order.
SELECT
    r.Type AS store_type,
    ROUND(
        SUM(ds.Quantity * ds.Unit_sale_price) /
        COUNT(DISTINCT CONCAT(CAST(ds.Date AS STRING), '-', CAST(ds.Retailer_code AS STRING))),
    2) AS avg_order_value
FROM `mystical-proj-500509.go_explore_project.daily_sales` ds
JOIN `mystical-proj-500509.go_explore_project.retailers` r
    ON ds.Retailer_code = r.Retailer_code
GROUP BY store_type
ORDER BY avg_order_value DESC;