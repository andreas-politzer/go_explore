-- KPI 4: Aktivitätsdichte (Transaktionen und Verkaufstage pro Filiale)
SELECT
    r.Retailer_name AS retailer_name,
    r.Country AS country,
    COUNT(*) AS total_transactions,
    COUNT(DISTINCT ds.Date) AS unique_sales_days
FROM `mystical-proj-500509.go_explore_project.daily_sales` ds
JOIN `mystical-proj-500509.go_explore_project.retailers` r 
    ON ds.Retailer_code = r.Retailer_code
GROUP BY retailer_name, country
ORDER BY total_transactions DESC;