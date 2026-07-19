-- link:https://leetcode.com/problems/delete-duplicate-emails

-- Write your MySQL query statement below
DELETE FROM Person
WHERE id IN (
    SELECT id
    FROM (
        SELECT p1.id
        FROM Person AS p1
        JOIN Person AS p2
          ON p1.email = p2.email
         AND p1.id > p2.id
    ) AS temp
);