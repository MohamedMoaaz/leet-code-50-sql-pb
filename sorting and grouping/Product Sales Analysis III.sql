select s2.product_id, s1.first_year, s2.quantity, s2.price
from (select product_id, min(year) as first_year
from sales
group by product_id) s1
join sales s2
on s1.product_id = s2.product_id
and s1.first_year = s2.year

-- another solution 

SELECT product_id, year AS first_year, quantity, price
FROM (
    SELECT product_id, year, quantity, price,
           ROW_NUMBER() OVER (PARTITION BY product_id ORDER BY year ASC) AS rn
    FROM sales
) s
WHERE rn = 1;
