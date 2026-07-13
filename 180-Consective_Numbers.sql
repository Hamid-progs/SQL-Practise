-- link: https://leetcode.com/problems/consecutive-numbers

-- Write your MySQL query statement below
 select Distinct(num) as ConsecutiveNums from (
	select id, num,
		lag(num) over() as lag_gpa ,
		lead(num) over() as lead_gpa 
	from Logs
 ) as result where num = lag_gpa AND num = lead_gpa;