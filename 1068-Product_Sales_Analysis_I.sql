-- link: https://leetcode.com/problems/product-sales-analysis-i

-- Write your MySQL query statement below
select p.product_name,s.year,s.price from sales as s
Join Product as p 
on s.product_id = p.product_id;