--Q6
Select p.ID as ProductID, p.ProductName, count(od.OrderID) as [NumberofOrders]
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