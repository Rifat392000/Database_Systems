--CSE302 Section:2 SUMMER2022
--LAB05
--Id: 2020-1-60-215
--Name : Md. Abdul Ahad Rifat

--1
--without sub queries

SELECT C.customer_name, C.customer_street, C.customer_city
From customer C,  branch Br, account Ac, depositor Dp
WHERE C.customer_name = Dp.customer_name AND 
Dp.account_number = Ac.account_number AND 
Ac.branch_name = Br.branch_name AND (branch_city = customer_city);


--with sub query

SELECT C.customer_name, C.customer_street, C.customer_city
From customer C, account Ac, depositor Dp
WHERE C.customer_name = Dp.customer_name AND 
Dp.account_number = Ac.account_number AND 
(C.customer_city, Ac.account_number) IN
 ( SELECT Br.branch_city, Ac.account_number 
FROM branch Br, account Ac, depositor Dp
WHERE Ac.branch_name = Br.branch_name AND Dp.account_number = Ac.account_number);


--2
--without sub queries

SELECT C.customer_name, C.customer_street, C.customer_city
From customer C,  branch Br, loan L, Borrower Bo
WHERE C.customer_name = Bo.customer_name AND 
L.loan_number = Bo.loan_number AND 
L.branch_name = Br.branch_name AND (branch_city = customer_city);


--with sub query

select customer_name, customer_street, customer_city
from customer natural join borrower
where (loan_number, customer_city) in 
(select loan_number, branch_city from loan natural join branch);


--3
--with having

select branch_city,avg(balance) as avg_balance
from branch b,account a
where b.branch_name=a.branch_name
group by branch_city
having sum(balance)>=1000;



--WITHOUT HAVING

SELECT branch_city, avg_balance
FROM (SELECT branch_city, avg(balance) as avg_balance , sum(balance) as total
FROM branch Br, account Ac
WHERE Br.branch_name = Ac.branch_name
GROUP BY branch_city) temp1
WHERE temp1.total >= 1000;


--4
--with having

SELECT branch_city, avg(amount) as avg_amount
FROM branch Br, loan L
WHERE Br.branch_name = L.branch_name
GROUP BY branch_city
HAVING avg(amount)>= 1500;


--without having

select branch_city, avg_amount
from( select branch_city, avg(amount) as avg_amount
from branch natural join loan
group by branch_city )
where avg_amount >= 1500;


--5
--with ALL keyword

SELECT C.customer_name, C.customer_street, C.customer_city
From customer C, account Ac, depositor Dp
WHERE C.customer_name = Dp.customer_name AND 
Dp.account_number = Ac.account_number AND 
balance >= ALL (SELECT balance FROM account);


--without ALL keyword

SELECT C.customer_name, C.customer_street, C.customer_city
From customer C, account Ac, depositor Dp
WHERE C.customer_name = Dp.customer_name AND 
Dp.account_number = Ac.account_number AND 
balance >= (SELECT max(balance) FROM account);



--6
--without ALL keyword

SELECT C.customer_name, C.customer_street, C.customer_city
From customer C, borrower Bo, loan L
WHERE C.customer_name = Bo.customer_name AND 
Bo.loan_number =L.loan_number AND 
amount <= (SELECT min(amount) FROM loan);


--with ALL keyword

SELECT C.customer_name, C.customer_street, C.customer_city
From customer C, borrower Bo, loan L
WHERE C.customer_name = Bo.customer_name AND 
Bo.loan_number =L.loan_number AND 
amount <= ALL (SELECT amount FROM loan);


--7
--with IN

SELECT DISTINCT branch_name, branch_city
FROM branch
WHERE branch_name IN (SELECT Ac.branch_name
FROM account Ac, loan L
WHERE Ac.branch_name = L.branch_name);


--with EXISTS

SELECT DISTINCT Bo.branch_name, Bo.branch_city
FROM branch Bo
WHERE EXISTS (SELECT Ac.branch_name
FROM account Ac, loan L
WHERE Ac.branch_name = L.branch_name AND
Bo.branch_name= Ac.branch_name);


--8
--with NOT IN

SELECT DISTINCT Ci.customer_name ,Ci.customer_city
FROM customer Ci, account Ac, depositor Dp
WHERE Ac.account_number = Dp.account_number AND
Dp.customer_name = Ci.customer_name AND
Ci.customer_name NOT IN (SELECT C.customer_name
FROM loan L, Borrower Bo, customer C
WHERE Bo.customer_name = C.customer_name AND
L.loan_number = Bo.loan_number);


--with NOT EXISTS

SELECT DISTINCT Ci.customer_name ,Ci.customer_city
FROM customer Ci, account Ac, depositor Dp
WHERE Ac.account_number = Dp.account_number AND
Dp.customer_name = Ci.customer_name AND
NOT EXISTS(SELECT C.customer_name
FROM loan L, Borrower Bo, customer C
WHERE Bo.customer_name = C.customer_name AND
L.loan_number = Bo.loan_number AND
Ci.customer_name = C.customer_name);


--9
--with WITH clause

with t1 as (
SELECT branch_name,sum(balance) as total_balance
FROM account
GROUP BY branch_name),
t2 as (
SELECT avg(total_balance) as avr_balance
FROM t1)
SELECT branch_name
FROM t1, t2
WHERE t1.total_balance > t2.avr_balance;


--WITHOUT with clause

SELECT branch_name
FROM
(SELECT branch_name,sum(balance) as total_balance
FROM account
GROUP BY branch_name) t1,
(SELECT avg(total_balance) as avr_balance
FROM (SELECT branch_name,sum(balance) as total_balance
FROM account
GROUP BY branch_name) t2
) t3
WHERE t1.total_balance > t3.avr_balance;

--10
--with WITH clause
 
 with t1 as (
 SELECT branch_name, sum(amount) as total_loan
 FROM loan
 GROUP BY branch_name),
 t2 as (
 SELECT avg(total_loan) as avg_loan
 FROM t1)
 SELECT branch_name
 FROM t1,t2
 WHERE t1.total_loan < t2.avg_loan;


--WITHOUT with clause

SELECT branch_name
FROM
(SELECT branch_name,sum(amount) as total_loan
FROM loan
GROUP BY branch_name) t1,
(SELECT avg(total_loan) as avg_loan
FROM (SELECT branch_name,sum(amount) as total_loan
FROM loan
GROUP BY branch_name) t2
) t3
WHERE t1.total_loan < t3.avg_loan;











