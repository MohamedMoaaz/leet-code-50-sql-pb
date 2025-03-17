with cte as(
    select count(distinct product_key) cnt, customer_id
    from customer
    group by customer_id
)
select distinct customer.customer_id
from customer  join cte
on customer.customer_id = cte.customer_id
where cnt = (select count(product_key) from product)
