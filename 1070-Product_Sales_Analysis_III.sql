-- link: https://leetcode.com/problems/product-sales-analysis-iii

-- Write your MySQL query statement below
select product_id,year as first_year,quantity, price from (
    select *,Rank() over(partition by product_id order by year asc) as rnk from Sales
)as t1 where rnk = 1;