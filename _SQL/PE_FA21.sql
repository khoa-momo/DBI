
Select * From Product
Select * From ProductCostHistory
Select * From ProductPriceHistory

Select * From ProductInventory
Select * From Location

Select * From ProductModel
Select * From ProductSubcategory



---
Select * From ProductCostHistory
Order by ProductID
Select * From ProductPriceHistory
Order by ProductID

Select pc.*, pp.*, pp.Price-pc.Cost as [Profit]
From ProductCostHistory pc inner join ProductPriceHistory pp
On pc.ProductID = pp.ProductID


Select * From Product
Order by ProductID 


Select ProductId, sum(cost) as[Total cost]
From ProductCostHistory
Group By ProductID
Order by ProductID 

Select ProductId, sum(price) as[Total price]
From ProductPriceHistory
Group By ProductID
Order by ProductID


--Q2
Select *
From ProductModel
Where Name Like 'Mountain%'


--Q3
Select ProductID, Name, Price, SellStartDate
From Product
Where Price < 100 and year(SellStartDate) = 2001
Order By Name


--Q4 
Select p.ProductID, p.Name as [ProductName], p.Color, m.ModelID, m.Name as [ModelName], pp.StartDate, pp.EndDate, pp.Price as [HistoryPrice]
From ProductModel m full join Product p
On m.ModelID = p.ModelID full join ProductPriceHistory pp
On p.ProductID = pp.ProductID
Where p.Color = 'Black' and p.Name like 'HL%' 


--Q5
Select * From ProductInventory
Order by LocationID
 

Select pin.LocationID, l.Name as [LocationName], count(pin.LocationID) as NumberOfProducts
From ProductInventory pin join Location l
On pin.LocationID = l.LocationID
Group by pin.LocationID, l.Name, pin.LocationID
Order by count(pin.LocationID) desc
 
--Q6
Select * From ProductInventory
Order by LocationID
Select * From ProductSubcategory
 

Select distinct ps.SubcategoryID, ps.Name as [SubcategoryName], ps.Category, count(p.ProductID) as[NumberOfProducts]
From ProductSubcategory ps join Product p
On ps.SubcategoryID = p.SubcategoryID
Group By ps.SubcategoryID, ps.Name, ps.Category, ps.SubcategoryID
Having count(p.ProductID) =
	 (
	 Select Min([NumberOfProducts])
	 From
		(
		Select distinct ps.SubcategoryID, ps.Name as [SubcategoryName], ps.Category, count(p.ProductID) as[NumberOfProducts]
		From ProductSubcategory ps join Product p
		On ps.SubcategoryID = p.SubcategoryID
		Group By ps.SubcategoryID, ps.Name, ps.Category, ps.SubcategoryID
		)as Table1
	 ) 



With Mytable as
	(
	Select distinct ps.SubcategoryID, ps.Name as [SubcategoryName], ps.Category, count(p.ProductID) as[NumberOfProducts]
	From ProductSubcategory ps join Product p
	On ps.SubcategoryID = p.SubcategoryID
	Group By ps.SubcategoryID, ps.Name, ps.Category, ps.SubcategoryID
	)
Select Category, Max(NumberOfProducts) as NumberOfProducts
From Mytable
Group by Category;


---
With Mytable2 as
	(
	Select distinct ps.SubcategoryID, ps.Name as [SubcategoryName], count(p.ProductID) as[NumberOfProducts]
	From ProductSubcategory ps join Product p
	On ps.SubcategoryID = p.SubcategoryID
	Group By ps.SubcategoryID, ps.Name, ps.SubcategoryID
	)
Select SubcategoryName, Max(NumberOfProducts) as NumberOfProducts
From Mytable2
Group by SubcategoryName, SubcategoryName

--------------------------------
/*
Where Mytable.NumberOfProducts = 
	(
	Select Max(Mytable.NumberOfProducts) 
	From Mytable
	)
	*/

--Q8 
Create Proc proc_roduct_subcategory
@subcategoryID int, @NumberOfProducts int Output
As
Begin
Select distinct ps.SubcategoryID, count(p.ProductID) as[NumberOfProducts]
From ProductSubcategory ps join Product p
On ps.SubcategoryID = p.SubcategoryID
Where ps.SubcategoryID = @subcategoryID
Group By ps.SubcategoryID, ps.Name, ps.Category, ps.SubcategoryID
End;

--
Drop Proc TotalAmount;

 
---

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

------------------------------------------------------------------------
Declare @t int 
Execute proc_roduct_subcategory 1, @t Output
Select @t as NumberOfProducts


--Q10
Update ProductInventory set Quantity = 2000  
Where ProductID =
	(
	Select p.ProductID
	From ProductInventory pin join Product p
	On pin.ProductID = p.ProductID join ProductModel pm
	On p.ModelID = pm.ModelID
	Where pm.ModelID = 33
	)






Create Trigger tr_delete_productinventory_location On SubCategory
After Delete As
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

--Q7