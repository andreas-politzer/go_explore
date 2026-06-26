-- KPI 4: Orders per Store by Store Type
SELECT
    r.Type AS store_type,
    COUNT(DISTINCT CONCAT(CAST(ds.Date AS STRING), '-', CAST(ds.Retailer_code AS STRING))) AS total_orders,
    COUNT(DISTINCT ds.Retailer_code) AS number_of_stores,
    ROUND(
        COUNT(DISTINCT CONCAT(CAST(ds.Date AS STRING), '-', CAST(ds.Retailer_code AS STRING))) /
        COUNT(DISTINCT ds.Retailer_code),
    2) AS orders_per_store
FROM `mystical-proj-500509.go_explore_project.daily_sales` ds
JOIN `mystical-proj-500509.go_explore_project.retailers` r
    ON ds.Retailer_code = r.Retailer_code
GROUP BY store_type
ORDER BY orders_per_store DESC;