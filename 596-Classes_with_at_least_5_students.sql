-- link: https://leetcode.com/problems/classes-with-at-least-5-students

-- Write your MySQL query statement below
select class from (
    select class , count(student) as total from Courses group by class
) as t1 
where total >= 5;
