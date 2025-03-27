WITH cte AS (
    SELECT id, salary, DENSE_RANK() OVER (ORDER BY salary DESC) AS rank
    FROM employee
)
SELECT COALESCE((
    SELECT MAX(salary) FROM cte WHERE rank = 2
), NULL) AS SecondHighestSalary
FROM dual;
