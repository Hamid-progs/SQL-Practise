use ecommerce_db;

-- 1. Retrieve the first name, last name, and email of all customers. 
select first_name, last_name, email from customers;
 
-- 2. List all products with a price greater than $100.
 select * from products where price > 100;
 
 -- 3. Find all orders with a status of 'Delivered'.
 select * from orders where `status` = 'Delivered';
 
 -- 4. Show all customers who live in 'United States' (check the country column for the closest match your data uses).
select * from customers where country like 'United States%';

-- 5. Retrieve all products belonging to the 'Electronics' category.
select c.category_name,p.* from products as p 
Inner Join categories as c 
on p.category_id = c.category_id
where c.category_name = 'Electronics';


 