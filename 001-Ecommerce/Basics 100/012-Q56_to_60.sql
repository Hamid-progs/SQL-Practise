use ecommerce_db;

-- 56. List the 5 highest-rated suppliers.
select * from suppliers ORDER BY rating desc limit 5;

-- 57. Find all returns that occurred within 7 days of the order date (approximate using date arithmetic).
select o.order_id,r.return_id,o.order_date,r.return_date,r.reason,o.total_amount,r.refund_amount from orders as o 
inner Join returns as r 
on o.order_id = r.order_id
where datediff(r.return_date,o.order_date) between 0 and 7;

-- 58. Show all customers who are currently inactive (is_active = 0).
select * from customers where is_active = 0;

-- 59. Retrieve the names of all employees working in the 'Sales' department (join required — treat as basic single-join practice).
select concat(e.first_name,' ',e.last_name) as `name`  from employees as e 
inner join departments as d
on e.department_id = d.department_id
where d.department_name = 'Sales';

-- 60. List all products that belong to either the 'Books' or 'Toys' category (use IN with category names via a subquery or two separate lookups).
select c.category_name,p.* from products as p 
inner join categories as c
on p.category_id = c.category_id
where c.category_name IN ("Toys" , "Books");