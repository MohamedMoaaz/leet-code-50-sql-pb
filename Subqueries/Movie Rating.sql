WITH c1 AS (
    SELECT user_id, COUNT(movie_id) AS count
    FROM movierating
    GROUP BY user_id
), 
c2 AS (
    SELECT movie_id, AVG(rating) AS avg_rating
    FROM movierating
    WHERE TRUNC(created_at, 'MM') = DATE '2020-02-01'
    GROUP BY movie_id
)
SELECT results FROM (
    SELECT u.name AS results
    FROM users u 
    JOIN c1 ON u.user_id = c1.user_id
    WHERE count = (SELECT MAX(count) FROM c1)
    ORDER BY u.name
) WHERE ROWNUM = 1

UNION ALL

SELECT results FROM (
    SELECT m.title AS results
    FROM movies m 
    JOIN c2 ON m.movie_id = c2.movie_id
    WHERE avg_rating = (SELECT MAX(avg_rating) FROM c2)
    ORDER BY m.title
) WHERE ROWNUM = 1

ORDER BY results;
