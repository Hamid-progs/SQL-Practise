use ecommerce_db;

-- 76. Retrieve the number of orders that have not yet been delivered (status not equal to 'Delivered').
select * from orders where status != 'Delivered';

-- 77. Find the youngest hire date among employees in a specific department.
select department_id,Max(hire_date) as youngest_hiring from employees group by department_id;

-- 78. Show all coupons valid during a specific month (pick any month/year).
select * from coupons where valid_from <= '2024-05-31' AND valid_to >= '2024-05-01';
select * from coupons where year(valid_from) = 2024;

-- 79. List all customers sorted by last name, then first name.
select * from customers order by last_name , first_name ASC;

-- 80. Retrieve the top 5 warehouses by capacity.
select * from warehouses order by capacity desc limit 5;