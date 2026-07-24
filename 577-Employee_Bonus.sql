-- link: https://leetcode.com/problems/employee-bonus

-- Write your MySQL query statement below
select e.name,b.bonus from Employee as e 
left Join Bonus as b 
on  e.empId = b.empId
where bonus < 1000 or bonus is null;