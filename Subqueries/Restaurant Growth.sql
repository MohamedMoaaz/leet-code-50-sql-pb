WITH cte AS (
    SELECT visited_on, SUM(amount) AS amount
    FROM customer
    GROUP BY visited_on
),
moving_avg_cte AS (
    SELECT 
        TO_CHAR(visited_on, 'YYYY-MM-DD') AS visited_on,
        SUM(amount) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS amount,
        ROUND(AVG(amount) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW), 2) AS average_amount,
        row_number() over (order by visited_on) row_num
    FROM cte
)
SELECT visited_on, amount, average_amount
FROM moving_avg_cte
WHERE row_num >= 7;
