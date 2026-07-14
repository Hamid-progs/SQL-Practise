-- link: https://leetcode.com/problems/duplicate-emails

-- solution 1 
select Distinct(email) as Email from(
	select email,lead(email) over(ORDER BY email) as check_ from Person order by email asc 
 ) as t1 where email = check_ ;

-- solution 2
select email as Email from Person GROUP BY Email having count(*) > 1 ; 

-- solution 2 is optimal but i got good beets of 99.1 using first solution 
