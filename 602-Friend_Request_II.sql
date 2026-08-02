-- link: https://leetcode.com/problems/friend-requests-ii-who-has-the-most-friends

-- Write your MySQL query statement below
select id , count(*) as num from (
    SELECT requester_id AS id
    FROM RequestAccepted

    UNION ALL

    SELECT accepter_id AS id
    FROM RequestAccepted
) as t1 
group by id order by num Desc limit 1 ;