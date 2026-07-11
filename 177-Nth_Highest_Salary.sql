-- link: https://leetcode.com/problems/nth-highest-salary

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
      select salary from (
	select salary , Rank() OVER(ORDER BY salary desc) as rnk from (
		select DISTINCT(salary) from Employee ORDER BY salary desc
	) as t1
) as t2  where rnk = N

  );
END