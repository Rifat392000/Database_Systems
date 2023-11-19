----MYSQL Database----
----Command Prompt or CLI----

--User Access

mysql -u root -p

--All databases show under the user

show databases;

--Database Create

create database rifatdb;

--Use the rifatdb database

use rifatdb;

--Table Create

Create Table Employee (
    emp_id int,
    emp_name varchar(255),
    emp_age int,
    emp_zone varchar(50)
);

--Describe structure of a Table

DESC Employee;

--insert values

insert into Employee(emp_id,emp_name,emp_age,emp_zone)values(1,'Rifat',23,'West');
insert into Employee(emp_id,emp_name,emp_age,emp_zone)values(2,'Jack',17,'North');

--Table value show

select * from Employee;

select emp_id from Employee;

select emp_zone,emp_id,emp_name from Employee;


--drop table

drop table Employee;

--Table Create with constraints

--not null constraint

Create Table Employee (
    emp_id int not null,
    emp_name varchar(255),
    emp_age int,
    emp_zone varchar(50)
);


DESC Employee;

--unique constraint
--Alter Table

ALTER TABLE Employee
ADD UNIQUE (emp_id);

--primary key

Create Table Employee (
    emp_id int not null,
    emp_name varchar(255),
    emp_age int,
    emp_zone varchar(50),
    primary key(emp_id)
);

--check constraint

ALTER TABLE Employee
ADD CHECK (emp_age>=18);

--default constraint

ALTER TABLE Employee
ALTER  emp_name SET DEFAULT 'Sandnes';

--Index

  Create Index DemoIndex1
  on Employee(emp_name);

 Create Index DemoIndex2
  on Employee(emp_zone,emp_name);

show Index from Employee;

Drop Index DemoIndex2 on Employee;

---Alter Table---

Alter Table Employee
Add emp_dept varchar(100); 

DESC Employee;

--Modify column

Alter Table Employee
modify column emp_dept int; 

--distinct value

select distinct emp_age from Employee;

--where clause

select * from Employee
where emp_age=25 or emp_age<30;

select * from Employee
where emp_age=25 and emp_zone='West';


select * from Employee
where NOT emp_age=30;

--Single line comment  

select * from Employee; #fetch all the records from table


--Multi line comment  

select *
/* Retrieve all records
from employee table */
from Employee
where NOT emp_age=30;


--aggregate function
--Count 

select count(emp_age)
from Employee
where emp_age=25;

select count(*) as "Total Row"
from Employee;

---Multiple value where clause
--IN Operator

 select * from Employee
 where emp_zone IN('West','South');


 select * from Employee
 where emp_zone NOT IN('West','South');


 --Like Operator
-- % Zero, one or more characters
--  _ a single character

select * from Employee
where emp_name LIKE '%k%';


select * from Employee
where emp_name LIKE '_a';


--Between Operator 

select * from Employee
where emp_age BETWEEN 25 AND 30;


--Case Statement in MySQL

SELECT emp_name, emp_id, emp_zone, emp_age,
CASE
    WHEN emp_age > 25 THEN 'Employee with experience'
    WHEN emp_age = 25 THEN 'Employee with mid-experience'
    ELSE 'Freshers....'
END AS Eligibility
FROM Employee;


--Delete Statement

Delete from Employee
where emp_zone IN('West','North');


Alter Table Employee
modify column emp_dept varchar(100); 


--generate values using AI (Copilot)

INSERT INTO Employee(emp_id, emp_name, emp_age, emp_zone, emp_dept) VALUES (1, 'Rifat', 23, 'West', 'Business');
INSERT INTO Employee(emp_id, emp_name, emp_age, emp_zone, emp_dept) VALUES (2, 'Jack', 27, 'North', 'Engineering');
INSERT INTO Employee(emp_id, emp_name, emp_age, emp_zone, emp_dept) VALUES (3, 'Emma', 30, 'East', 'Marketing');
INSERT INTO Employee(emp_id, emp_name, emp_age, emp_zone, emp_dept) VALUES (4, 'Oliver', 33, 'South', 'Finance');
INSERT INTO Employee(emp_id, emp_name, emp_age, emp_zone, emp_dept) VALUES (5, 'Sophia', 36, 'West', 'Human Resources');
INSERT INTO Employee(emp_id, emp_name, emp_age, emp_zone, emp_dept) VALUES (6, 'Mia', 39, 'North', 'Business');
INSERT INTO Employee(emp_id, emp_name, emp_age, emp_zone, emp_dept) VALUES (7, 'Lucas', 42, 'East', 'Engineering');
INSERT INTO Employee(emp_id, emp_name, emp_age, emp_zone, emp_dept) VALUES (8, 'Michael', 45, 'South', 'Marketing');
INSERT INTO Employee(emp_id, emp_name, emp_age, emp_zone, emp_dept) VALUES (9, 'Grace', 48, 'West', 'Finance');
INSERT INTO Employee(emp_id, emp_name, emp_age, emp_zone, emp_dept) VALUES (10, 'Daniel', 51, 'North', 'Human Resources');
INSERT INTO Employee(emp_id, emp_name, emp_age, emp_zone, emp_dept) VALUES (11, 'Emily', 54, 'East', 'Business');
INSERT INTO Employee(emp_id, emp_name, emp_age, emp_zone, emp_dept) VALUES (12, 'David', 57, 'South', 'Engineering');
INSERT INTO Employee(emp_id, emp_name, emp_age, emp_zone, emp_dept) VALUES (13, 'Olivia', 60, 'West', 'Marketing');
INSERT INTO Employee(emp_id, emp_name, emp_age, emp_zone, emp_dept) VALUES (14, 'Max', 63, 'North', 'Finance');
INSERT INTO Employee(emp_id, emp_name, emp_age, emp_zone, emp_dept) VALUES (15, 'Lily', 66, 'East', 'Human Resources');
INSERT INTO Employee(emp_id, emp_name, emp_age, emp_zone, emp_dept) VALUES (16, 'Benjamin', 69, 'South', 'Business');
INSERT INTO Employee(emp_id, emp_name, emp_age, emp_zone, emp_dept) VALUES (17, 'Natalie', 72, 'West', 'Engineering');
INSERT INTO Employee(emp_id, emp_name, emp_age, emp_zone, emp_dept) VALUES (18, 'Dylan', 75, 'North', 'Marketing');
INSERT INTO Employee(emp_id, emp_name, emp_age, emp_zone, emp_dept) VALUES (19, 'Madison', 78, 'East', 'Finance');
INSERT INTO Employee(emp_id, emp_name, emp_age, emp_zone, emp_dept) VALUES (20, 'Ryan', 81, 'South', 'Human Resources');
INSERT INTO Employee(emp_id, emp_name, emp_age, emp_zone, emp_dept) VALUES (21, 'Chloe', 84, 'West', 'Business');
INSERT INTO Employee(emp_id, emp_name, emp_age, emp_zone, emp_dept) VALUES (22, 'Ethan', 87, 'North', 'Engineering');
INSERT INTO Employee(emp_id, emp_name, emp_age, emp_zone, emp_dept) VALUES (23, 'Isabella', 90, 'East', 'Marketing');
INSERT INTO Employee(emp_id, emp_name, emp_age, emp_zone, emp_dept) VALUES (24, 'Matthew', 93, 'South', 'Finance');
INSERT INTO Employee(emp_id, emp_name, emp_age, emp_zone, emp_dept) VALUES (25, 'Ava', 96, 'West', 'Human Resources');


--update statement
update Employee SET emp_age=25 where emp_id=5;


--drop table

 drop table Employee;

--aggregate function

 select avg(emp_age) as Average, sum(emp_age) as Total
 from employee;

 --Max value and Min value

 select max(emp_age) as "Maximum Age", min(emp_age) as "Minimum Age"
 from employee;

 --auto increment

create table Student (

    s_id int not null AUTO_INCREMENT,
    FirstName varchar(100),
      LastName varchar(100),
      s_age int,
      s_dept varchar(50),
      primary key(s_id)
);


desc student;




--generate values using AI (Copilot)

INSERT INTO Student (s_id, FirstName, LastName, s_age, s_dept) VALUES (1, 'John', 'Doe', 20, 'Computer Science');
INSERT INTO Student (s_id, FirstName, LastName, s_age, s_dept) VALUES (2, 'Jane', 'Doe', 22, 'Electrical Engineering');
INSERT INTO Student (s_id, FirstName, LastName, s_age, s_dept) VALUES (3, 'Alice', 'Johnson', 21, 'Mechanical Engineering');
INSERT INTO Student (s_id, FirstName, LastName, s_age, s_dept) VALUES (4, 'Bob', 'Smith', 23, 'Civil Engineering');
INSERT INTO Student (s_id, FirstName, LastName, s_age, s_dept) VALUES (5, 'Charlie', 'Brown', 20, 'Computer Science');
INSERT INTO Student (s_id, FirstName, LastName, s_age, s_dept) VALUES (6, 'David', 'Williams', 22, 'Electrical Engineering');
INSERT INTO Student (s_id, FirstName, LastName, s_age, s_dept) VALUES (7, 'Eva', 'Davis', 21, 'Mechanical Engineering');
INSERT INTO Student (s_id, FirstName, LastName, s_age, s_dept) VALUES (8, 'Frank', 'Miller', 23, 'Civil Engineering');
INSERT INTO Student (s_id, FirstName, LastName, s_age, s_dept) VALUES (9, 'Grace', 'Wilson', 20, 'Computer Science');
INSERT INTO Student (s_id, FirstName, LastName, s_age, s_dept) VALUES (10, 'Harry', 'Moore', 22, 'Electrical Engineering');
INSERT INTO Student (s_id, FirstName, LastName, s_age, s_dept) VALUES (11, 'Ivy', 'Taylor', 21, 'Mechanical Engineering');
INSERT INTO Student (s_id, FirstName, LastName, s_age, s_dept) VALUES (12, 'Jack', 'Anderson', 23, 'Civil Engineering');
INSERT INTO Student (s_id, FirstName, LastName, s_age, s_dept) VALUES (13, 'Kathy', 'Thomas', 20, 'Computer Science');
INSERT INTO Student (s_id, FirstName, LastName, s_age, s_dept) VALUES (14, 'Larry', 'Jackson', 22, 'Electrical Engineering');
INSERT INTO Student (s_id, FirstName, LastName, s_age, s_dept) VALUES (15, 'Mia', 'White', 21, 'Mechanical Engineering');


--The TRUNCATE TABLE command deletes the data inside a table, but not the table itself.

TRUNCATE TABLE student;


INSERT INTO Student (FirstName, LastName, s_age, s_dept) VALUES ('John', 'Doe', 20, 'Computer Science');
INSERT INTO Student (FirstName, LastName, s_age, s_dept) VALUES ('Jane', 'Smith', 22, 'Electrical Engineering');
INSERT INTO Student (FirstName, LastName, s_age, s_dept) VALUES ('Robert', 'Johnson', 21, 'Mechanical Engineering');
INSERT INTO Student (FirstName, LastName, s_age, s_dept) VALUES ('Michael', 'Williams', 23, 'Civil Engineering');
INSERT INTO Student (FirstName, LastName, s_age, s_dept) VALUES ('Sarah', 'Jones', 20, 'Chemical Engineering');
INSERT INTO Student (FirstName, LastName, s_age, s_dept) VALUES ('Jessica', 'Brown', 22, 'Aerospace Engineering');
INSERT INTO Student (FirstName, LastName, s_age, s_dept) VALUES ('Mohammed', 'Davis', 21, 'Industrial Engineering');
INSERT INTO Student (FirstName, LastName, s_age, s_dept) VALUES ('Emily', 'Miller', 23, 'Software Engineering');
INSERT INTO Student (FirstName, LastName, s_age, s_dept) VALUES ('Jacob', 'Wilson', 20, 'Environmental Engineering');
INSERT INTO Student (FirstName, LastName, s_age, s_dept) VALUES ('Emma', 'Moore', 22, 'Biomedical Engineering');



/*

Constraints
Specifies the rules for data in a table.
NOT NULL
Won't have a null value.
UNIQUE
All the values in a column are unique. Example: ID
PRIMARY KEY
Uniquely identify each row in a table. Example: Emp ID, SSN No., License No, Student Roll No.
FOREIGN KEY Uniquely identify
CHECK
All values in a column satisfies a specific condition Example: Age > 20
DEFAULT
Set a default value
INDEX
Create & retrieve data quickly from a database


*/


--Limit Clause

select * from student
LIMIT 5;

--tables

create table department(

    dept_id int primary key,
    dept_name varchar(80) not null,
    dept_salary int not null
);


Create Table Employee (
    emp_id int not null,
    emp_name varchar(255),
    emp_age int,
   dept_id int,
   primary key(emp_id),
CONSTRAINT FK_dept_id FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);


-- Inserting into department table
INSERT INTO department(dept_id, dept_name, dept_salary) VALUES
(1, 'Sales', 50000),
(2, 'Marketing', 60000),
(3, 'HR', 70000),
(4, 'Finance', 80000),
(5, 'IT', 90000);

-- Inserting into employee table
INSERT INTO employee(emp_id, emp_name, emp_age, dept_id) VALUES
(1, 'John Doe', 30, 1),
(2, 'Jane Doe', 32, 2),
(3, 'Alice', 28, 3),
(4, 'Bob', 35, 4),
(5, 'Charlie', 33, 5),
(6, 'David', 29, 1),
(7, 'Eve', 31, 2),
(8, 'Frank', 34, 3),
(9, 'Grace', 27, 4),
(10, 'Heidi', 36, 5),
(11, 'Ivan', 25, 1),
(12, 'Judy', 37, 2),
(13, 'Mallory', 26, 3),
(14, 'Niaj', 38, 4),
(15, 'Oscar', 24, 5);



--Joins
/*
Inner Join
Left Join
Right Join
Full Join (Not Supported)
*/

--Inner Join

select d.dept_id,d.dept_name, e.emp_id , e.emp_name, d.dept_salary
from department d Inner Join Employee e on e.dept_id=d.dept_id
where d.dept_name='IT';




--Left Join 
INSERT INTO department(dept_id, dept_name, dept_salary) VALUES
(6, 'audit', 50000);


select d.dept_id,d.dept_name, e.emp_id , e.emp_name, d.dept_salary
from department d Left Join Employee e on e.dept_id=d.dept_id;


--Right Join 
select d.dept_id,d.dept_name, e.emp_id , e.emp_name, d.dept_salary
from department d right Join Employee e on e.dept_id=d.dept_id;
