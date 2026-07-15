-- link: https://leetcode.com/problems/customers-who-never-order/

-- Write your MySQL query statement below
Select c.name as Customers from Customers as c 
Left Join Orders as o
ON c.id = o.customerId
where o.customerId is null;