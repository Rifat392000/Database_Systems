--CSE302 Section:2 SUMMER2022
--LAB04
--Id: 2020-1-60-215
--Name : Md. Abdul Ahad Rifat

--sqlplus command line does not read after space that's why use double quotation

@"I:\3. East West University\BSC   IN   CSE\COURSE\8th SEMESTER = Summer 2022\CSE302\LAB\banking.sql"

--1
select branch_name,branch_city
from Branch
where assets >1000000;

--2
select account_number,balance
from Account
where branch_name='Downtown' or (600<=balance and balance<=750);

--3
select account_number
from Account natural join Branch
where branch_city='Rye';

--4
select loan_number
from Loan natural join Borrower natural join Customer
where amount>=1000 and customer_city='Harrison';

--5
select *
from Account
order by balance desc;

--6
select *
from Customer
order by customer_city;

--7
select customer_name
from Customer natural join Depositor natural join Account
INTERSECT
select customer_name
from Customer natural join Borrower natural join Loan;

--8
select customer_name,customer_street, customer_city
from Customer natural join Depositor natural join Account
UNION
select customer_name,customer_street, customer_city
from Customer natural join Borrower natural join Loan;


--9
select customer_name, customer_city
from Customer natural join Borrower natural join Loan
MINUS
select customer_name, customer_city
from Customer natural join Depositor natural join Account;

--10
select SUM(assets) as Total_assets
from Branch;

--11
select branch_name ,AVG(balance)
from Account  
group by branch_name;

--12
select branch_city ,AVG(balance)
from Account natural join Branch
group by branch_city;

--13
select branch_name,min(amount)
from Loan 
group by branch_name;

--14
select branch_name,count(loan_number)
from Loan 
group by branch_name;

--15
SELECT customer_name,account_number
from Customer natural join Account natural join Depositor
where balance = (SELECT max(balance) from Account);