-- Extension 2: Revenue trends and developments over time (monthly)
SELECT
    FORMAT_DATE('%Y-%m', ds.Date) AS year_month,
    ROUND(SUM(ds.Quantity * ds.Unit_sale_price), 2) AS monthly_revenue,
    COUNT(DISTINCT ds.Retailer_code) AS active_stores_this_month
FROM `mystical-proj-500509.go_explore_project.daily_sales` ds
GROUP BY year_month
ORDER BY year_month ASC;