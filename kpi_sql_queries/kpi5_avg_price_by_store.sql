-- KPI 5: Price segmentation (average product price by retailer type)
SELECT
    r.Type AS store_type,
    ROUND(AVG(ds.Unit_sale_price), 2) AS avg_product_price
FROM `mystical-proj-500509.go_explore_project.daily_sales` ds
JOIN `mystical-proj-500509.go_explore_project.retailers` r 
    ON ds.Retailer_code = r.Retailer_code
GROUP BY store_type
ORDER BY avg_product_price DESC;