with cte as
(
    select case when income < 20000 then 'Low Salary'
    when income > 50000 then 'High Salary'
    else 'Average Salary' end as category
    from accounts
)
select category, count(category) accounts_count
from cte
group by category
union all
select 'Low Salary', 0 from dual where not exists (select 1 from cte where category = 'Low Salary')
union all
select 'Average Salary', 0 from dual where not exists (select 1 from cte where category = 'Average Salary')
union all
select 'High Salary', 0 from dual where not exists (select 1 from cte where category = 'High Salary');
