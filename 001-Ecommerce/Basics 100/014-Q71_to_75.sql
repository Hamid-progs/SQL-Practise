use ecommerce_db;

-- 71. List the first 10 rows of the Order_Items table ordered by order_item_id.
select * from order_items ORDER BY order_item_id asc;

-- 72. Retrieve all employees earning between $50,000 and $90,000.
select * from employees where salary BETWEEN 50000 and 90000;

-- 73. Find all customers without any reviews using a simple NOT IN subquery (basic version).
SELECT *
FROM customers
WHERE customer_id NOT IN (
    SELECT customer_id
    FROM reviews
);

-- 74. Show the total capacity across all warehouses.
select sum(capacity) as total_capacity from warehouses;

-- 75. List all products with 'Wireless' in the name.
select * from products where product_name like '%Wireless%';
