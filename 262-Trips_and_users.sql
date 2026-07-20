-- link: https://leetcode.com/problems/trips-and-users

-- Write your MySQL query statement below
select request_at as Day,
    Round(sum(`status` != 'completed')/count(*),2) as `Cancellation Rate`
from trips as t 
join users as c
on c.users_id = t.client_id
join users as d 
on d.users_id = t.driver_id
where c.banned = "No" and d.banned = "No" AND request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY request_at  ORDER BY Day;