--Q10
SET IDENTITY_INSERT Category ON
Insert Into Category(ID,CategoryName) values (5, 'Food');
SET IDENTITY_INSERT Category OFF
-----------------------------------------------------------------------------
SET IDENTITY_INSERT SubCategory ON
Insert Into SubCategory(ID,SubCategoryName,CategoryID) values (62,'Olive',4);
SET IDENTITY_INSERT SubCategory OFF
