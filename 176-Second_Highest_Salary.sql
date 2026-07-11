-- link: https://leetcode.com/problems/second-highest-salary

select Max(salary) as SecondHighestSalary from (
	select salary , Rank() OVER(ORDER BY salary desc) as rnk from (
		select DISTINCT(salary) from Employee ORDER BY salary desc
	) as t1
