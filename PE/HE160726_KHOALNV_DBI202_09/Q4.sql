--Q4 
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
Order by [TotalAmount] desc
