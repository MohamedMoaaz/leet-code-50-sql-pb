WITH first_login AS (
    -- Find the first login date for each player
    SELECT player_id, MIN(event_date) AS first_login_date
    FROM activity
    GROUP BY player_id
)
SELECT 
    ROUND(
        COUNT(A1.player_id) 
        / (SELECT COUNT(DISTINCT A3.player_id) FROM activity A3),
        2
    ) AS fraction
FROM activity A1
JOIN first_login A2
ON A1.player_id = A2.player_id 
AND A1.event_date = A2.first_login_date + INTERVAL '1' DAY;
