--Q1
Create Table Branches( 
	branchName nvarchar(50) Primary key,
	[address] nvarchar(100)
)

Create Table Employees(
	empID varchar(30) Primary key,
	Name nvarchar(50),
	Email nvarchar(200),
	branchName nvarchar(50) foreign key references Branches(branchName)
)

Create Table Jobs(
	jobID int Primary key,
	title nvarchar(100),
	[description] text,
	branchName nvarchar(50) foreign key references Branches(branchName)
)
