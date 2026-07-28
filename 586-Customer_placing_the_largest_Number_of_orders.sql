-- link : https://leetcode.com/problems/customer-placing-the-largest-number-of-orders

-- Write your MySQL query statement below
select customer_number from (
    select customer_number, count(order_number) as c from Orders group by customer_number) as t1
where c= (
    select max(c) from (
        select customer_number, count(order_number) as c from Orders group by customer_number) as t2) ;