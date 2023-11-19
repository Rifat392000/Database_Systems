-- MYSQL

create database college;

use college;

create table student
(
id int primary key,
name varchar(50),
age int not null
);

-- Inserting into student table
INSERT INTO student(id, name, age) VALUES
(1, 'John Doe', 20),
(2, 'Jane Doe', 22),
(3, 'Alice', 19),
(4, 'Bob', 21),
(5, 'Charlie', 23),
(6, 'David', 18),
(7, 'Eve', 24),
(8, 'Frank', 25),
(9, 'Grace', 26),
(10, 'Heidi', 27);


select * from student;

DROP DATABASE IF EXISTS college;

create database IF NOT EXISTS college;

use college;

SHOW DATABASES;

SHOW TABLES;


CREATE TABLE Administrator
(
id int primary key,
name varchar(50) not null,
salary int not null
);

insert into Administrator (id,name,salary) values (501,'Rifat',50000),
(503,'Mahadi',458456),(505,'Asif',80000);

select * from Administrator;

-- Safe mode OFF when need updates
SET SQL_SAFE_UPDATES = 0;

use college;

CREATE TABLE dept (
id INT PRIMARY KEY, name VARCHAR(50)
);

INSERT INTO dept VALUES (101, "english"),(102, "IT");

SELECT * FROM dept;

-- CASCADE
CREATE TABLE teacher ( 
id INT PRIMARY KEY, name VARCHAR(50), 
dept_id INT,
FOREIGN KEY (dept_id) REFERENCES dept (id)
ON UPDATE CASCADE
ON DELETE CASCADE
);

INSERT INTO teacher VALUES
(101, "Adam", 101),
(102, "Eve", 102);

SELECT * FROM teacher;

UPDATE dept SET id = 183 WHERE id = 102;

SELECT * FROM teacher;

/*
Joins
Inner Join
Outer Join
-Left Join
-Right Join
-Full Join (MYSQL do not have Full Join so we use [ Left Join UNION Right Join ] )
*/

CREATE TABLE course( id INT PRIMARY KEY, course VARCHAR(50));
INSERT INTO course (id, course) VALUES (102, "english"), (105, "math"), (103, "science"),(107, "computer science");

select * from course;


ALTER TABLE student
ADD cid INT;

DESC student;

UPDATE STUDENT
SET cid=102
where id=1 OR id=4;


UPDATE STUDENT
SET cid=103
where id=2 OR id=5 OR id=10;

-- Inner Join
SELECT * 
FROM student as s Inner JOIN course as c 
ON s.cid = c.id;

-- Left Join
SELECT * 
FROM student as s LEFT JOIN course as c 
ON s.cid = c.id;

-- Right Join
SELECT * 
FROM student as s RIGHT JOIN course as c 
ON s.cid = c.id;

-- Full Join
SELECT * 
FROM student as s LEFT JOIN course as c 
ON s.cid = c.id
UNION
SELECT * 
FROM student as s RIGHT JOIN course as c 
ON s.cid = c.id;


-- Left Exclusive Join
SELECT * 
FROM student as s LEFT JOIN course as c 
ON s.cid = c.id
where c.id IS NULL
;

-- Right Exclusive Join
SELECT * 
FROM student as s RIGHT JOIN course as c 
ON s.cid = c.id
where s.id IS NULL;


-- Self Join

CREATE TABLE employee( 
id INT PRIMARY KEY,
 name VARCHAR(50), 
 manager_id INT
);
INSERT INTO employee (id, name, manager_id) VALUES
(101, "adam", 103),
(102, "bob", 104),
(103, "casey", NULL),
(104, "donald", 103);

SELECT a.name as manager_name, b.name
FROM employee as a
JOIN employee as b
ON a.id=b.manager_id;



/*
-- Sub Queries
Select Clause
From Clause
Where Clause

*/

CREATE TABLE student_marks (
    id INT AUTO_INCREMENT,
    student_name VARCHAR(100),
    subject_name VARCHAR(100),
    marks INT,
    city VARCHAR(100),
    PRIMARY KEY(id)
);

INSERT INTO student_marks (student_name, subject_name, marks, city) VALUES ('John Doe', 'Mathematics', 85, 'New York');
INSERT INTO student_marks (student_name, subject_name, marks, city) VALUES ('Jane Smith', 'Physics', 90, 'Los Angeles');
INSERT INTO student_marks (student_name, subject_name, marks, city) VALUES ('Robert Johnson', 'Chemistry', 78, 'Chicago');
INSERT INTO student_marks (student_name, subject_name, marks, city) VALUES ('Julia Davis', 'Biology', 92, 'Houston');
INSERT INTO student_marks (student_name, subject_name, marks, city) VALUES ('Michael Brown', 'Mathematics', 88, 'New York');
INSERT INTO student_marks (student_name, subject_name, marks, city) VALUES ('Emily Johnson', 'Physics', 92, 'Los Angeles');
INSERT INTO student_marks (student_name, subject_name, marks, city) VALUES ('Daniel Williams', 'Chemistry', 81, 'Chicago');
INSERT INTO student_marks (student_name, subject_name, marks, city) VALUES ('Sophia Miller', 'Biology', 95, 'Houston');
INSERT INTO student_marks (student_name, subject_name, marks, city) VALUES ('David Davis', 'Mathematics', 89, 'New York');

select * from  student_marks;

-- Where Clause

select id, student_name , marks
from student_marks
where marks > (select AVG(marks) from student_marks);


select student_name, id
from student_marks
where id IN (
SELECT id
from student_marks
where id % 2 = 0); 


-- From Clause

select marks
from (select * from student_marks where city = 'New York') as temp;

select city, max(marks) from student_marks group by city;

-- Views

CREATE VIEW View1 AS
select id, student_name, city
from student_marks;

select * from View1;
