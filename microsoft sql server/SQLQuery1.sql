
USE master ; 

CREATE DATABASE SAMPLE_DB_Rifat

USE SAMPLE_DB_Rifat

--create a table

create table employee(
Id int,
empname varchar(255),
city varchar(255),
salary int

);

insert into employee(Id,empname,city,salary)
values('25','Rifat','Dhaka','100000');

select * from employee

insert into employee(Id,empname,city,salary)
values('27','Rifat2','Dhaka','45000');
insert into employee(Id,empname,city,salary)
values('29','Rifat3','Dhaka','40000');
insert into employee(Id,empname,city,salary)
values('25','Rifat4','Dhaka','9870000');


select id,empname from employee where salary=45000;

select distinct city from employee;

select * from employee
order by salary desc;

select * from employee
order by city,salary desc;

insert into employee(Id,empname,city,salary)
values('26','Rifat5','Rajshahi','70000');

insert into employee(Id,empname,city,salary)
values('27','Rifat6','Rajshahi','9870000');

select * from employee
where city='Rajshahi' and salary>40000

select * from employee order by salary asc

select * from employee
where city='Rajshahi' or salary>40000
order by salary asc;


--in select multiple values
select * from employee
where empname in('Rifat2','Rifat')

select * from employee
where salary between 70000 and 9870000
order by salary
;

select * from employee
where salary not between 70000 and 9870000
order by salary
;


--Like Operator
---  % (percentage) : Zero, one or multiple characters
---  _ (Underscore) : One or single character

select * from employee
where city like 'D%'

select * from employee
where city like '%hi'

select * from employee
where city like '__a%'


select * from employee
where city not like '__a%'


select max(salary) as Result
from employee

select min(salary) as Result
from employee

select sum(salary) as totalSum from employee;

select sum(salary) as totalSum 
from employee
where salary>1000000;


select avg(salary)
from employee

select count(city) as "Rajshahi City"
from employee
where city='Rajshahi'


--NOT NULL Constraint.
--UNIQUE Constraint.
--DEFAULT Constraint.
--CHECK Constraint.
--PRIMARY KEY Constraint.
--FOREIGN KEY Constraint

--NOT NULL Constraint.
 create table Faculty(
 id int not null,
 empname varchar(100) not null,
 city varchar(100),
 salary int
 );

 insert into Faculty(Id,empname,city,salary)
values('25','gg','Dhaka','100000');

select * from Faculty



--Primary Key is used to uniquely identify a row also not null values
--but a unique key is used to prevent duplicate values in a column.


--UNIQUE Constraint.
create table Roll(
id int not null unique
);


insert into Roll(id) values (2)
insert into Roll(id) values (3)
insert into Roll(id) values (4)

select * from Roll

drop table employee

--PRIMARY KEY Constraint.
create table employee(
Id int not null primary key,
empname varchar(255),
city varchar(255),
salary int
);

insert into employee(Id,empname,city,salary)
values('27','Rifat2','Dhaka','45000');
insert into employee(Id,empname,city,salary)
values('29','Rifat3','Dhaka','40000');
insert into employee(Id,empname,city,salary)
values('25','Rifat4','Dhaka','9870000');

select * from employee

--FOREIGN KEY Constraint
create table department(
deptid int not null primary key,
deptname varchar(200),
id int foreign key references employee(id)
);

insert into department(deptid,deptname,id)
values('1','CSE','27');
insert into department(deptid,deptname,id)
values('2','EEE','27');
insert into department(deptid,deptname,id)
values('3','EEE','25');

SELECT * FROM department


--CHECK Constraint.
DROP TABLE DEPARTMENT
drop table employee 

create table employee(
Id int not null primary key,
empname varchar(255),
city varchar(255),
salary int CHECK (SALARY>40000)
);

--NOT VALID ERROR SHOW
insert into employee(Id,empname,city,salary)
values('29','Rifat3','Dhaka','40000');
--VALID
insert into employee(Id,empname,city,salary)
values('27','Rifat2','Dhaka','45000');

insert into employee(Id,empname,city,salary)
values('28','Rifat2','Dhaka','45000');
insert into employee(Id,empname,city,salary)
values('25','Rifat4','Dhaka','9870000');

--DEFAULT Constraint.

CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    City varchar(255) DEFAULT 'Sandnes'
);

INSERT INTO Persons(ID,LastName,FirstName,Age,City)
VALUES('1','FAKIR','ALFAZ','32',DEFAULT)
INSERT INTO Persons(ID,LastName,FirstName,Age,City)
VALUES('2','FAKIR','ZAMAN','36',DEFAULT)


SELECT * FROM Persons


--Alter Table Statement
--use add or delete column in existing table

select * from employee;

--add column
alter table employee
add age int;

select * from employee;

--drop column
alter table employee
drop column age ;


--update statement is use to modify the exsiting records in a table

select * from employee;

--update a single record

update employee
set salary ='900000'
where id=27

update employee
set empname ='TOM'
where id=27

select * from employee;

update employee
set salary ='80000', city='nyc'
where id=25
select * from employee;


---SQL ALIASES

select empname from employee;

select empname as Myresult from employee;

select empname as 'Rifat' from employee;


--SQL STRORED PROCEDURE
 -- STRORED PROCEDURE in SQL is a prepared sql code that you can easily create and save.
 -- So we can reuse the code again and again its like function
 -- lets say you have a query you have to write again and again on this case you use STRORED PROCEDURE

 select * from employee;

--stored procedure

 create procedure AllRecord
 AS
 select * from employee
 GO;

 exec AllRecord;

 --stored procedure with one parameter

create procedure AllRecord1  @city varchar(20)
 AS
select * from employee where city=@city;


exec AllRecord1  @city='Dhaka' ;


--stored procedure with multiple parameter

create procedure AllRecord2  @city varchar(20), @empnm varchar(255)
 AS
select * from employee where city=@city and empname=@empnm;

exec AllRecord2  @city='Dhaka', @empnm='TOM' ;


--SQL CREATE INDEX STATEMENT
--SPEED UP THE QUERIES(SEARCHES)


CREATE INDEX Myindex
on employee (empname);

CREATE INDEX Myindex1
on employee (empname,salary);


Drop index employee.Myindex;

--SQL SELECT INTO Statement

select * into backupEMP
from employee

select * from backupEMP;

select city,salary into backupEMPInfoSome
from employee

select * from backupEMPInfoSome;


--SQL SELECT TOP CLAUSE

SELECT TOP 2 * FROM employee

insert into employee(Id,empname,city,salary)
values('20','Rifat4','Dhaka','987000');

insert into employee(Id,empname,city,salary)
values('18','Rifat4','Dhaka','987000');

insert into employee(Id,empname,city,salary)
values('22','Rifat4','Dhaka','987000');

SELECT * FROM employee;

SELECT TOP 50 PERCENT * FROM employee

SELECT TOP 25 PERCENT * FROM employee

SELECT TOP 25 PERCENT * FROM employee
WHERE salary>70000

--Backup Database in SQL
--mybackup.bak filename must be add , you can select any prefer name

backup database SAMPLE_DB_Rifat
to disk = 'D:\mybackup.bak';

--SQL Views
--views contain row and column

create view [EmployeeS ABC] AS
select empname,city
from employee
where city='Dhaka'

select * from [EmployeeS ABC];

create view [View1] AS
select empname,city
from employee
where city='Dhaka'

select * from  [View1];

drop view [View1];

select * from  [View1];


--drop the database

USE master ;

DROP DATABASE SAMPLE_DB_Rifat;
