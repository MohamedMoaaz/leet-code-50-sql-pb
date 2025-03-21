with cte as (
    select num,
    lag(num) over (order by id) previous_num,
    lead(num) over (order by id) comming_num
from logs)
select distinct num ConsecutiveNums
from cte
where num = PREVIOUS_NUM and num = comming_num
