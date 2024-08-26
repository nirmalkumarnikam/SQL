-- Q. Write the SQL Query to 1.create a database Company, 2.create a table employee in itdelete/drop the database 
CREATE DATABASE company;
USE company;
CREATE TABLE employee(
employee_id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50)
);
DROP DATABASE company;

-- Q. Write the SQL Query to 1.create a table employee, 2.Insert data into the table employee
-- 3. Update Salary for all people in HR department to 20000 4. Delete data for employee
-- having empId = 5, 5.Delete the entire table

CREATE DATABASE company;
USE company;
create table employee(
emp_id int primary key,
f_name varchar(50),
l_name varchar(50),
Dept varchar(50),
salary int
);

drop table employee;

insert into employee(emp_id, f_name, l_name, Dept, salary)
values(1,'Ramesh', 'Kumar','Engneering', 30000),
(2,'Nirmal', 'Kumar','HR', 10000),
(3,'vallabh', 'Avari','HR', 15000),
(4,'Aditya', 'Gurjar','HR', 30000),
(5,'Rishi', 'Patel','IT', 40000),
(6,'shonar', 'Shonar','IT', 20000),
(7,'amey', 'khede','IT', 12000); 

-- error while updating:
-- 0	18	08:14:11	update employee set salary=20000 where Dept = 'HR'	Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column. 
-- To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.	0.000 sec
SET SQL_SAFE_UPDATES = 0;
update employee set salary=20000 where Dept = 'HR';
select *from employee;

delete from employee where emp_id=5;

drop table employee;

-- To delete all the data
DELETE FROM employee;


-- Q.Write a query to find the total number of employees working in the ‘IT’ department’
-- use create table an insert values from last que only Line 17, Line 27
select dept, count(dept) from employee where dept = 'IT';

-- Q.Write a query to find all the employees that have their name 
-- 1)starting from ‘R’
select * from employee where f_name like 'r%' ;
-- 2)Name contain ra
select * from employee where f_name like '%ra%';
-- 3)Name start with 'A' and have exactly five characters
select *from employee where f_name like 'A____';
-- 4)Name has a as second character A.
select * from employee where f_name like '_a%';

-- Q.Write a query to find unique salaries in employee table
select distinct salary, Dept from employee;

-- Q.Write a query to find the second highest salary in a table
select max(salary) from employee where salary <> (select max(salary) from employee);

-- Q.Write a query to find the nth highest salary in a table
select distinct salary from employee order by salary desc limit n-1,1;  -- n is not declared.

-- ORDER BY - Order the salary in descending/ascending order
-- LIMIT m, n- It helps to retrieve a specific range of rows
-- m- number of rows to skip from the beginning
-- n- number of rows to fetch after skipping


-- Q.Write a query to find the top 2 salaries from a table
select distinct salary from employee order by salary desc limit 2; 

-- Q.Write a query to calculate the total salary and average salary in a department
select sum(salary) as total_salary,avg(salary) as avg_salary from employee;

-- Q.Insert dept as NULL in employee
insert into employee(emp_id, f_name, l_name, Dept, Salary)
values(8,'Rishi', 'InkBottle', null,432432);

-- Q.Write a query to find the rows where a department has NULL values  (imp)
select * from employee where Dept is NULL;

-- Q.Write a query to find the duplicate rows in employee for column department.
select Dept, count(Dept) from employee group by Dept having count(dept)>1;

-- Notes: https://drive.google.com/file/d/193EHxqNV4BJ-Q1aYwpHxilnUuq77wtft/view
-- More Que: https://drive.google.com/file/d/1_C3qb_5o-4UA_x2gzRzNSz3pgnVqDaHE/view