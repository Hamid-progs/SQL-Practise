use ecommerce_db;

-- 11. Find all customers whose email contains 'gmail'.
select * from customers where email like '%gmail%';

-- 12. List all products whose name starts with the letter 'S'.
select * from products where product_name like 'S%';

-- 13. Show all reviews with a rating of 5.
select * from reviews where rating = 5;

-- 14. Retrieve all orders with a total amount between $100 and $500.
select * from orders where total_amount > 100 and total_amount < 500;

-- 15. List all warehouses with a capacity greater than 20,000.
select * from warehouses where capacity > 20000;
