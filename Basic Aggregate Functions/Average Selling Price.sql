SELECT P.product_id,  
       NVL(ROUND(SUM(P.price * U.units) / SUM(U.units), 2), 0) AS average_price  
FROM Prices P  left JOIN UnitsSold U 
ON P.product_id = U.product_id  and U.purchase_date between P.start_date and P.end_date
GROUP BY P.product_id;
