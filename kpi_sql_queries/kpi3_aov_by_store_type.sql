-- KPI 3: Durchschnittlicher Wert pro Transaktionszeile nach Händlertyp
-- (Kompensation für fehlende native Order_ID)
SELECT
    r.Type AS store_type,
    ROUND(AVG(ds.Quantity * ds.Unit_sale_price), 2) AS avg_transaction_value
FROM `mystical-proj-500509.go_explore_project.daily_sales` ds
JOIN `mystical-proj-500509.go_explore_project.retailers` r 
    ON ds.Retailer_code = r.Retailer_code
GROUP BY store_type
ORDER BY avg_transaction_value DESC;