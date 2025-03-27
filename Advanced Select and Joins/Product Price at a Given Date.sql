with cte1 as (select product_id, new_price price, rank() over (partition by product_id order by change_date desc) rank
from products
where change_date <= '2019-08-16'),
cte2 as (
    select product_id, 10 price, min(change_date)
from products
group by product_id
having min(change_date) > '2019-08-16'
)
select product_id, price
from cte1
where rank = 1
union
select product_id, price
from cte2
