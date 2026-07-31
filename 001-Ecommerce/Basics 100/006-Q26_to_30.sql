use ecommerce_db ;

-- 26. Show all departments along with their budget, sorted from highest to lowest.
select department_id,department_name,budget from departments order by budget DESC;

-- 27. List all products with no supplier (there shouldn't be any — verify this and explain why).
select * from products where supplier_id is null;
-- Reason: all products are suppled by a particular supplier , without them we didnt get the product

-- 28. Retrieve all orders that used a coupon (coupon_id IS NOT NULL).
select * from orders where coupon_id is not null;

-- 29. Find all customers with a NULL phone number, if any.
select * from customers where phone is null;

-- 30. List all categories and their descriptions.
select category_name,description from categories;