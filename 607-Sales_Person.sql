-- link: https://leetcode.com/problems/sales-person

-- Write your MySQL query statement below
Select name from SalesPerson
where sales_id not in (
    select o.sales_id from Orders as o
    Join Company as c
    on o.com_id = c.com_id
    where c.name = "RED"
);