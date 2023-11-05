--NorthWind database--
-- Ex1,2 --
--Write a SELECT query to display Full name of all employees in lower-case as following:
--Write a SELECT query to display Full name of all employees in upper-case as following:
Select Upper(LastName + ' ' + FirstName) "Full name", TitleOfCourtesy 
From Employees
---------------------------------------------------------------------
Select Lower(LastName + ' ' + FirstName) "Full name", TitleOfCourtesy 
From Employees

-- Ex3 --
--Write a SELECT query to display all employees that are from United States as following:
Select * 
From Employees 
Where Country = 'USA'

-- Ex4 --
--Write a SELECT query to display all customers that are from UK as following:
Select * 
From Employees 
Where Country = 'UK'

-- Ex5 --
--Write a SELECT query to display all customers that are from Mexico as following:
Select * 
From Employees 
Where Country = 'Mexico'

-- Ex6 --
--Write a SELECT query to display all customers that are from Sweden as following:
Select * 
From Employees 
Where Country = 'Sweden'

-- Ex7 --
--In Products table, values of UnitsInStock tell you the total units in the inventory of every
--product. Write a SELECT query to display product id, product name, unit price of all products total units in the inventory is between 5 and 10 as following:
Select ProductID, ProductName, UnitPrice, UnitsInStock 
From Products 
Where UnitsInStock between 5 And 10

-- Ex8 --
--In Products table, the value of UnitsOnOrder tells you the total ordered units for every product.Write a SELECT query to display product id, product name, unit price, re-order level… of all  
--products that have total ordered units between 60 and 100 as following: Select ProductName, UnitPrice, ReorderLevel, UnitsOnOrder From Products Where UnitsOnOrder between 60 And 100
Select ProductID, ProductName, UnitPrice, ReorderLevel, UnitsOnOrder 
From Products 
Where UnitsOnOrder between 60 And 100

-- Ex9 --
--Write a SELECT query to display total orders of every employee in 1996 as following:
Select * From Orders
Order by EmployeeID
Select * From Employees
-------
Select o.EmployeeID, e.LastName, e.FirstName, e.Title, year(o.OrderDate) as [year], count(OrderID) as [Total Orders]
From Orders o join Employees e
On o.EmployeeID = e.EmployeeID
Where year(o.OrderDate) = 1996
Group By o.EmployeeID, e.LastName, e.FirstName, e.Title, year(o.OrderDate)
--Having year(o.OrderDate) = 1996

-- Ex10 --
--Write a SELECT query to display total orders of every employee in 1997 as following:
Select o.EmployeeID, e.LastName, e.FirstName, e.Title, year(o.OrderDate) as [year], count(OrderID) as [Total Orders]
From Orders o join Employees e
On o.EmployeeID = e.EmployeeID
Where year(o.OrderDate) = 1997
Group By o.EmployeeID, e.LastName, e.FirstName, e.Title, year(o.OrderDate) 

-- Ex11 --
--Write a SELECT query to display total orders of every employee in 1998 as following:
Select o.EmployeeID, e.LastName, e.FirstName, e.City, e.Country, count(OrderID) as [Total Orders]
From Orders o join Employees e
On o.EmployeeID = e.EmployeeID
Where year(o.OrderDate) = 1998
Group By o.EmployeeID, e.LastName, e.FirstName, e.City, e.Country 

-- Ex12 --
--Write a SELECT query to display total orders of every employee from 1/1/1998 to 31/7/1998 as following: 
Select o.EmployeeID, e.LastName, e.FirstName, e.HireDate, count(OrderID) as [Total Orders]
From Orders o join Employees e
On o.EmployeeID = e.EmployeeID
Where year(o.OrderDate) = 1998 and month(o.OrderDate) between 1 and 7
Group By o.EmployeeID, e.LastName, e.FirstName, e.HireDate

-- Ex13 --
--Write a SELECT query to display total orders of every employee from 1/1/1997 to 30/6/1997 as following:
Select o.EmployeeID, e.LastName, e.FirstName, e.HireDate, e.HomePhone, count(OrderID) as [Total Orders]
From Orders o join Employees e
On o.EmployeeID = e.EmployeeID
Where year(o.OrderDate) = 1997 and month(o.OrderDate) between 1 and 6
Group By o.EmployeeID, e.LastName, e.FirstName, e.HireDate, e.HomePhone

-- Ex14 --
--Write a SELECT query to display total orders of every employee from 1/1/1997 to 30/6/1997 as following:
Select o.EmployeeID, e.LastName, e.FirstName, e.BirthDate, e.HomePhone, count(OrderID) as [Total Orders]
From Orders o join Employees e
On o.EmployeeID = e.EmployeeID
Where year(o.OrderDate) = 1997 and month(o.OrderDate) between 1 and 6
Group By o.EmployeeID, e.LastName, e.FirstName, e.BirthDate, e.HomePhone

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Ex15 --
--An order will be taxed 10% if its freight cost is larger than or equal to 100$.Otherwise, an order will be taxed 5% if its freight cost is smaller than 100$.
--Write a SELECT query to show the freight with taxes of orders placed between 1/8/1996 and 5/8/1996 as following:
Select * From Orders
--
Alter Table Orders
	add Tax as (Case
					when Freight > 100 then 10
					when Freight < 100 then 5
					else 'Invalid'
				End);
--
Select OrderID, Day(OrderDate) as [OrderDay], Month(OrderDate) as [OrderMonth], Year(OrderDate) as [OrderYear], Freight, Tax, Tax/100 as [Freight with Tax]
From Orders
Where Year(OrderDate) = 1996 and Month(OrderDate) = 8 and Day(OrderDate) between 1 and 5   

-- Ex16 --
--Write a SELECT query to display the full name, title of courtesy and sex for all such that:
-- If title of courtesy is ‘Mr.’ then sex is set to ‘Male’
-- If title of courtesy is ‘Ms.’ or ‘Mrs.’ then sex is set to ‘Female’
Select * From Employees
--
Alter Table Employees
	add Sex as (Case
					when TitleofCourtesy = 'Dr.' then 'Male'
					when TitleofCourtesy = 'Mr.' then 'Male'
					when TitleofCourtesy = 'Ms.' then 'Female'
					when TitleofCourtesy = 'Mrs.' then 'Female'
				End);
--
ALTER TABLE Employees
DROP COLUMN Sex;
--
Select  LastName+' '+FirstName as [Full Name], Sex
From Employees

-- Ex17 --
-- Write a SELECT query to display the full name, title of courtesy and sex for all employeessuch that:
-- If title of courtesy is ‘Mr.’ or ‘Dr.’ then sex is set to ‘M’
-- If title of courtesy is ‘Ms.’ or ‘Mrs.’ then sex is set to ‘F’


-- Ex18 --
--Write a SELECT query to display the full name, title of courtesy and sex for all employees such that:
-- If title of courtesy is ‘Mr.’ then sex is set to ‘Male’
-- If title of courtesy is ‘Ms.’ or ‘Mrs.’ then sex is set to ‘Female’
-- If title of courtesy is not ‘Mr.’ and not ‘Mrs.’ and not ‘Ms.’ then sex is set to ‘Unknown’ 
ALTER TABLE Employees
DROP COLUMN Sex;
--
Alter Table Employees
	add Sex as (Case
					when TitleofCourtesy = 'Mr.' then 'Male'
					when TitleofCourtesy = 'Ms.' then 'Female'
					when TitleofCourtesy = 'Mrs.' then 'Female'
					else 'Unknown'
				End);
--
Select  LastName+' '+FirstName as [Full Name], Sex
From Employees


-- Ex19 --
--Write a SELECT query to display the full name, title of courtesy and sex for all employees such that:
-- If title of courtesy is ‘Mr.’ then sex is set to 1
-- If title of courtesy is ‘Ms.’ or ‘Mrs.’ then sex is set to 0
-- If title of courtesy is not ‘Mr.’ and not ‘Mrs.’ and not ‘Ms.’ then sex is set to 2
ALTER TABLE Employees
DROP COLUMN Sex;
--
Alter Table Employees
	add Sex as (Case
					when TitleofCourtesy = 'Mr.' then 1
					when TitleofCourtesy = 'Ms.' then 0
					when TitleofCourtesy = 'Mrs.' then 0
					else 2
				End);
--
Select  LastName+' '+FirstName as [Full Name], Sex
From Employees
Order by Sex

-- Ex20 --
--Write a SELECT query to display the full name, title of courtesy and sex for all employees such that:
--If title of courtesy is ‘Mr.’ then sex is set to ‘M’
--If title of courtesy is ‘Ms.’ or ‘Mrs.’ then sex is set to ‘F’
--If title of courtesy is not ‘Mr.’ and not ‘Mrs.’ and ‘Ms.’ then sex is set to ‘N/A’



-----------------------------------------------------------------------------------------------------------------------------------------------
-- Ex21 --
--Write a query to determine the revenues for all products from 1/7/1996 to 5/7/1996 as
--following (Revenue = Quantity * Unitprice). Note: The output must be order by category id and then product id.
Select * From Products
Select * From Categories
Select * From Orders
Select * From [Order Details]
------------------------
Select c.CategoryID, c.CategoryName, p.ProductID, p.ProductName
From Products p join Categories c
On p.CategoryID = c.CategoryID

-- Ex22 --
--Write a query to display information about 7-days late orders and their employees 
--(an order is called late if it is shipped after required date)
Select * From Orders
-------------------
Select o.EmployeeID, e.LastName, e.FirstName, o.OrderID, o.OrderDate, o.RequiredDate, o.ShippedDate
From Orders o join Employees e
On o.EmployeeID = e.EmployeeID
Where DateDiff(day, o.RequiredDate, o.ShippedDate) > 7
Order by o.EmployeeID



-- Ex23 --
--Write a query to display the names and telephone numbers of all employees and all customers satisfy the
--condition: all customers have names start with ‘W’.
Select * From Customers
Select * From Orders
-------------------  



-- Ex24 --
--Write a query to display information about the customer that placed the order with Id equal to 10643 as following:
Select c.CustomerID, c.CompanyName, c.ContactName, c.ContactTitle
From Customers c join Orders o
On c.CustomerID = o.CustomerID
Where o.OrderID = 10643

-- Ex25 --
--Write a query to display the product ids, product names and total units ordered of all products
--that satisfy: the total units ordered must be greater than or equal to 1200 units
Select * From [Order Details]
Order by ProductID
--------------------- 
Select p.ProductID, p.ProductName, Sum(od.quantity) as [Total Ordered]
From [Order Details] od join Products p
On od.ProductID = p.ProductID 
Group By p.ProductID, p.ProductName, od.ProductID
Having Sum(od.quantity) >= 1200

-- Ex26 --
--Write a query to display the product ids, product names, supplier id, category id and total units
--ordered of all products that satisfy: the total units ordered must be greater than or equal to 1400 units.
Select p.ProductID, p.ProductName, p.SupplierID, p.CategoryID, Sum(od.quantity) as [Total Ordered]
From [Order Details] od join Products p
On od.ProductID = p.ProductID 
Group By p.ProductID, p.ProductName, od.ProductID, p.SupplierID, p.CategoryID
Having Sum(od.quantity) >= 1400

-- Ex27 --
--Write a query to display the categories that have maximum total product as following:
Select * From Categories
Select * From Products
Order by CategoryID
------------------------
Select p.CategoryID, c.CategoryName, Count(p.ProductID) as [Total Products]
From Products p join Categories c
On p.CategoryID = c.CategoryID
Group by p.CategoryID, c.CategoryName, p.CategoryID
Having Count(p.ProductID) =
	(
	Select Max([Total Products])
	From
		(
		Select p.CategoryID, c.CategoryName, Count(p.ProductID) as [Total Products]
		From Products p join Categories c
		On p.CategoryID = c.CategoryID
		Group by p.CategoryID, c.CategoryName, p.CategoryID
		)as T
	);


-- Ex28 --
--Write a query to display categories that have minimum product as following
Select p.CategoryID, c.CategoryName, Count(p.ProductID) as [Total Products]
From Products p join Categories c
On p.CategoryID = c.CategoryID
Group by p.CategoryID, c.CategoryName, p.CategoryID
Having Count(p.ProductID) =
	(
	Select Min([Total Products])
	From
		(
		Select p.CategoryID, c.CategoryName, Count(p.ProductID) as [Total Products]
		From Products p join Categories c
		On p.CategoryID = c.CategoryID
		Group by p.CategoryID, c.CategoryName, p.CategoryID
		)as T
	);


-- Ex29 --
--Write a query to display the total record in Customer and Employees tables:
Select * From Customers
Select * From Employees
Select * From Orders
-----------------------
Select Count(e.EmployeeID) as [total]
From Employees e join Orders o
On e.EmployeeID = o.EmployeeID join Customers c
On o.CustomerID = c.CustomerID
Group by e.EmployeeID;
--
With t as
(
Select Count(EmployeeID) as [total1]
From Employees 
Group by EmployeeID

Union  

Select Count(CustomerID) as [total2]
From Customers 
Group by CustomerID
)

Select Sum([total1]) + Sum([total2]) as [total records]
From t



-- Ex30 --
--Write a query to display information about employees who have minimum total orders as following:
Select e.EmployeeID, e.LastName, e.FirstName, e.Title, count(o.OrderID) as [total orders]
From Employees e join Orders o
On e.EmployeeID = o.EmployeeID
Group by e.EmployeeID, e.LastName, e.FirstName, e.Title, o.EmployeeID
Having count(o.OrderID) =
	(
	Select Min([total orders])
	From
		(
		Select e.EmployeeID, e.LastName, e.FirstName, e.Title, count(o.OrderID) as [total orders]
		From Employees e join Orders o
		On e.EmployeeID = o.EmployeeID
		Group by e.EmployeeID, e.LastName, e.FirstName, e.Title, o.EmployeeID
		)as T
	);


-- Ex31 --
--Write a query to display information about employees who have maximum total orders following:
Select e.EmployeeID, e.LastName, e.FirstName, e.Title, count(o.OrderID) as [total orders]
From Employees e join Orders o
On e.EmployeeID = o.EmployeeID
Group by e.EmployeeID, e.LastName, e.FirstName, e.Title, o.EmployeeID
Having count(o.OrderID) =
	(
	Select Max([total orders])
	From
		(
		Select e.EmployeeID, e.LastName, e.FirstName, e.Title, count(o.OrderID) as [total orders]
		From Employees e join Orders o
		On e.EmployeeID = o.EmployeeID
		Group by e.EmployeeID, e.LastName, e.FirstName, e.Title, o.EmployeeID
		)as T
	);

-- Ex32 --
--In Products table, the value of UnitsInStock tells you the total unit in the inventory for product. 
--Write a query to display information about products that have maximum total unit in inventory as following:
Select ProductID, ProductName, SupplierID, CategoryID, UnitsInStock
From Products 
Where UnitsInStock =
	(
	Select Max(UnitsInStock)
	From Products
	)

-- Ex33 --
--In Products table, the value of UnitsInStock tells you the total unit in the inventory for product. 
--Write a query to display information about products that have Minimum total unit in inventory as following:
Select ProductID, ProductName, SupplierID, CategoryID, UnitsInStock
From Products 
Where UnitsInStock =
	(
	Select Min(UnitsInStock)
	From Products
	)

-- Ex34 --
--In Products table, the value of UnitsOnOrder tells you the total ordered unit for every product.
--Write a query to display information about products that have maximum total ordered unit  following:
Select ProductID, ProductName, SupplierID, CategoryID, UnitsOnOrder
From Products 
Where UnitsOnOrder =
	(
	Select Max(UnitsOnOrder)
	From Products
	)

-- Ex35 --
--In Products table, the value of ReOrderLevel tells you the re-order level for every product.
--Write a query to display information about products that have maximum re-order level following:
Select ProductID, ProductName, SupplierID, CategoryID, ReorderLevel
From Products 
Where ReorderLevel =
	(
	Select Max(ReorderLevel)
	From Products
	)

-- Ex36 --
--Write a query to display the information about employees who have maximum total delayed as following:


-- Ex37 --
--Write a query to display the information about employees who have at least one delayed-order
--and have minimum total delayed-orders as following:


-- Ex38 --
--Write a query to display product ids and product names of all products 
--that have total orderedunits in three-highest level (top 3 to top 1) as following:
With T as
	(
	Select Top 3 p.ProductID, p.ProductName, Sum(od.quantity) as [Total Ordered]
	From [Order Details] od join Products p
	On od.ProductID = p.ProductID 
	Group By p.ProductID, p.ProductName, od.ProductID
	Order By [Total Ordered] desc
	)
Select * From T
Order by [Total Ordered]

-- Ex39 --
--Write a query to display product ids and product names of all products 
--that have total orderedunits in five-highest level (top 5 to top 1) as following:
With T as
	(
	Select Top 5 p.ProductID, p.ProductName, Sum(od.quantity) as [Total Ordered]
	From [Order Details] od join Products p
	On od.ProductID = p.ProductID 
	Group By p.ProductID, p.ProductName, od.ProductID
	Order By [Total Ordered] desc
	)
Select * From T
Order by [Total Ordered]


------------------------------------------------------------ Simple query ------------------------------------------------------------
Select * From Employees

--Cau 1--
--Danh sách các employees. Thông tin bao gồm EmployeeId, EmployeeName, Phone, Age.Trong đó EmployeeName được ghép từ LastName và FirstName; Age là tuổi được tính
--từ năm hiện hành (GetDate()) và năm của Birthdate.
Select EmployeeID, (LastName + ' ' + FirstName) as [EmployeeName], HomePhone, DATEPART(year, GETDATE()) - DATEPART(year, BirthDate) as [Age] 
From Employees

--Cau 2--
--Danh sách employees có năm sinh <=1960
Select * 
From Employees 
Where DATEPART(year, BirthDate) <= 1960

--Cau 3--
--Danh sách các products có từ ‘Boxes’ trong cột QuantityPerUnit
Select * 
From Products
Where QuantityPerUnit like '%Boxes%'

--Cau 4--
--Danh sách các products có Unitprice lớn hớn 10 và nhỏ hơn 15. 
Select * 
From Products
Where UnitPrice between 10 and 15

--Cau 5--
--Danh sách các orders có OrderDate được lập trong tháng 9 năm 1996. 
Select * 
From Orders
Where DATEPART(year, OrderDate) = 1996 and DATEPART(month, OrderDate) = 9

--Cau 6--
--Danh sách các products ứng với tiền tồn vốn. Thông tin bao gồm ProductId, ProductName, Unitprice, UnitsInStock, TotalAccount. Trong đó TotalAccount=
--UnitsInStock * Unitprice.
Select * 
From Products
Select ProductId, ProductName, Unitprice, UnitsInStock, UnitsInStock*Unitprice as[TotalAccount] From Products

--Cau 7--
--Danh sách 5 customers có city bắt đầu ‘M’.
Select Top 5 * 
From Customers
Where City like 'M%'

--Cau 8--
--Danh sách 2 employees có tuổi lớn nhất. Thông tin bao gồm EmployeeID, EmployeeName, Age. Trong đó, EmployeeName được ghép từ LastName và FirstName;
--Age là năm hiện hành từ cho năm sinh.
Select * From Employees 
-----------------------
Select Top 2 EmployeeID, (LastName + ' ' + FirstName) as [EmployeeName], DATEPART(year, GETDATE()) - DATEPART(year, BirthDate) as [Age] 
From Employees
Order by Age DESC

--Cau 9--
--Danh sách các products đã từng có khách hàng đặt hàng (tức là ProductId có trong Order Details). Thông tin bao gồm ProductId, ProductName, Unitprice.
Select * From Products
Select * From [Order Details]	
Order by ProductID					
-----------------------------
Select distinct Products.ProductID, Products.ProductName, Products.Unitprice
From Products Inner join [Order Details]
ON Products.ProductID = [Order Details].ProductID;

--Cau 10--
--Cho biết những Customers chưa từng lập hóa đơn
Select * From Customers
Select distinct * From Orders Order by CustomerID
--C1

--C2
Select * From Customers
Except
Select distinct c.CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax
From Customers c join Orders o
ON c.CustomerID = o.CustomerID;

												
--Cau 11--
--Các customer không lập hóa đơn trong tháng 7/1997
Select * From Customers
Except
Select distinct Customers.CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax
From Customers
Inner join Orders
ON Customers.CustomerID = Orders.CustomerID
Where DATEPART(year, OrderDate) = 1997 and DATEPART(month, OrderDate) = 7 

--Cau 12--
--Các customer có lập hóa đơn trong 15 ngày đầu tiên của 7/1997
Select * From Orders Order by CustomerID
--
Select distinct Customers.CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax
From Customers
Inner join Orders
ON Customers.CustomerID = Orders.CustomerID
Where DATEPART(year, OrderDate) = 1997 and DATEPART(month, OrderDate) = 7  and DATEPART(day, OrderDate) between 1 and 15;

-----------
Select * -- distinct Customers.CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax
From Customers
Inner join Orders
ON Customers.CustomerID = Orders.CustomerID
Where DATEPART(year, OrderDate) = 1997 and DATEPART(month, OrderDate) = 7  and DATEPART(day, OrderDate) between 1 and 15 and Customers.CustomerID Like '%BSBEV%'



--Cau 13--
--Danh sách các product, thông tin bao gồm: Productname, CategoryName, Unitprice.
Select * From Products	

Select Productname, CategoryName, Unitprice 
From Products
Inner join Categories
ON Products.CategoryID = Categories.CategoryID;			

--Cau 14--
--Liệt kê danh sách các City có Customers hoặc Employee (dùng Union)
Select City From Customers
Union	
Select City From Employees

--Cau 15--
--Liệt kê danh sách các Country có Customers hoặc Employee (dùng Union)
Select Country From Customers
Union	
Select Country From Employees

--Cau 16--
--Hợp danh sách các Customer và Employee lại với nhau. Thông tin gồm CodeID, Name, Address, Phone. Trong đó CodeID là CustomerID/EmployeeID, Name là
--Companyname/LastName + FirstName, Phone là Homephone
Select * From Customers
Select * From Employees
--
Select CustomerID as [CodeID], Companyname as [Name], Address, Phone From Customers
Union
Select EmployeeID as [CodeID], (LastName + ' ' + FirstName) as [Name], Address, HomePhone as [Phone] From Employees
	
--			
Select Companyname as [Name], Address, Phone From Customers
Union
Select (LastName + ' ' + FirstName) as [Name], Address, HomePhone as [Phone] From Employees
																				