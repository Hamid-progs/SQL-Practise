use ecommerce_db;

-- 51. Count the number of distinct countries suppliers operate from.
select Distinct(country) as suppliers_operates from suppliers;

-- 52. List all orders placed by a specific customer (pick any customer_id).
select * from orders where customer_id = 130;

-- 53. Find the total number of order items associated with a specific order.
select * from (
	select order_id,count(order_item_id) as item_count from order_items GROUP BY order_id
) as t1 where order_id = 1;

-- 54. Show all payments made using 'PayPal'.
select * from payments where payment_method = 'PayPal';

-- 55. Retrieve all products with a description that mentions 'quality'.
select * from products where description like "%quality%" ;