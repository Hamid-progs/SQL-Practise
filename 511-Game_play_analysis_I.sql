-- link: https://leetcode.com/problems/game-play-analysis-i

-- Write your MySQL query statement below
select player_id ,Min(event_date) as first_login from Activity  GROUP BY player_id;