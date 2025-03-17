select max(num) num
from (select num from mynumbers group by num having count(num) = 1)
