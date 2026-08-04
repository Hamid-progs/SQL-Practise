use ecommerce_db;

-- 36. List all products priced exactly $49.99, $99.99, or $199.99 (use IN).
select * from products where price in (49.99,99.99,199.99);

-- 37. Find all orders placed between '2024-01-01' and '2024-06-30'.
select * from orders WHERE order_date BETWEEN date('2024-01-01') and date('2024-06-30');

-- 38. Retrieve all employees who do not have a manager (manager_id IS NULL).
select * from employees where manager_id is null;

-- 39. List all customers whose last name ends with 'son'.
select * from customers where last_name like "%son";

-- 40. Show all products sorted by price in descending order, limited to 15 rows.
select * from products ORDER BY price desc limit 15;