
-- DBeaver is a free, open-source, multi-platform database management tool.
-- It's used by developers, database administrators, analysts, and anyone who works with data.

-- DBeaver can:
-- Manipulate data like a spreadsheet
-- Create analytical reports from different data storage
-- Export information in a suitable format
-- Support any database with a JDBC driver
-- Support popular SQL databases like MySQL, MariaDB, PostgreSQL, SQLite, Microsoft SQL Server and Apache Family
-- Support native AWS, Azure, and Google Cloud

-- DBeaver uses the JDBC application programming interface to interact with relational databases.
-- For other databases, it uses proprietary database drivers.


use tutorial;

-- stored procedures

CREATE PROCEDURE tutorial.GetAllEmployee()
begin
	select employee_id,first_name,last_name
	from employees;
END;


{ CALL tutorial.GetAllEmployee() }


-- 

CREATE PROCEDURE tutorial.GetEmployee(in id int)
begin
	select first_name,last_name,dept_id
	from employees where employee_id=id ;
END;


{ CALL tutorial.GetEmployee(:id) }


-- 

CREATE PROCEDURE tutorial.EmpCount(out totalcount int)
begin
	select count(*) into totalcount from employees;
END;

{ CALL tutorial.EmpCount(?) }



select TABLE_NAME, is_updatable from information_schema.views;




create table users (
id int not null auto_increment,
user varchar(30) not null unique key,
password varchar(50) not null,
primary key (id)
);


insert into users(user,password) values ('Rifat','Rifat123'),('Rina','Rina456'),('Sonia','Sonia778');

select * from users;


-- Trigger

CREATE DEFINER=`root`@`localhost` TRIGGER validate_users
BEFORE INSERT ON users
FOR EACH ROW
BEGIN 
	if new.user = '' then 
		signal sqlstate '45000' set message_text = 'user must not be blank';
	end if;
	if new.password = '' then 
		signal sqlstate '45000' set message_text = 'Password must not be blank';
	end if;
END


insert into users(user,password) values ('Head','');

insert into users(user,password) values ('','');

insert into users(user,password) values ('','123456');

insert into users(user,password) values ('Alex','123456');