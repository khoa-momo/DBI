--Q1 
Create Table Teachers(
	TeacherID int Primary key,
	Name nvarchar(50),
	[Address] nvarchar(200),
	Gender char(1)
)
Create Table Students(
	StudentID int Primary key,
	Name nvarchar(50),
	[Address] nvarchar(200),
	Gender char(1)
)
Alter Table Students
Add Constraint checkGender check(gender = 'm' or gender = 'f') 


Create Table Classes(
	ClassID int primary key,
	GroupID char(6),
	courseID char(6),
	NoCredits int,
	Semester char(10),
	[year] int,
	TeacherID int foreign key references Teachers(TeacherID)
)
Create Table Attend(
	[Date] date,
	Slot int, 	
	Attend bit,
	StudentID int foreign key references Students(StudentID),
	ClassID int foreign key references Classes(ClassID),
	primary key(ClassID, StudentID, [Date], Slot)
)


-----PE_demo_S2019
--Q2 
select * from customer
where Segment = 'Consumer'
and City = 'Arlington'


--Q3 
select c.*
from Customer c join Orders o
on c.id = o.CustomerID
where CustomerName like 'B%' and month(o.orderdate) = 12 and year(o.orderdate) = 2017
order by c.Segment desc, c.CustomerName asc


--Q4 
select s.ID, s.SubCategoryName, count(p.id) as 
NumberOfProduct
from SubCategory s join Product p
on s.ID = p.SubCategoryID
group by s.ID, s.SubCategoryName, p.SubCategoryID
having count(p.id) > 100
order by count(p.id) desc


--Q5 
select p.id, p.ProductName, o.quantity
from Product p join OrderDetails o
on p.ID = o.ProductID
where o.Quantity = 
(select max(quantity)
from OrderDetails)


--Q6 
select count(ID)
from Orders
Group By CustomerID
------------
select c.ID,c.CustomerName, count(o.id) as number
from Customer c join Orders o
on c.ID = o.CustomerID
group by c.ID,c.CustomerName, o.CustomerID
------------
select c.ID,c.CustomerName, count(o.id) as number
from Customer c join Orders o
on c.ID = o.CustomerID
group by c.ID,c.CustomerName, o.CustomerID
having count(o.id) = (select max(total) as total
					from 
					(select count(id) total
					from orders
					group by CustomerID) as rs)


--Q7 
select t.ID, t.ProductName, t.UnitPrice, t.SubCategoryID
from (
    select 
        t.*,
        rank() over(order by UnitPrice desc) r_low,
        rank() over(order by UnitPrice asc) r_high
    from product t
) t
where r_high <= 5 or r_low <= 5
order by r_high desc, r_low desc