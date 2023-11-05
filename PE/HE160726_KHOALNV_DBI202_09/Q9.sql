--Q9
Create Trigger InsertSubCategory On SubCategory
After Insert As
Begin
	/*Set NOCOUNT ON
	Insert Into SubCategory(
	ID,
	SubCategoryName,
	CategoryID
	)*/
	--------
	Select Top 1 sc.SubCategoryName, c.CategoryName
	From SubCategory sc join Category c
	On sc.CategoryID = c.ID
	Order by sc.ID desc
End