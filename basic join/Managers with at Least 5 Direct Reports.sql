select nvl(m.name, null) as name
from employee m join employee e
on m.id = e.managerId
group by NVL(m.name, null), m.id
having count(*) >= 5
