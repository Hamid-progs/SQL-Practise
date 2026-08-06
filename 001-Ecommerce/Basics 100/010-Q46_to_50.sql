use ecommerce_db;

-- 46. Retrieve the 10 oldest customers by signup date.
select * from customers order by signup_date desc limit 10;

-- 47.List all order items with a quantity greater than 3.
select * from order_items where quantity > 3;

-- 48. Show all products with a price between $20 and $50, sorted by price ascending.
select * from products where price between 30 and 50;

-- 49. Find all employees whose job title contains the word 'Manager'.
select * from employees where job_title = "Manager";

-- 50. Retrieve a distinct list of all cities where customers live.
select Distinct(city) from customers order by city Asc;
