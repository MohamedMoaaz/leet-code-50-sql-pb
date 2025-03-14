SELECT ROUND(AVG(CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END) * 100, 2) immediate_percentage
FROM (
    SELECT *
    FROM delivery
    WHERE order_date = (
        SELECT MIN(order_date) 
        FROM delivery d2 
        WHERE d2.customer_id = delivery.customer_id
    )
);

--another solution

SELECT ROUND(AVG(CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END), 2)
FROM (
    SELECT delivery_id, customer_id, order_date, customer_pref_delivery_date,
           ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date ASC) AS rn
    FROM delivery
) earliest_orders
WHERE rn = 1;
