-- ============================================================
-- SCHOOL DATABASE - Practice Solutions (SELECT/JOIN/Window fn queries)
-- Run final_school_database.sql first to set up the schema/data
-- ============================================================

-- day1 ==========================================================
-- Display all students
use school; 
select * from students;

-- Display first and last name of every student
select first_name , last_name from students;

-- show all teachers 
SELECT * from teachers;

-- show all courses 
select * from courses;

-- show all departments
select * from departments;

-- display female students
select * from students where gender = 'F';

-- display all male students
select * from students where gender = 'M';

-- show students gpa > 3.5 
select * from students where  gpa > 3.5;

-- show students gpa < 3 
select * from students where gpa < 3;

-- show all the students studying in grade 11 
select * from students where grade_level = 11;

-- show student gpa between 3 and 3.8
select * from students WHERE gpa >= 3.0 and gpa <= 3.8;

-- show teachers whose sallary > 75000
select * from teachers where salary > 75000;

-- show teacher hired after 2018 
select * from teachers where YEAR(hire_date) > 2018;

-- show course have 4 credits hours 
select * from courses where credits = 4;

-- show course max > 30
select * from courses where max_students >30; 

-- show students name starts with "A"
select * from students where first_name LIKE 'A%' ;

-- select teachers whose last name ends with 'n'
select * from teachers where last_name LIKE '%n';

--  show course having name programing
select * from courses where title LIKE '%Programming%';

-- show dep name contain computer 
select * from departments where name  like '%Computer%';

-- day2 =====================================================
-- show all unique grade levels from the students table
use school;
select DISTINCT(grade_level) from students;

-- count totla number of teachers 
select count(*) from teachers;

-- find highest gpa 
select max(gpa) from students ;

-- find lowest gpa 
select min(gpa) from students;

-- find average gpa
select avg(gpa) from students;

-- find average teachders sallary 
select avg(salary) from teachers;

-- find total number of courses 
select COUNT(course_code) from courses;

-- show student order by gpa 
Select * from students ORDER BY gpa DESC;

-- show teachers order by salary 
select * from teachers ORDER BY salary ASC;

-- show first 10 students
select * from students limit 10;

-- display last 5 students based on student id 
SELECT * from students ORDER BY student_id DESC limit 5;

-- dispaly students who were born after 2008 - 01 - 01 
select * from students where date_of_birth > '2008-01-01';

-- display the students phone number starts with 0311
select * from students where phone LIKE '0311%';

-- show students whose email ends with students.edu
select * from students where email LIKE '%students.edu';

-- day3 ==========================================
 use school;

 -- display each student first name along with the course they are inrolled in 
SELECT s.first_name, c.title from students as s 
Inner Join attendance as a
on s.student_id = a.student_id
INNER JOIN courses as c
on  a.course_id = c.course_id;

-- dispaly student full name and enrolment date 
Select concat(first_name," ",last_name) as full_name, enroll_date  from students;

-- show every course with teacher first and last name 
Select c.title , t.first_name,t.last_name from courses as c 
INNER JOIN teachers as t 
ON c.teacher_id = t.teacher_id;

-- Display student name, course title, and enrollment status.
Select concat(s.first_name," " , s.last_name) as full_name, c.title , e.status from students as s 
INNER JOIN enrollments as e
on s.student_id = e.student_id 
INNER JOIN courses as c 
on e.course_id = c.course_id;

-- Display each teacher along with the department they belong to.
select concat(t.first_name," " ,t.last_name) as teacher_name, d.name from teachers as t 
INNER JOIN departments as d 
on t.department_id = d.department_id;

-- Show course title and department name.
select c.title , d.name from courses as c
INNER JOIN departments  as d
ON c.department_id = d.department_id;

-- Show every exam with its corresponding course title.
select e.exam_type, c.title from exams as e 
INNER JOIN courses as c 
ON e.course_id = c.course_id;

-- Show student name, assignment name, and score.
select concat(s.first_name," " ,s.last_name) as Name ,g.assignment  ,g.score    from students as s 
Inner Join enrollments as e 
on s.student_id = e.student_id 
Inner Join  grades as g 
on e.enrollment_id = g.enrollment_id;


-- Day4 -=====================================================

-- Display: Student Name ,Course Title ,Teacher Name
use school;

Select concat(s.first_name," " ,s.last_name) as Name , c.title, concat(t.first_name," ",t.last_name) as Teacher_Name from students as s 
INNER JOIN enrollments as e 
ON s.student_id = e.student_id
INNER JOIN courses as c 
ON e.course_id = c.course_id
INNER JOIN teachers as t 
on c.teacher_id = t.teacher_id;

-- Display Student Name, Department Name ,Course Title
Select concat(s.first_name," " ,s.last_name) as Student_Name , d.name, c.title from students as s 
INNER JOIN enrollments as e 
ON s.student_id = e.student_id
INNER JOIN courses as c 
ON e.course_id = c.course_id
INNER JOIN departments as d
on c.department_id = d.department_id;

-- Display Student Name, Assignment, Score ,Course Title
Select concat(s.first_name," " ,s.last_name) as Student_Name , g.assignment, g.score,c.title from students as s 
INNER JOIN enrollments as e 
ON s.student_id = e.student_id
INNER JOIN courses as c 
ON e.course_id = c.course_id
INNER JOIN grades as g
on e.enrollment_id = g.enrollment_id;

-- Display Student Name,Attendance Status, Course Title
Select concat(s.first_name," " ,s.last_name) as Student_Name , c.title as Subject , a.status  from students as s 
INNER JOIN attendance as a 
ON s.student_id = a.student_id
INNER JOIN courses as c 
ON a.course_id = c.course_id;

-- Display Student Name ,Exam Type, Exam Date ,Course Title
Select concat(s.first_name," " ,s.last_name) as Student_Name , ex.exam_type,c.title as Subject , ex.exam_date  from students as s 
INNER JOIN enrollments as e 
ON s.student_id = e.student_id
INNER JOIN courses as c 
ON e.course_id = c.course_id
INNER JOIN exams as ex
on c.course_id = ex.course_id;

-- Day 5 ============================================================

use school;

-- Count how many students are in each grade level
SELECT grade_level , count(first_name) from students GROUP BY grade_level;

-- Count how many teachers are in each department.
Select department_id as department , count(first_name) as number_of_students from teachers GROUP BY department_id;

Select d.name, count(t.first_name) from teachers as t
INNER JOIN departments as d
ON d.department_id = t.department_id
GROUP BY d.name;

-- Find the average GPA of each grade level.
SELECT grade_level, avg(gpa) as Average_gpa from students GROUP BY grade_level;

-- Find the average salary of teachers in each department.
select d.name , avg(t.salary) as Average_Salary from teachers as t 
INNER JOIN departments as d
ON d.department_id = t.department_id
GROUP BY d.name;

-- Count how many courses each teacher teaches.
select concat(t.first_name," " , t.last_name) as Teacher_Name, count(c.title) as number_of_courses from teachers as t 
RIGHT join courses as c 
on t.teacher_id = c.teacher_id
GROUP BY Teacher_Name;

-- Count how many students are enrolled in each course. 
select c.title , count(s.first_name) from courses as c
INNER JOIN enrollments as e 
ON e.course_id = c.course_id
INNER JOIN students as s
ON s.student_id = e.student_id
GROUP BY c.title;

-- Find the highest GPA in each grade.
select grade_level , max(gpa) as Max_GPA from students GROUP BY grade_level;

-- Show departments having more than 2 teachers.
SELECT d.name, count(t.first_name) as Count_teachers from departments as d 
INNER JOIN teachers as t 
ON t.department_id = d.department_id
GROUP BY d.name
HAVING Count_teachers > 2 ;

-- Show grade levels where the average GPA is greater than 3.4.
SELECT grade_level , avg(gpa)as avg_gpa from students GROUP BY grade_level HAVING avg_gpa > 3.4;

-- Show courses with more than 5 enrolled students.
select c.title as course,count(e.student_id) as Count_students  from enrollments as e 
Inner Join courses as c 
ON c.course_id = e.course_id
GROUP BY c.title 
HAVING Count_students > 5;

-- Show teachers who teach more than 1 course.
select concat(t.first_name," " ,t.last_name) as Teacher_name , count(c.title) as count_courses from teachers as t 
Inner Join courses as c 
ON c.teacher_id = t.teacher_id
GROUP BY Teacher_name 
HAVING count_courses > 1;

-- display student name, course , teacher ,deparntment
select concat(s.first_name," " , s.last_name) as Student , c.title as course , concat(t.first_name," " ,t.last_name) as Teacher, d.name as department from departments as d 
INNER JOIN  teachers as t 
ON  t.department_id = d.department_id
INNER JOIN courses as c 
ON c.teacher_id = t.teacher_id 
INNER JOIN enrollments as e 
ON e.course_id = c.course_id 
INNER JOIN students as s 
ON e.student_id = s.student_id;

SELECT
    d.department_id,
    d.name,
    COUNT(*) AS teacher_count
FROM departments AS d
JOIN teachers AS t
    ON d.department_id = t.department_id
GROUP BY
    d.department_id,
    d.name;
    
-- Day6 =====================================================================
use school;

-- Find the student(s) who have the highest GPA.
SELECT * from students where gpa = (select max(gpa) from students);

-- Find teachers whose salary is greater than the average salary.
select concat(t.first_name," ",t.last_name) as teachers from teachers as t where salary > (select avg(salary) from teachers);

-- Find courses that have more students enrolled than the average enrollment across all courses.
select c.title as course ,count(s.student_id) as count_students from courses as c 
Inner Join enrollments as e 
ON  e.course_id = c.course_id
Inner Join students as s 
WHERE count_students 
GROUP BY  c.title;

-- find students who belong to the same grade level as "Ali".
select concat(first_name," " ,last_name) as Students from students where grade_level = (select grade_level from students where first_name = 'Ali' limit 1);

-- Find departments that have more teachers than the average number of teachers per department.
select c.title ,count(e.student_id) as number_of_students from enrollments as e 
INNER Join courses as c
ON c.course_id = e.course_id
GROUP BY c.title
having number_of_students > (
	select avg(c) from (
		select count(student_id) as c from enrollments 
		 GROUP BY course_id
        ) as average
);

select department_id , count(*) from teachers GROUP BY department_id;

-- day 7 --------------------------------------------------------------

-- Show students whose GPA is higher than the average GPA of their own grade.
select concat(first_name,' ' , last_name) as Student ,gpa,grade_level from students
 where grade_level = 11 and  gpa > (
	select avg(s_gpa) from (
	select gpa as s_gpa from students where grade_level = 11
) as grade_11_gpa
 );
 
 

select avg(s_gpa) from (
	select gpa as s_gpa from students where grade_level = 11
) as grade_11_gpa;


-- day8------------------------------------------------------------------

-- Show teachers whose salary is higher than the average salary of their own department.
use school;
SELECT concat(t3.first_name," " , t3.last_name) as Teacher , t3.salary ,t3.average, t3.department_id from (
	select * from teachers as t 
	Inner Join (select department_id as d_id, avg(salary) as average from teachers  GROUP BY d_id) as t2
	on t.department_id = t2.d_id
) as t3 WHERE salary > t3.average;

-- Find the highest GPA student from each grade level.
SELECT concat(first_name,' ',last_name) as students_name , gpa, max_gpa ,  grade_level from (
	select * from students as s
	Inner Join (SELECT grade_level as gl ,max(gpa) as max_gpa from students GROUP BY grade_level) as t2
	on s.grade_level = t2.gl
) as t3 where gpa = max_gpa;

-- day 9 ====================================================================================

-- Rank all students by GPA using RANK().
use school;
select concat(first_name,' ',last_name) as student_name ,gpa  ,Rank() over(order by gpa desc) as position from students;

-- Assign a row number to students ordered by GPA using ROW_NUMBER().
select  concat(first_name,' ',last_name) as student_name ,gpa  , ROW_NUMBER() over(ORDER BY gpa desc) as row_num from students;

-- Rank teachers by salary within each department using PARTITION BY.
select concat(first_name,' ',last_name) as teacher_name ,salary ,department_id, Rank() over(PARTITION BY department_id ORDER BY salary desc) as salary_rank from teachers;

-- day 10=================================================================================
use school;
-- Classify students by GPA: Excellent Good Average
select concat(first_name,' ',last_name) as student_name ,gpa  ,
case 
when gpa >= 3.6 then 'Excellent'
when gpa <3.6 and gpa >=3.0 then 'Good'
else 'Average'
end as Remarks
from students;

-- Classify teacher salaries: High Medium Low
select concat(first_name,' ',last_name) as teacher_name ,salary,
case
	when salary >= 75000 then 'high'
    when salary < 75000 and salary >= 65000 then 'medium'
    else 'low'
end as Remarks
from teachers;

-- Display attendance status using CASE: Present ✅ Absent ❌ Late ⏰
select student_id,course_id,`status` ,
case 
	when `status` = 'present' then  '✅'
    when `status` = 'absent' then  '❌'
    when `status` = 'late' then  '⏰'
end as a_status
from attendance;

-- day 11====================================================================================
use school;

-- Create a CTE that stores all students with GPA greater than 3.5.
WITH t1 as (
	SELECT * from students where gpa > 3.5
)
select first_name,gpa from t1;

-- Use a CTE to display teachers earning above the department average salary.
with department_average_salary as (
	select department_id as d_id, avg(salary) as avg_sal from teachers GROUP BY d_id
)
select t.teacher_id, t.first_name,t.salary,d.avg_sal from teachers as t
Inner Join department_average_salary as d
on t.department_id = d.d_id
having t.salary > d.avg_sal;

-- Use a CTE to calculate the number of students in each course.
with t1 as (
	select course_id , count(student_id) as number_of_students from enrollments GROUP BY course_id
)
select * from t1;

-- Use two CTEs to compare department average salaries.
with dep as(
	select * from departments
),
dep_avg_sal as (
	select department_id, avg(salary) as average from teachers GROUP BY department_id
)
SELECT d.name , a.average from dep as d
Inner Join dep_avg_sal as a 
on a.department_id = d.department_id;

-- Find the top GPA student using a CTE.
WITH gpa_list as (
	select * from students ORDER BY gpa DESC
)
SELECT * from gpa_list LIMIT 1;

-- Day12 =======================================================================
-- learninig windows funciton
use school;
select student_id,first_name ,grade_level,gpa,sum(gpa) OVER(PARTITION BY grade_level) as comulative_sum
from students;
select student_id,first_name ,grade_level,gpa,sum(gpa) OVER() as total
from students;
select student_id,first_name ,grade_level,gpa,
Rank() OVER( ORDER BY gpa DESC) as Position,
ROW_NUMBER() OVER( ORDER BY gpa DESC) as row_rank,
DENSE_RANK() OVER(ORDER BY gpa DESC) as d_rank
from students;

-- ============================================

-- Rank all students by GPA. Use:RANK()
select *, rank() over(order by gpa desc) as Ranks from students;

-- Assign a unique row number to students ordered by GPA. Use: ROW_NUMBER()
select  * , ROW_NUMBER() over(order by gpa desc) as row_no   from students;

-- Rank teachers by salary within each department. (Use PARTITION BY.)
select teacher_id,first_name,department_id,salary ,Rank() OVER(PARTITION BY department_id ORDER BY salary) as salary_rank from teachers;

-- Display the top 2 GPA students in each grade.
with t1 as(
select * , Rank() OVER(PARTITION by grade_level ORDER BY gpa DESC) as class_rank from students
)
SELECT student_id,first_name,grade_level,gpa,class_rank from t1 where class_rank <= 2;

-- Show each student's GPA along with the overall average GPA.(Window AVG().)
select student_id,first_name, gpa ,Avg(gpa) over() as average_gpa from students;

-- Show each teacher's salary along with the department average salary.
select teacher_id,first_name,department_id,salary,
avg(salary) over(PARTITION BY department_id)
 from teachers;

-- Day 13 =============================================================================
use school;
select first_name,grade_level,gpa,NTILE(4) over(PARTITION BY grade_level ORDER BY gpa desc) as segments from students;


select first_name ,gpa,
LAG(gpa,1,-1) over(ORDER BY gpa Desc) as previou_gpa,
LEAD(gpa,1,-1) over(ORDER BY gpa DESC) as next_gpa
 from students;
 
 -- =================================================================
 -- Display the previous student's GPA. using lag
 SELECT first_name ,gpa,Lag(gpa) over(order by gpa desc) from students;
 
 -- Display the next student's GPA. using lead
  SELECT first_name ,gpa,lead(gpa) over(order by gpa desc) from students;
  
  
  
  
-- ===================================================
use school;
-- Write a solution to find the second highest distinct salary from the Teacher table.
-- If there is no second highest salary, return null (return None in Pandas).


select salary , Rank() OVER(ORDER BY salary desc) as rnk from (
select DISTINCT(salary) from teachers ORDER BY salary desc
) as t1;

select salary from (
	select salary , Rank() OVER(ORDER BY salary desc) as rnk from (
		select DISTINCT(salary) from teachers ORDER BY salary desc
	) as t1
) as t2 where rnk = 2;

select salary from (
	select salary , Rank() OVER(ORDER BY salary desc) as rnk from (
		select DISTINCT(salary) from teachers ORDER BY salary desc
	) as t1
) as t2  where rnk = (
select max(rnk) from (
	select salary , Rank() OVER(ORDER BY salary desc) as rnk from (
		select DISTINCT(salary) from teachers ORDER BY salary desc
	) as t1) as t2
);

-- ================================================================
use school;
# Find all numbers that appear at least three times consecutively.
# Return the result table in any order.

select student_id ,gpa ,Rank() over(ORDER BY gpa DESC) as rnk from students;

select gpa , count(rnk) from (
	select student_id ,gpa ,Rank() over(ORDER BY gpa DESC) as rnk from students
) as count_  GROUP BY gpa;

select gpa ,count(*) as count1 from students GROUP BY gpa HAVING count1 = 3 ORDER BY gpa desc;


select student_id,gpa,
	 lag(gpa) over(ORDER BY gpa desc) as lag_gpa ,
	 lead(gpa) over(order by gpa desc) as lead_gpa 
 from students;
 
 select gpa from (
	select student_id,gpa,
		lag(gpa) over(ORDER BY gpa desc) as lag_gpa ,
		lead(gpa) over(order by gpa desc) as lead_gpa 
	from students
 ) as result where gpa = lag_gpa AND gpa = lead_gpa;
 
 
 
 use school;
 SELECT teacher_id,first_name,department_id as head_id,salary from teachers;
 
 CREATE TABLE Employee (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    salary INT,
    managerId INT
);

INSERT INTO Employee (id, name, salary, managerId)
VALUES
(1, 'Joe',   70000, 3),
(2, 'Henry', 80000, 4),
(3, 'Sam',   60000, NULL),
(4, 'Max',   90000, NULL);

select * from Employee where managerId is Null;

select * from Employee where managerId is not Null;

SELECT e.name AS Employee
FROM Employee e
JOIN Employee m
ON e.managerId = m.id
WHERE e.salary > m.salary;

 select * from Employee where managerId is not Null;
 select id,`name`,salary as m_salary from Employee where managerId is Null;
 
 
 use school;
 select first_name,lead(first_name) over(ORDER BY first_name) from students order by first_name asc ;
 
 select first_name from(
	select first_name,lead(first_name) over(ORDER BY first_name) as second_name from students order by first_name asc 
 ) as t1 where first_name = second_name ;
 
 select first_name from students GROUP BY first_name having count(*) > 1 ; 
 
 
 
 use school;
 select first_name,department_id,salary,Max(salary) over(Partition by department_id) as Max_Salary from teachers;
 
 select first_name,department_id,name,salary,Max_salary from(
	 select t.first_name,t.department_id,d.name,t.salary,Max(salary) over(partition by department_id) as Max_salary  from teachers as t
	LEFT Join departments as d
	on t.department_id = d.department_id
 ) as t1 where salary = Max_Salary;
 
;

use school;
select * from teachers;

select salary,department_id,
    DENSE_RANK() over(PARTITION BY department_id ORDER BY salary desc) as rnk
from teachers;

select `name`,first_name,salary  from (
	select t.first_name,t.salary,t.department_id,
    DENSE_RANK() over(PARTITION BY department_id ORDER BY salary desc) as rnk,d.name
	from teachers as t
    left Join departments as d 
    on t.department_id = d.department_id 
) as t where rnk <= 3;

use school;
-- Write a solution to find all dates' id with higher temperatures compared to its previous dates (yesterday).
select * from (
	select student_id,gpa,enroll_date,lag(gpa) over(order by enroll_date desc) as prev_gpa from students
) as t1 where prev_gpa > gpa;


select student_id,gpa,enroll_date,lag(gpa) over(order by enroll_date ASC) as prev_gpa from students;



-- Create Users Table
CREATE TABLE Users (
    users_id INT PRIMARY KEY,
    banned VARCHAR(3),
    role VARCHAR(10)
);

-- Insert data into Users
INSERT INTO Users (users_id, banned, role)
VALUES
(1, 'No', 'client'),
(2, 'Yes', 'client'),
(3, 'No', 'client'),
(4, 'No', 'client'),
(10, 'No', 'driver'),
(11, 'No', 'driver'),
(12, 'No', 'driver'),
(13, 'No', 'driver');


-- Create Trips Table
CREATE TABLE Trips (
    id INT PRIMARY KEY,
    client_id INT,
    driver_id INT,
    city_id INT,
    status VARCHAR(25),
    request_at DATE,
    FOREIGN KEY (client_id) REFERENCES Users(users_id),
    FOREIGN KEY (driver_id) REFERENCES Users(users_id)
);

-- Insert data into Trips
INSERT INTO Trips (id, client_id, driver_id, city_id, status, request_at)
VALUES
(1, 1, 10, 1, 'completed', '2013-10-01'),
(2, 2, 11, 1, 'cancelled_by_driver', '2013-10-01'),
(3, 3, 12, 6, 'completed', '2013-10-01'),
(4, 4, 13, 6, 'cancelled_by_client', '2013-10-01'),
(5, 1, 10, 1, 'completed', '2013-10-02'),
(6, 2, 11, 6, 'completed', '2013-10-02'),
(7, 3, 12, 6, 'completed', '2013-10-02'),
(8, 2, 12, 12, 'completed', '2013-10-03'),
(9, 3, 10, 12, 'completed', '2013-10-03'),
(10, 4, 13, 12, 'cancelled_by_driver', '2013-10-03');


select * from Users where banned = 'No';
select * from Trips where request_at >="2013-10-01" and request_at <= "2013-10-03" and status != 'completed';


select * from (select * from Users where banned = 'No') as t1
Inner Join (select * from Trips where request_at >="2013-10-01" and request_at <= "2013-10-03" and status != 'completed') as t2
on t2.client_id = t1.users_id
Union
select * from (select * from Users where banned = 'No') as t1
Inner Join (select * from Trips where request_at >="2013-10-01" and request_at <= "2013-10-03" and status != 'completed') as t2
on t2.driver_id = t1.users_id;

select Distinct(id) from (
	select * from (select * from Users where banned = 'No') as t1
	Inner Join (select * from Trips where request_at >="2013-10-01" and request_at <= "2013-10-03" and status != 'completed') as t2
	on t2.client_id = t1.users_id
	Union
	select * from (select * from Users where banned = 'No') as t1
	Inner Join (select * from Trips where request_at >="2013-10-01" and request_at <= "2013-10-03" and status != 'completed') as t2
	on t2.driver_id = t1.users_id
) as t3;


select request_at,count(*)/sum(), from trips where id In (
	select Distinct(id) from (
	select * from (select * from Users where banned = 'No') as t1
	Inner Join (select * from Trips where request_at >="2013-10-01" and request_at <= "2013-10-03" and status != 'completed') as t2
	on t2.client_id = t1.users_id
	Union
	select * from (select * from Users where banned = 'No') as t1
	Inner Join (select * from Trips where request_at >="2013-10-01" and request_at <= "2013-10-03" and status != 'completed') as t2
	on t2.driver_id = t1.users_id
	) as t3
) GROUP BY request_at;

select * from trips;
select request_at as Day, sum(`status` != 'completed')/count(*) as `Cancellation Rate` from trips as t 
join users as c
on c.users_id = t.client_id
join users as d 
on d.users_id = t.driver_id
where c.banned = "No" and d.banned = "No" AND request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY request_at ORDER BY Day;


SELECT * from students;
Delete from students where student_id =1;
use school;

select student_id,Min(enroll_date) from students GROUP BY student_id; 

use school;
-- individual comming consective in a row respect ot date
select *,
lead(student_id) over() as next_id ,
lead(enroll_date) over() as next_date 
from students ORDER BY enroll_date asc;

select count(*)/count(Distinct(student_id)) as fraction from (
	select *,
		lead(student_id) over() as next_id ,
		lead(enroll_date) over() as next_date 
	from students ORDER BY enroll_date asc
) as t1 where DATEDIFF(next_date,enroll_date) >= 1 and student_id = next_id;