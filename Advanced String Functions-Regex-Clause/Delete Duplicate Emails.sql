DELETE FROM person 
WHERE id IN (
    SELECT id FROM (
        SELECT id, 
               ROW_NUMBER() OVER (PARTITION BY email ORDER BY id) AS rn
        FROM person
    )
    WHERE rn > 1
);
