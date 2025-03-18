SELECT 
    e.reports_to AS employee_id, 
    MAX(m.name) AS name,  -- Ensures one name per manager
    COUNT(e.employee_id) AS reports_count, 
    ROUND(AVG(e.age)) AS average_age
FROM employees e
JOIN employees m ON e.reports_to = m.employee_id
GROUP BY e.reports_to
ORDER BY e.reports_to;
