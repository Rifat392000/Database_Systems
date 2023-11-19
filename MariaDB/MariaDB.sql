-- MariaDB

mysql -u root -p

show databases;

mariadb -u root -p

create database test;

select * from information_schema.schemata;

drop database test;

create database tutorial character set='utf8mb4' collate='utf8mb4_general_ci' comment='Database created by Rifat';

select * from information_schema.schemata;


use tutorial;

create table employees ( 
id int primary key auto_increment, 
employee_id int not null unique key, 
first_name varchar(30) not null, 
last_name varchar(30) not null, 
birth_date date );


desc employees;


-- HeidiSQL

CREATE TABLE `employees` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`employee_id` INT(11) NOT NULL,
	`first_name` VARCHAR(30) NOT NULL COLLATE 'utf8mb4_general_ci',
	`last_name` VARCHAR(30) NOT NULL COLLATE 'utf8mb4_general_ci',
	`birth_date` DATE NULL DEFAULT NULL,
	PRIMARY KEY (`id`) USING BTREE,
	UNIQUE INDEX `employee_id` (`employee_id`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;

--
DROP TABLE employees;



CREATE TABLE departments (
id int null primary key AUTO_INCREMENT, 
dept_name VARCHAR(50) not null

);



create table employees ( 
id int null primary key AUTO_INCREMENT, 
employee_id int not null unique KEY,
first_name varchar(30) not null, 
last_name varchar(30) not null,
birth_date DATE, 
dept_id int not null,
constraint fk_dept_id foreign key (dept_id) references departments (id) 
on delete RESTRICT
on update RESTRICT
);

-- Description of a table

DESCRIBE employees;


--  insert statements for departments table
INSERT INTO departments (dept_name) VALUES ('Sales');
INSERT INTO departments (dept_name) VALUES ('Marketing');
INSERT INTO departments (dept_name) VALUES ('Engineering');
INSERT INTO departments (dept_name) VALUES ('Human Resources');
INSERT INTO departments (dept_name) VALUES ('Finance');

--  insert statements for employees table
INSERT INTO employees (employee_id, first_name, last_name, birth_date, dept_id) VALUES (1, 'John', 'Doe', '1990-01-01', 1);
INSERT INTO employees (employee_id, first_name, last_name, birth_date, dept_id) VALUES (2, 'Jane', 'Doe', '1995-01-01', 2);
INSERT INTO employees (employee_id, first_name, last_name, birth_date, dept_id) VALUES (3, 'Bob', 'Smith', '1985-11-01', 3);
INSERT INTO employees (employee_id, first_name, last_name, birth_date, dept_id) VALUES (4, 'Alice', 'Johnson', '1992-01-01', 4);
INSERT INTO employees (employee_id, first_name, last_name, birth_date, dept_id) VALUES (5, 'Tom', 'Hanks', '1980-01-01', 5);


SELECT * FROM departments;

SELECT * FROM employees;



-- import data from csv(Comma-separated values )

LOAD DATA LOCAL INFILE 'C:/Users/Home/Documents/departments.csv'
INTO TABLE departments
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(id, dept_name);


SELECT * FROM departments;


SELECT first_name, last_name FROM employees 
WHERE dept_id =2;

-- update statements

UPDATE employees
SET last_name ='Rifat'
WHERE employee_id=3;


UPDATE employees
SET employee_id = employee_id +5000;


-- delete statements

DELETE FROM employees;

DELETE FROM employees WHERE dept_id=2;


-- view create

CREATE VIEW employeeList AS
SELECT employee_id, last_name, first_name
FROM employees
ORDER BY last_name, first_name;

SELECT * FROM employeeList;


--   DROP VIEW employeeList;  


CREATE VIEW employeeListWithDepartment AS
SELECT e.employee_id, e.last_name, e.first_name , d.dept_name
FROM employees e 
LEFT JOIN  departments d 
ON e.dept_id=d.id
WHERE d.id = 3
ORDER BY e.last_name, e.first_name;


SELECT * from employeeListWithDepartment;






















