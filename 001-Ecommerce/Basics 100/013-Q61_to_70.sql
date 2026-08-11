use ecommerce_db;

-- 61. Find the number of employees in each department (simple GROUP BY).
select d.department_name,count(e.department_id) as cnt from employees as e
Left Join departments as d
on e.department_id = d.department_id
GROUP BY d.department_name;

-- 62. Show the total revenue represented by all payments with status 'Completed'.
select sum(amount) as revenue from payments where `status` = 'Completed';

-- 63. List order items where the subtotal exceeds $500.
select * from order_items where subtotal > 500;

-- 64. Retrieve all products costing less than $10 to produce (cost column).
select * from products where cost < 10;

-- 65. Find the customer with the earliest signup date.
select * from customers order by signup_date ASC limit 1;

-- 66. Show the 3 most recently hired employees.
select * from employees order by hire_date DESC limit 3;

-- 67. List all reviews containing the word 'damaged'.
select * from reviews where review_text like '%damaged%';

-- 68. Retrieve all orders with a total amount of exactly $0 (investigate if any exist and why).
select * from orders where total_amount = 0;
-- no there is not item with toatl amount 0

-- 69. Find the number of coupons that have never been used (times_used = 0).
select * from coupons where times_used = 0;

-- 70. Show all products from suppliers based in a specific country (pick one).
Select s.country,p.* from products as p 
Join suppliers as s 
on p.supplier_id = s.supplier_id
where country = 'Yemen';

