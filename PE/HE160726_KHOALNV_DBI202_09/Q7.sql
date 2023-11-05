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