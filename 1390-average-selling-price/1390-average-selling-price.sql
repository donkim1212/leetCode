SELECT p.product_id,
    COALESCE(ROUND(SUM(us.units * p.price) / SUM(us.units), 2), 0) AS average_price
FROM Prices p
LEFT JOIN UnitsSold us
    ON us.product_id = p.product_id
    AND us.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY 1