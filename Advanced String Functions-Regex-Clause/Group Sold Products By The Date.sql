select to_char(sell_date, 'YYYY-MM-DD') sell_date,
count(product) num_sold,
LISTAGG(product, ',') within group (order by product) products
from (select distinct sell_date, product from activities)
group by sell_date
order by sell_date
