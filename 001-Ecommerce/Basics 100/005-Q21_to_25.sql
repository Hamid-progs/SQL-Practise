use ecommerce_db;
-- 21. List all products that are currently inactive (is_active = 0).
select * from products where is_active = 0;

-- 22. Show all returns with a status of 'Approved'.
select * from returns where `status` = 'Approved';

-- 23. Retrieve all shippers and sort them alphabetically.
select * from shippers order by shipper_name asc;

-- 24. List the 20 lowest-priced products.
select * from products order by price asc limit 20;

-- 25. Find all suppliers with a rating above 4.5.
select * from suppliers where rating > 4.5;