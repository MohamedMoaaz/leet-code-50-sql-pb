with cte as
    (select product_id, sum(unit) unit
    from orders
    where to_char(order_date, 'YYYY-MM') = '2020-02'
    group by product_id
    having sum(unit) >= 100)
select product_name, unit
from products p join cte c
on p.product_id = c.product_id
