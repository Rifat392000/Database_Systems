create database myclass

create table  branch(
bid int,
bname varchar(40),
location varchar(30)
);

Ex1:
-----------

begin transaction 
insert into branch values(1021,'banani','bnb');

select * from branch

begin transaction 
rollback

select * from branch

begin transaction 
insert into branch values(1022,'gulshan','gul');
commit--permenant transaction

begin transaction 
rollback

select * from branch

Ex2:
------

begin transaction
update branch set location='uk' where bid=1022

select * from branch
-------------
begin transaction 
rollback

select * from branch


Ex3:
-------

begin transaction
delete from branch  where bid=1022

select * from branch
-------------
begin transaction 
rollback

select * from branch

----------------------------------------

begin transaction
delete from branch  where bid=1021
delete from branch  where bid=1023
SAVE TRANSACTION S1
delete from branch  where bid=1024

select * from branch
-------------
begin transaction 
rollback TRANSACTION S1

select * from branch

begin transaction 
rollback 

select * from branch


-------------------------------------------------------
--Stored function in T/SQL:

create table employee(
eid int,
ename varchar(40),
salary money
);

insert into employee values(101,'joe',40000),(103,'Rifat',738888),(105,'Justin',4000);

select * from employee;

--scalar value function

CREATE FUNCTION  totalWage(@eid int)
returns money
as
begin
declare @basic money,@hra money,@da money, @pa money, @gross money
select @basic=salary from employee where eid=@eid
set @hra=@basic*0.1
set @da=@basic*0.2
set @pa=@basic*0.1
set @gross=@hra+@da+@pa+@basic
return @gross
end

select dbo.totalWage(105) "Person Salary"

--table value function

select * from employee1

create function TVF(@dept varchar(30))
returns table
as
return(select * from employee1 where deptname=@dept)

select * from TVF('.net')





----Working With Explicit Cursors in T-SQL | SQL Server


-- Without  cursor variables

declare c1 cursor scroll for select * from employee1
open c1
fetch last from c1
fetch first from c1
fetch prior from c1
fetch absolute 5 from c1
fetch relative -2 from c1
fetch relative 3 from c1
close c1
deallocate c1


--With cursor variables

declare c1 cursor scroll for select eid,ename from employee1
declare @eid int , @ename varchar(60)
open c1
fetch last from c1 into @eid,@ename
print 'The employee name'+' '+@ename+' '+'and id is '+cast(@eid as varchar)
fetch prior from c1 into @eid,@ename
print 'The employee name'+' '+@ename+' '+'and id is '+cast(@eid as varchar)
fetch first from c1 into @eid,@ename
print 'The employee name'+' '+@ename+' '+'and id is '+cast(@eid as varchar)
fetch absolute 5 from c1 into @eid,@ename
print 'The employee name'+' '+@ename+' '+'and id is '+cast(@eid as varchar)
fetch relative 3 from c1 into @eid,@ename
print 'The employee name'+' '+@ename+' '+'and id is '+cast(@eid as varchar)
close c1
deallocate c1





select * from employee

select ename,salary,ROW_NUMBER() over(order by salary desc) as Rank 
from employee



select ename,salary,Rank() over(order by salary desc) as Rank 
from employee


select ename,salary,dense_Rank() over(order by salary desc) as Rank 
from employee


create table emp(
eid int,
ename varchar(60),
salary money,
deptno int
);

select ename,DEPTNO,salary,ROW_NUMBER() over(PARTITION BY DEPTNO order by salary desc) as Rank 
from emp



select ename,DEPTNO,salary,RANK() over(PARTITION BY DEPTNO order by salary desc) as Rank 
from emp



select ename,DEPTNO,salary,DENSE_RANK() over(PARTITION BY DEPTNO order by salary desc) as Rank 
from emp
