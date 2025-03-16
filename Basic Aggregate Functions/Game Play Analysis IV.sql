SELECT ROUND(COUNT (b.player_id)/COUNT(a.player_id),2) AS fraction
FROM (SELECT player_id, MIN(event_date) AS event_date FROM Activity
GROUP BY player_id) a
LEFT JOIN Activity b
ON a.player_id = b.player_id AND a.event_date+1 = b.event_date;
