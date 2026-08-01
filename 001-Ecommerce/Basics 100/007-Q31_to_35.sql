use ecommerce_db;

-- 31. Show the total number of customers in the database.
select count(*) as total_customer from customers;

-- 32. Count how many products belong to each category (basic GROUP BY not required — use COUNT with WHERE for a single category).
select category_id, count(*) as number_of_products from products GROUP BY category_id;

SELECT COUNT(*) as number_of_products
FROM products
WHERE category_id = 1;

-- 33. Find the average price of all products.
select avg(price) as Average_price from products;

-- 34. Retrieve the maximum and minimum salary among employees.
select max(salary) as Max_salary,min(salary) as Min_salary from employees;

-- 35. Count the number of orders with status 'Cancelled'.
select count(*) as Number_of_products_Canceled from orders where `status` = 'Cancelled';
