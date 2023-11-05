--Q3 
Select c.* --c.*
From Customer c join Orders o
On c.ID = o.CustomerID
Where CustomerName like 'B%' and  month(o.orderdate) = 12 and year(o.orderdate) = 2017
Order By c.Segment desc, c.CustomerName asc
