-- 50 sql que
-- 1)Write a SQL query to fetch "firstname" from worker table using alias name as <WORKER_NAME>.
SELECT first_name AS WORKER_NAME FROM worker;

-- 2)Write an query to fetch first_name in worker table in Uppercase.
 SELECT UPPER(first_name) from worker;
 
-- 3)Write SQL query to fetch unique values of DEPARTMENT from worker Table.
 SELECT distinct DEPARTMENT FROM worker;
 SELECT DEPARTMENT FROM worker group by DEPARTMENT;
 
-- 4)Write SQL query to print first 3 character from FIRST_NAME from worker.
 SELECT substring(first_name, 1,3) from worker;
 
-- 5)Write an sql query to find position of alphabet (b) in the first name column 'Amitabh' from worker table;
 SELECT instr(first_name, 'b') from worker where first_name ='Amitabh'; -- case insensitive search karta hai.
 
-- 6)Write an sql query to print first_name from worker table after removing white spaces from right side.
 SELECT RTRIM(first_name) from worker;
 
-- 7)Write an sql query to print first_name from worker table after removing white spaces from left side.
 SELECT LTRIM(first_name) from worker;
 
-- 8)Write an sql query that fetches unique values of DEPARTMENT from worker table and prints its length.
 SELECT DISTINCT DEPARTMENT, LENGTH(DEPARTMENT) FROM worker;

-- 9)Write an sql query to print the FIRST_NAME from worker table after replacing 'a' with 'A'.
SELECT REPLACE(first_name, 'a', 'A') FROM worker;

-- 10)Write an sql query to print the first_name and last_name from worker table into a single coulmn COLUMN_NAME.
-- A space char should separate them. 
SELECT CONCAT(first_name, ' ', last_name) AS COMPLETE_NAME from worker;
SELECT CONCAT(first_name, ' ', last_name) from worker;
	
-- 11)Write an sql query to print all worker details from worker table order by first name ascensing and then descending.
 SELECT * FROM worker ORDER BY first_name; -- ASCENSING ORDER BY DEFAULT
 SELECT * FROM worker ORDER BY first_name DESC; -- DESCENDING ORDER
 
-- 12)Write an sql query to print all worker details from worker table order by FIRST_NAME ascensing and DEPARTMENT name descending.
 SELECT * FROM worker ORDER BY first_name, department DESC; 
 
-- 13)Write an sql query to print all worker details from worker table with first_name "satish" and "vipul".
 SELECT *FROM worker WHERE first_name IN('vipul', 'satish');
 
-- 14)Write an sql query to print all worker details from worker table with first_name EXCLUDING "satish" and "vipul".
 SELECT *FROM worker WHERE first_name NOT IN('vipul', 'satish');
 SELECT *FROM worker WHERE first_name = 'satish' OR first_name = 'vipul';
 
-- 15)Write an sql query to print all worker details from worker table with DEPARTMENT name as "Admin"
 SELECT *FROM worker WHERE DEPARTMENT IN('Admin');
 SELECT *FROM worker WHERE DEPARTMENT LIKE 'Admin%';

-- 16)Write an sql query to print all worker details from worker table whose first name contains A.
SELECT * FROM WORKER WHERE first_name LIKE '%a%';

-- 17)Write an sql query to print all worker details from worker table whose first name ENDS with A.
SELECT * FROM WORKER WHERE first_name LIKE '%a';

-- 18)Write an sql query to print all worker details from worker table whose first name ENDS with A and has 6 alphabets.
SELECT *FROM worker WHERE first_name LIKE '_____h';
 
-- 19)workers whose salary lies between 100000 and 500000.
SELECT *FROM worker WHERE salary BETWEEN 100000 AND 500000;
 
-- 20)workers who have joined in FEB 2014.
SELECT *FROM worker WHERE YEAR(JOINING_DATE)= 2014 AND MONTH(JOINING_DATE)=02;
 
-- 21)count of worker working in department admin.
SELECT department, COUNT(*) FROM worker WHERE department = 'Admin'; 

select  department, count(*) from worker group by department; -- count no of people in each department

SELECT COUNT(DISTINCT department) FROM worker;  -- count no of department

-- 22)fetch worker full name with salary >=50000 and <=100000
SELECT CONCAT(first_name, ' ', last_name) AS COMPLETE_NAME, SALARY FROM worker
WHERE SALARY BETWEEN 50000 AND 100000; 

-- 23) fetch no of worker from each department in decending order.
select  department, count(worker_id) AS NO_OF_WORKER from worker group by department
ORDER BY COUNT(worker_id) DESC;

-- 24)write a qeury to display details of workers who are also manager.
SELECT W.*FROM worker AS W INNER JOIN title as t on W.worker_id= t.worker_ref_id WHERE t.WORKER_TITLE = 'Manager'; -- will show info of worker table... look at W.*FROM 
SELECT t.*FROM worker AS W INNER JOIN title as t on W.worker_id= t.worker_ref_id WHERE t.WORKER_TITLE = 'Manager'; -- will show info of title table... look at t.*FROM

-- 25)fetch number(more than 1) of same titles in ORG of different types.
SELECT WORKER_TITLE, COUNT(*) AS COUNT FROM title GROUP BY WORKER_TITLE HAVING COUNT(*)>1
ORDER BY COUNT(*);

-- 26) show only odd rows of table
SELECT *FROM worker WHERE MOD(WORKER_ID, 2) !=0;
SELECT *FROM worker WHERE MOD(WORKER_ID, 2) <>0;  -- '<>' mean not equal to

-- 27) show only even rows of table
SELECT *FROM worker WHERE MOD(WORKER_ID, 2) =0;

-- 28)write an sql query to clone one table from another table.
CREATE TABLE worker_clone LIKE worker; -- worker_clone table created from worker table... it will be of the same format of worker but will not have any data.
INSERT INTO worker_clone SELECT *FROM worker; -- this will store values of worker into worker_clone.
select *from worker_clone;

-- 29)write an sql query to fetch intersecting records of two tables.
SELECT * FROM worker INNER JOIN worker_clone USING(WORKER_ID);

-- 30)write sql query to show record from one table that another table does not have.
-- MINUS
SELECT *FROM worker LEFT JOIN worker_clone USING (WORKER_ID) WHERE worker_clone.WORKER_ID IS NULL;

-- 31)write a sql query to show current date and time
-- DUAL
SELECT CURDATE();  -- ONLY DATE
SELECT NOW();      -- DATE AND TIME

-- 32)show top 5 records of table order by salary in descending order.
SELECT first_name, salary FROM worker ORDER BY salary DESC LIMIT 5;

-- 33)Write an SQL query to find nth (say 5th) highest salary from worker.
 SELECT first_name, salary FROM worker ORDER BY salary DESC LIMIT 4,1;

-- 34)Write an SQL query to find nth (say 5th) highest salary from worker without using limit keyword.
 SELECT salary FROM worker w1
 WHERE 4=(
 SELECT COUNT (DISTINCT(w2.salary))
 FROM worker w2
 WHERE w2.salary >= w1.salary
 );
 
-- 35)Employee with same salary
 SELECT w1.first_name AS WORKER_NAME FROM worker w1, worker w2 WHERE w1.salary= w2.salary AND w1.worker_id!=w2.worker_id;
 
-- 36)Write an SQL query to write second heighest salary from table
 SELECT salary FROM worker group by  salary ORDER BY salary DESC LIMIT 1,1;
-- without using limit an corelated queries
  SELECT max(salary) FROM worker
 WHERE salary NOT IN (SELECT max(salary) FROM worker);
 
-- 37)Write an sql query to write one row twice in result.
 SELECT *FROM worker
 UNION ALL
 SELECT *FROM worker ORDER BY worker_id;

-- 38)return worker id who does not get bonus.
SELECT *FROM worker WHERE worker_id NOT IN ( SELECT worker_Ref_id from Bonus) ; 

-- 39) fetch first 50% records from table
SELECT * FROM worker WHERE worker_id<=(SELECT count(worker_id)/2 FROM worker);
 
-- 40) fetch departments that have less than 4 people in it.
SELECT department, count(department) AS DepCount FROM worker GROUP BY department HAVING count(department)<4;
 
 -- Q-41. Write an SQL query to show all departments along with the number of people in there.
select department, count(department) as depCount from worker group by department;
 
-- 42)fetch last record from table
SELECT *FROM worker WHERE worker_id = (SELECT max(worker_id) FROM worker);

-- 43)fetch first record from table
SELECT *FROM worker WHERE worker_id = (SELECT min(worker_id) FROM worker);
 
-- 44)fetch last five record from table
(SELECT *FROM worker ORDER BY worker_id DESC LIMIT  5) ORDER BY worker_id;

  
 -- 45) write name of employee having highest salary in each department
 SELECT max(salary) AS MaxSalary , department FROM worker GROUP BY department; 
 
-- new queries: 
-- 1)Query the two FIRST_NAME in worker with the shortest and longest FIRST_NAME names, 
-- 	as well as their respective lengths (i.e.: number of characters in the name).
--  If there is more than one smallest or largest FIRST_NAME, choose the one that comes first when ordered alphabetically.

select FIRST_NAME, length(FIRST_NAME) from worker  order by length(FIRST_NAME),FIRST_NAME limit 1;
select FIRST_NAME, length(FIRST_NAME) from worker  order by length(FIRST_NAME) desc,FIRST_NAME limit 1;

-- 2)Query the list of FIRST_NAME names starting with vowels (i.e., a, e, i, o, or u) from worker. Your result cannot contain duplicates.
-- select distinct FIRST_NAME from worker where substr(FIRST_NAME,1,1) in ('a','e','i','o','u') ;
select distinct FIRST_NAME from worker where left(FIRST_NAME,1) in ('a','e','i','o','u') ;

-- 3)Query the Name of any student in STUDENTS who scored higher than  Marks. 
-- Order your output by the last three characters of each name. 
-- If two or more students both have names ending in the same last three characters 
-- (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID 
select name from students where marks>75 order by right(name, 3), id ;



-- playground
SELECT worker.FIRST_NAME, Bonus.BONUS_AMOUNT
	FROM worker
    INNER JOIN Bonus
    ON worker.Worker_ID = Bonus.Worker_Ref_ID
    ORDER BY worker.Worker_ID;
    
    
    SELECT *FROM Worker;
    
    CREATE VIEW salary AS SELECT FIRST_NAME AS Name, SALARY FROM Worker where SALARY>=200000;
    
	select *from salary;
    
    DROP view if exists money;
 
 
 
