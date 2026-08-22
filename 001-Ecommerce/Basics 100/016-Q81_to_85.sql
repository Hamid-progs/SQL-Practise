use ecommerce_db;

-- 81. Find the number of products per supplier for a single named supplier.
 select supplier_id, count(product_id) as number_of_products from products GROUP BY supplier_id having supplier_id = 5;
 
 -- 82. Show all orders that have more than one associated payment record.
 select order_id, count(*) as cnt from payments group by order_id having cnt > 1;
 
 -- 83. List the distinct set of job titles used across all employees.
 select Distinct(job_title) as occupations from employees;
 
 -- 84. Retrieve the average rating given across all reviews.
 select avg(rating) as avg_rating from reviews;
 
 -- 85. Find all payments with an amount greater than $1,000.
 select * from payments where amount > 1000;