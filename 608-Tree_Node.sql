-- link: https://leetcode.com/problems/tree-node/

-- Write your MySQL query statement below
select id,
    Case
        when p_id is null then "Root"
        when id  in (Select distinct(p_id) from Tree where p_id is not null) then "Inner"
        else "Leaf"
    End as type
from Tree;