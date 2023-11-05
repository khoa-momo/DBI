
Select OrderID, CustomerID, EmployeeID, OrderDate, RequiredDate
From Orders
Where OrderDate In (Select Max(OrderDate) 
					From Orders)

Select OrderID, CustomerID, EmployeeID, OrderDate, RequiredDate
From Orders O1
Where OrderDate = (Select Max(OrderDate) 
				   From Orders O2
				   Where O2.EmployeeID = O1.EmployeeID);

Select ProductName, Max(SumQuantity)
From (Select P.ProductName ProductName, Sum(OD.Quantity) SumQuantity
	  From [Order Details] OD
	  Left Join Products P On P.ProductID = OD.ProductID
	  Group By OD.ProductID) Res;


Select OrderID, CustomerID, EmployeeID, OrderDate, Require
From Orders
Where OrderDate In (Select Max(OrderDate)
					From Orders)