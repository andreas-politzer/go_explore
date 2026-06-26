-- Extension 3: Geographical database for the future map dashboard
SELECT
    r.Country AS country,
    COUNT(DISTINCT r.Retailer_code) AS total_active_stores,
    ROUND(SUM(ds.Quantity * ds.Unit_sale_price), 2) AS total_revenue
FROM `mystical-proj-500509.go_explore_project.daily_sales` ds
JOIN `mystical-proj-500509.go_explore_project.retailers` r 
    ON ds.Retailer_code = r.Retailer_code
GROUP BY country
ORDER BY total_revenue DESC;