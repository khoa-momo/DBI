
--1.Select all are individual customer
select * from
CUSTOMER 
where CUST_TYPE_CD = 'I'

--2. Count number of all business customer
select count(*) as total
from customer
where CUST_TYPE_CD = 'B'
group by CUST_TYPE_CD


--3. Select all account which have AVAIL_BALANCE different PENDING_BALANCE
select * 
from account 
where AVAIL_BALANCE != PENDING_BALANCE


--4.  Select all customer
select * from INDIVIDUAL
select * from CUSTOMER
select * from BUSINESS
--
select c.CUST_ID, c.CUST_TYPE_CD, (i.FIRST_NAME + i.LAST_NAME) as name
from INDIVIDUAL i join CUSTOMER c
on i.CUST_ID = c.CUST_ID
union
select c.CUST_ID, c.CUST_TYPE_CD, b.name as name
from BUSINESS b join CUSTOMER c
on b.CUST_ID = c.CUST_ID


--5. Count all account of each employee
Select OPEN_EMP_ID, count(ACCOUNT_ID) as totalcount
From ACCOUNT
Group by OPEN_EMP_ID
---
Select count(OPEN_EMP_ID)
From ACCOUNT
Group by ACCOUNT_ID
---
Select e.EMP_ID, (e.FIRST_NAME + e.LAST_NAME) as name,
count(a.ACCOUNT_ID) as number
from ACCOUNT a right join EMPLOYEE e
on a.OPEN_EMP_ID = e.EMP_ID
group by e.FIRST_NAME , e.LAST_NAME, e.EMP_ID


--6. List all  account which have one Customer
select cust_id
from account  
group by cust_id,  CUST_ID
having count(account_id) = 1
