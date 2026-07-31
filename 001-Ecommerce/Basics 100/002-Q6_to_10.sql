use ecommerce_db;

-- 6. List the top 10 most expensive products.
SELECT * from products ORDER BY cost DESC limit 10; 
SELECT * from products ORDER BY price DESC LIMIT 10;

-- 7. Find all employees hired after January 1, 2022.
select * from employees where hire_date > 2022-01-01 ORDER BY hire_date ASC;

-- 8. Show all orders placed in the last 30 days relative to the most recent order date in the table.
select * from orders ORDER BY order_date DESC LIMIT 30;

-- 9. List all suppliers located in the same city (pick any city present in your data).
select * from suppliers where city = 'Angelahaven';

-- 10. Retrieve all coupons with a discount percentage greater than 20%.
select * from coupons where discount_percent > 20;
