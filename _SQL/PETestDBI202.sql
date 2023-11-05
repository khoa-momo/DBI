--Q2 
Select * 
From Customer
Where Segment = 'Consumer' and City = 'Arlington';


--Q3 
Select c.* --c.*
From Customer c join Orders o
On c.ID = o.CustomerID
Where CustomerName like 'B%' and  month(o.orderdate) = 12 and year(o.orderdate) = 2017
Order By c.Segment desc, c.CustomerName asc

--Q5
Select *
From Orders
Where OrderDate =
	(
	Select max(OrderDate)
	From Orders
	)

--Q6
Select * From Product
Select * From OrderDetails
--
Select p.ID, p.ProductName, count(od.OrderID) as [NumberofOrders]
From Product p join OrderDetails od
On p.ID = od.ProductID
Group By p.ID, p.ProductName, od.ProductID
Having Count(od.OrderID) =
	(
	Select Min([NumberofOrders])
	From
		(
		Select p.ID, p.ProductName, count(od.OrderID) as [NumberofOrders]
		From Product p join OrderDetails od
		On p.ID = od.ProductID
		Group By p.ID, p.ProductName, od.ProductID
		)as T
	)
Order By ProductID


--Q7
With MyTable As
	(
	Select top 5 *
	From product
	Order by UnitPrice desc
	Union
	Select top 5 *
	From Product 
	Order by UnitPrice asc
	)
Select * From MyTable
Order by MyTable.UnitPrice desc


--Q4
Select * From Orders;
------------------
With MyTable1 as
(
	Select OrderID, o.OrderDate, Quantity*SalePrice*(1-Discount) as [Amount]
	From OrderDetails od join Orders o
	On od.OrderID = o.ID 
)
Select OrderID, OrderDate, Sum(Amount) as [TotalAmount]
From MyTable1
Group By OrderID, OrderDate, OrderID
Having Sum(Amount) > 8000
Order by [TotalAmount] desc;




--------------------------------------------------------------------------------
--Q8 
Create Proc TotalAmount
@OrderID nvarchar(255), @TotalAmount float Output
As
Begin
With MyTable1 as
(
	Select OrderID, Quantity*SalePrice*(1-Discount) as [Amount]
	From OrderDetails od join Orders o
	On od.OrderID = o.ID 
)
Select @TotalAmount = Sum(Amount) -- as [TotalAmount]
From MyTable1
Where OrderID = @OrderID
Group By OrderID 
End;

--
Drop Proc TotalAmount;
------------------------------------------------------------------------
Declare @t float 
Execute TotalAmount 'CA-2014-100006', @t Output
Print @t

------------------------------------------------------

--Q9
Create Trigger InsertSubCategory On SubCategory
After Insert As
Begin
	/*Set NOCOUNT ON
	Insert Into SubCategory(
	ID,
	SubCategoryName,
	CategoryID
	)*/
	--------
	Select Top 1 sc.SubCategoryName, c.CategoryName
	From SubCategory sc full join Category c
	On sc.CategoryID = c.ID
	Order by sc.ID desc
End

Drop Trigger InsertSubCategory
---
Insert Into SubCategory(SubCategoryName,CategoryID) values ('Helicopter',6); 

Insert Into SubCategory(SubCategoryName) values ('berry'); 


Insert Into SubCategory(ID,SubCategoryName,CategoryID) values (100,'B52',6); 

--Q10
Select * From Category
------------------------------
SET IDENTITY_INSERT Category ON
Insert Into Category(ID,CategoryName) values (5, 'Food');
SET IDENTITY_INSERT Category OFF
 

--Insert Into Category(ID,CategoryName) values (Default, 'Wines');


Select * From SubCategory
--- 
Insert Into SubCategory(ID,SubCategoryName,CategoryID) values (62,'Olive',4); 
 
Insert Into Category(CategoryName) values ('Planes'); 


----------------------------------------------------------
Insert Into SubCategory(SubCategoryName) values ('Boeing1');
Update SubCategory set CategoryID =  
	(
	select Top 1 ID
	From Category
	Order By ID desc
	)
Where ID =
	(
	Select Top 1 ID
	From SubCategory
	Order by ID desc
	);

Insert Into SubCategory(SubCategoryName) values ('Boeing2');
Update SubCategory set CategoryID =  
	(
	select Top 1 ID
	From Category
	Order By ID desc
	)
Where ID =
	(
	Select Top 1 ID
	From SubCategory
	Order by ID desc
	);