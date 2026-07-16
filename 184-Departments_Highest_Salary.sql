-- link: https://leetcode.com/problems/department-highest-salary/

-- Write your MySQL query statement below
 select Department,Employee,salary as Salary from(
	select e.name as Employee,e.salary,e.departmentId,d.name as Department,Max(salary) over(partition by e.departmentId) as Max_salary  from Employee as e
	LEFT Join Department as d
	on e.departmentId = d.id
 ) as t1 where Salary = Max_Salary;