-- link: https://leetcode.com/problems/rising-temperature

-- Write your MySQL query statement below
select id from (
	select *,
    lag(temperature) over(order by recordDate ASC) as prev_temp ,
    lag(recordDate) over(order by recordDate ASC) as prev_date 
    from Weather
) as t1 where prev_temp < temperature and DATEDIFF(recordDate,prev_date) = 1;