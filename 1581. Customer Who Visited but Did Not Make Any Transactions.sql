select CUSTOMER_ID, count(visits.visit_id) as count_no_trans
from visits left join Transactions
on visits.visit_id = Transactions.visit_id
where transaction_id is null
group by customer_id;