exec sp


-------------------------------
--input parameters stored procedure
create procedure spinput(@eid int , @ename varchar(40), @salary money)
as 
begin
insert into employee values(@eid,@ename,@salary)
end

execute spinput 101,'peokogine',50000

select * from employee




----------------------------------
--output parameter in stored procedure

create procedure sp_Out(@eid int,@pf int out,@pt int out)
as 
begin
declare @sal money
select @sal=salary from emp where @eid=eid
set @pf=@sal*0.1
set @pt=@sal*0.2
end

declare @bpf int,@bpt int
exec sp_Out 101,@bpf out,@bpt out
print @bpf
print @bpt



--------------------------
--primary key and foreign key

--i)without cascade constraint

create table parent1 (id int, name varchar(40), dept varchar(40));


ALTER TABLE parent1
ALTER COLUMN id int NOT NULL;


ALTER TABLE parent1
ADD CONSTRAINT myprimarykey PRIMARY KEY(id)

insert into parent1 values(101,'Rifat','CSE'),(102,'Rifat','EEE'),(103,'Sifat','CSE'),(104,'Alvi','BBA')

select * from parent1

create table child1(id int not null primary key,salary money,pid int foreign key references parent1(id))

insert into child1 values(22,50000,101),(34,40000,103),(45,40000,103),(67,46000,104)

select * from child1


--a)Insertion Rule
insert into child1 values(22,50000,115)--not allowed fixed not solve

--b)updation rule
update parent1 set id=1 where id=101 --not allowed but can be solved using cascade

--c)deletion rule
delete from parent1 where id=102---allowed because child table not use this primary key value
delete from parent1 where id=103---not allowed because child table
                                ---use this primary key value but can can use cascade to delete this





--i)with cascade constraint

create table parent2 (id int, name varchar(40), dept varchar(40));


ALTER TABLE parent2
ALTER COLUMN id int NOT NULL;


ALTER TABLE parent2
ADD CONSTRAINT myprimarykey1 PRIMARY KEY(id)

insert into parent2 values(101,'Rifat','CSE'),(102,'Rifat','EEE'),(103,'Sifat','CSE'),(104,'Alvi','BBA')

select * from parent2

create table child2(id int not null primary key,salary money,pid int foreign key references parent2(id) on update cascade on delete cascade)

insert into child2 values(22,50000,101),(34,40000,103),(45,40000,103),(67,46000,104)

select * from child2


--a)Insertion Rule
insert into child2 values(22,50000,115)--not allowed fixed not solve

--b)updation rule
update parent2 set id=1 where id=101 --allowed
select * from child2

--c)deletion rule
delete from parent2 where id=102---allowed because child table not use this primary key value
delete from parent2 where id=103--- allowed 
select * from child2

-----------------------------------------------------------

--unique constraint

create table student(id int unique,name varchar(30))

insert into student values(101,'Rahim')--allowed
insert into student values(101,'Rahim')--not allowed
insert into student values(102,'Rahim')--allowed
insert into student values(null,null)--allowed

select * from student



---------------------
--view

--simple view 

create view v1 as select * from employee

select * from v1

insert into v1 values(102,'putin',10000000)
select * from v1
select * from employee

update v1 set eid=59 where eid=102
select * from v1
select * from employee

delete v1 where eid=59
select * from v1
select * from employee









