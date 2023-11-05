--Q6
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