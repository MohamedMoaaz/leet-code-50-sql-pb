with cte as
    (select requester_id id, count(requester_id) count
    from RequestAccepted
    group by requester_id

    union all

    select accepter_id id, count(accepter_id) count
    from RequestAccepted
    group by accepter_id
),
cte2 as
    (
    select id, sum(count) total
    from cte
    group by id
    )
select id, total num
from cte2
where total = (select max(total) from cte2)
