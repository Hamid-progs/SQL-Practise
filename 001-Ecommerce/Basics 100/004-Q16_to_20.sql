use ecommerce_db;

-- 16. Find all employees with a salary above $80,000.
select * from employees where salary > 80000 ORDER BY salary;

-- 17. Show the 5 most recent orders.
select * from orders order by order_date desc limit 5;

-- 18. List all distinct order statuses used in the Orders table.
select DISTINCT(`status`) as unique_stauts from orders;

-- 19. Retrieve all distinct payment methods used in the Payments table.
select DISTINCT(payment_method) as unique_payment_methods from payments;

-- 20. Find all customers who signed up in the year 2023.
select * from customers where year(signup_date) = 2023;