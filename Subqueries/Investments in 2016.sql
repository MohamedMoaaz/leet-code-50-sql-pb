with cte as
        (
        select i1.pid, i1.tiv_2015, i1.tiv_2016
        from insurance i1 join insurance i2
        on i1.lat = i2.lat and i1.lon = i2.lon and i1.pid <> i2.pid
        ),
    cte2 as
        (
        select i1.pid, i1.tiv_2015, i1.tiv_2016
        from insurance i1 join insurance i2
        on i1.tiv_2015 = i2.tiv_2015 and i1.pid <> i2.pid
        )
  select sum(TIV_2016) tiv_2016 from insurance
  where pid not in (select pid from cte) and pid in (select pid from cte2)
