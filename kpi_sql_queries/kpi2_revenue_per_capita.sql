-- KPI 2: Revenue per Capita
SELECT
    r.Country AS country,
    ROUND(SUM(ds.Quantity * ds.Unit_sale_price), 2) AS total_revenue,
    emd.Population AS population,
    ROUND(SUM(ds.Quantity * ds.Unit_sale_price) / emd.Population, 4) AS revenue_per_capita
FROM `mystical-proj-500509.go_explore_project.daily_sales` ds
JOIN `mystical-proj-500509.go_explore_project.retailers` r 
    ON ds.Retailer_code = r.Retailer_code
LEFT JOIN `mystical-proj-500509.go_explore_project.external_market_data` emd 
    ON r.Country = emd.Country
GROUP BY country, emd.Population
ORDER BY revenue_per_capita DESC;