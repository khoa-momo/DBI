--Q3
Select ProductID, Name, Price, SellStartDate
From Product
Where Price < 100 and year(SellStartDate) = 2001
Order By Name