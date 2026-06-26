-- KPI 1: Total Revenue
SELECT
    r.Country AS country,
    ROUND(SUM(ds.Quantity * ds.Unit_sale_price), 2) AS total_revenue
FROM `mystical-proj-500509.go_explore_project.daily_sales` ds
JOIN `mystical-proj-500509.go_explore_project.retailers` r 
    ON ds.Retailer_code = r.Retailer_code
GROUP BY country
ORDER BY total_revenue DESC;