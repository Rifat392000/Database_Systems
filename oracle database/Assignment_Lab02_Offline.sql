
create table accounta(da DATE);
Insert Into accounta Values('20 March 2019');
Insert Into accounta Values('21 January 2012');
Insert Into accounta Values('20 May 2019');
select da from accounta where (da<'20 May 2019');

--CSE302 Section:2 SUMMER2022
--LAB02
--Id: 2020-1-60-215
--Name : Md. Abdul Ahad Rifat


--Lab Task # 01 (Schema Definition):

--i

create table account(
account_no char(5),
balance number not null,
CONSTRAINT account_no_PK PRIMARY KEY(account_no), 
CONSTRAINT balance_CHECK CHECK(balance>0)
);

--ii

create table customer(
customer_no char(5),
customer_name varchar2(20) Not null,
customer_city varchar2(10),
CONSTRAINT customer_no_PK PRIMARY KEY(customer_no)
);

--iii

create table depositor(
account_no char(5),
customer_no char(5),
primary key(account_no,customer_no)
);


--Lab Task # 02 (Schema Modification):

--i

Alter Table customer add date_of_birth date;

--ii

Alter Table customer drop column date_of_birth;

--iii

Alter Table depositor rename column account_no To a_no ;
Alter Table depositor rename column customer_no To c_no ;

--iv


ALTER TABLE depositor ADD CONSTRAINT depositor_fk1 Foreign Key (a_no) REFERENCES account;
ALTER TABLE depositor ADD CONSTRAINT depositor_fk2 Foreign Key (c_no) REFERENCES customer;




--Lab Task # 03 (Inserting Records into Tables):


Insert Into Account Values('A-101',12000);
Insert Into Account Values('A-102',6000);
Insert Into Account Values('A-103',2500);


Insert Into Customer Values('C-101','Alice','Dhaka');
Insert Into Customer Values('C-102','Annie','Dhaka');
Insert Into Customer Values('C-103','Bob','Chittagong');
Insert Into Customer Values('C-104','Charlie','Khulna');


Insert Into Depositor Values('A-101','C-101');
Insert Into Depositor Values('A-103','C-102');
Insert Into Depositor Values('A-103','C-104');
Insert Into Depositor Values('A-102','C-103');



--Lab Task # 04 (Queries):

--i

select customer_name,customer_city
from customer;

--ii

SELECT DISTINCT customer_city FROM Customer;					

--iii

select account_no from account where balance>7000;

--iv

 select customer_no,customer_name
from customer where  (customer_city = 'Khulna') ;

 --v
 
 select customer_no,customer_name
from customer where not (customer_city = 'Dhaka') ;

--vi

SELECT customer_name,customer_city 
from account , customer  , depositor 
where account.account_no=depositor.a_no AND customer.customer_no=depositor.c_no
and account.balance>7000;

--vii

SELECT customer_name,customer_city 
from account a, customer c , depositor d
where  a.account_no=d.a_no AND c.customer_no=d.c_no
and balance>7000 and customer_city !='Khulna';

--viii

select account_no,balance
from account a, customer c , depositor d
where a.account_no=d.a_no AND c.customer_no=d.c_no AND C.customer_no='C-102';

--ix
select account_no,balance
from account a, customer c , depositor d
where a.account_no=d.a_no AND c.customer_no=d.c_no AND (c.customer_city='Dhaka' or c.customer_city='Khulna') ;


--x

select customer_no,customer_name,customer_city
from  customer , depositor 
where customer.customer_no=depositor.c_no
AND depositor.a_no='Null';
