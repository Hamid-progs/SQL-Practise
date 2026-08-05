use ecommerce_db;

-- 41. Find all reviews left in the last 90 days (relative to the most recent review date).
select * from reviews order by review_date desc limit 90;

-- 42. Retrieve all orders with no assigned shipper.
select * from orders where shipper_id is null;

-- 43. List all coupons that are currently expired (valid_to < CURRENT_DATE).
select * from coupons where valid_to < CURRENT_DATE;

-- 44. Show the total number of products supplied by each of two specific suppliers (pick any two supplier IDs).
select * from products where supplier_id in (16,36);

-- 45. Find all warehouses located in a specific country (pick one present in your data).
select * from warehouses where country = "Norfolk Island";
