--CSE302 Section:2 SUMMER2022
--LAB01
--Id: 2020-1-60-215
--Name : Md. Abdul Ahad Rifat


--1.(a)
create table instructor_2020160215(
id number,
name varchar2(12),
dept_name varchar2(12),
salary number,
Primary key (id)
);


--1.(b)
create table course_2020160215(
course_id varchar2(10),
title varchar2(30),
dept_name varchar2(10),
credits number(2,1),
Primary key (course_id )
);


--2.(a)

Insert Into instructor_2020160215 Values(10101,'Srinivasan','Comp.Sci.',65000);
Insert Into instructor_2020160215 Values(12121,'Wu','Finance',90000);
Insert Into instructor_2020160215 Values(15151,'Mozart','Music',40000);
Insert Into instructor_2020160215 Values(22222,'Einstein','Physics',95000);
Insert Into instructor_2020160215 Values(32343,'El Said','History',60000);
Insert Into instructor_2020160215 Values(33456,'Gold','Physics',87000);
Insert Into instructor_2020160215 Values(45565,'Katz','Comp.Sci.',75000);
Insert Into instructor_2020160215 Values(58583,'Califieri','History',62000);
Insert Into instructor_2020160215 Values(76543,'Singh','Finance',80000);
Insert Into instructor_2020160215 Values(76766,'Crick','Biology',72000);
Insert Into instructor_2020160215 Values(83821,'Brandt','Comp.Sci.',92000);
Insert Into instructor_2020160215 Values(98345,'Kim','Elec.Eng.',80000);


--2.(b)

Insert Into course_2020160215 Values('BIO-101','Intro. to Biology','Biology',4);
Insert Into course_2020160215 Values('BIO-301','Genetics','Biology',4);
Insert Into course_2020160215 Values('BIO-399','Computional Biology','Biology',3);
Insert Into course_2020160215 Values('CS-101','Intro. to Computer Science','Comp.Sci.',4);
Insert Into course_2020160215 Values('CS-190','Game Design','Comp.Sci.',4);
Insert Into course_2020160215 Values('CS-315','Robotics','Comp.Sci.',3);
Insert Into course_2020160215 Values('CS-319','Image Processing','Comp.Sci.',3);
Insert Into course_2020160215 Values('CS-347','Databasre System Concepts','Comp.Sci.',3);
Insert Into course_2020160215 Values('EE-181','Intro. to Digital Systems','Elec.Eng.',3);
Insert Into course_2020160215 Values('FIN201','Investment Banking','Finance',3);
Insert Into course_2020160215 Values('HIS351','World History','History',3);
Insert Into course_2020160215 Values('MU-199','Music Video Production','Music',3);
Insert Into course_2020160215 Values('PHY-101','Physics Principles','Physics',4);


--Lab Task # 03 (Writing Queries):

--i

select name
from instructor_2020160215;

--ii

select Course_id,title
from course_2020160215;

--iii

select name,dept_name
from instructor_2020160215
where id=22222;

--iv

select title,credits
from course_2020160215
WHERE dept_name='Comp.Sci.';

--v

select name,dept_name
from instructor_2020160215
where 70000<=salary;

--vi

select title
from course_2020160215
WHERE credits>=4;

--vii

select name,dept_name
from instructor_2020160215
where (80000<=salary and salary<=100000);

--viii

select title,credits
from course_2020160215
WHERE Not (dept_name='Comp.Sci.');

--ix

select * from instructor_2020160215;

--x

select *
from course_2020160215
WHERE (dept_name='Biology' AND credits!=4);
