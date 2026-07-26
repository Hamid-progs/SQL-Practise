-- link: https://leetcode.com/problems/investments-in-2016/description

-- Write your MySQL query statement below
select round(sum(tiv_2016),2) as tiv_2016 from Insurance
where tiv_2015 in (
    select tiv_2015 from Insurance
    GROUP BY tiv_2015
    HAVING COUNT(*) > 1
) and lat IN (
    select lat from Insurance
    GROUP BY lat,lon
    HAVING COUNT(*) = 1
)and lon IN (
    select lon from Insurance
    GROUP BY lat, lon
    HAVING COUNT(*) = 1
);

