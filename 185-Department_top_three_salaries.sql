-- link: https://leetcode.com/problems/department-top-three-salaries/

-- Write your MySQL query statement below
select dept as Department,name as Employee,salary  from (
	select e.name,e.salary,e.departmentId,
    DENSE_RANK() over(PARTITION BY departmentId ORDER BY e.salary desc) as rnk,d.name as dept
	from Employee as e
    left Join Department as d 
    on e.departmentId = d.id 
) as t where rnk <= 3;