
create table employee(
id int,
name varchar(50),
salary money,
date tinyint
);

--sp mean stored procedure
sp_help employee

--Alter Command

--HOW TO CHANGE DATATYPE AND ALSO SIZE OF THE DATATYPE.

Alter table employee alter column name char(40)

--how to add new column to table

alter table employee add address varchar(40)

--when you want to change table name as well as column name use SP_RENAME

--How to change column name and table name

-- column name change

sp_rename 'employee.name','ename'

--table name change

sp_rename 'employee','emp'

--how to drp unwanted column for the table

alter table emp drop column address

--DELETE ALL THE ROW FROM THE TABLE AT A TIME USING TRUNCATE ( WE CAN NOT DELETE SPECIFIC ROW FROM 
--THE TABLE BEACUSE IT NOT SUPPORTS "WHERE" KEYWORD CONDITION



SELECT * FROM EMP

TRUNCATE TABLE EMP



create table employee(
id int,
name varchar(50),
salary money,
date tinyint
);



--Insert

--Method 1

--syntax
-- insert into <table name> values(value1,value2,value3,..............);

insert into employee values(11,'Rifat',5500,22);

SELECT * FROM employee


--Method 2
--syntax
--insert into <table name>(required column names) values(value1,value2,value3,..............);
--advantage user have a chance to left or leave any column of the table

insert into employee(id,name,salary) values(12,'sifat',550);
SELECT * FROM employee

--without into keyword value insert (optional sql server)

insert  employee values(41,'Tom',100000,2);

insert  employee(id,name,salary) values(12,'fat',550);

SELECT * FROM employee


--update
--update specific row in a table .....use where condition or update all row in a table

EX1:
update employee set salary=540000 where id=12

EX2:
update employee set salary=10040000 , date=24

EX3:
-- = is not support null value compilation
update employee set salary=100 where date is null

--DELETE keyword only delete the record not the structure

delete employee where date is null

delete employee
