with cte1 as
(
    select person_name, turn, sum(weight) over (order by turn) f_w
    from queue
),
cte2 as
(
    select person_name, f_w, lead(f_w) over (order by turn) s_w
    from cte1
)
select person_name
from cte2
where f_w <= 1000 and (s_w > 1000 or s_w is null)
