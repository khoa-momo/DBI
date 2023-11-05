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
