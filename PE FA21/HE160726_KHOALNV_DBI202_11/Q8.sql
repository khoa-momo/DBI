--Q8 
Create Proc proc_roduct_subcategory
@subcategoryID int, @NumberOfProducts int Output
As
Begin
Select distinct count(p.ProductID) as[NumberOfProducts]
From ProductSubcategory ps join Product p
On ps.SubcategoryID = p.SubcategoryID
Where ps.SubcategoryID = @subcategoryID
Group By ps.SubcategoryID
End;

 
