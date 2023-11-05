Use Northwind
GO

---Trigger---

/* Triggers

 
*/ 

--Delete Trigger
Create Trigger NoEmployeeDelete On Employees
Instead Of Delete
As
Begin 
	Declare @Count Int
	Set @Count = @@ROWCOUNT
	If @Count = 0
	Return 
	Set NOCOUNT ON 
	Begin
		Raiserror ('Employee can not be deleted. They can only be marked as not current.', 10,1);
		If @@Trancount > 0
		Begin 
		RollBack Transaction
		END
	END
END

Delete From Employees Where Lastname = 'Davolio';



--Insert Trigger
Create Trigger RegionLength On Region
After Insert As
Begin 
	Declare @RegionDescription nvarchar(70)
	Select @RegionDescription = RegionDescription
	From inserted

	If LEN(@RegionDescription) > 10
	Raiserror ('RegionDescription > 10', 10,1);
	Begin
	RollBack Transaction
	End
End

Insert Into Region Values(100,'HCM');

Drop Trigger RegionLength


--Insert Trigger
Create Trigger NoNewTable On Database
For Create_Table
As
Print 'No new table are allowed'
RollBack;

Create Table mytable(
	col1 varchar(50),
	col2 varchar(50)
);
drop table mytable;

Disable Trigger NoNewTable on database;


---Procedures---

/* Procedures


  





*/
 


Create Table Customer(
	ID int Not Null Primary Key,
	LastName varchar(50),
	FirstName varchar(100),
	Sex bit
);

Alter Table Customer
Add state varchar(100);
insert into Customer values (1, 'Bill', 'Tran', 1);
insert into Customer values (2, 'Lisa', 'Nguyen', 0);
insert into Customer values (3, 'Peter', 'Luong', 1);
insert into Customer values (4, 'MJ', 'Le', 1, 'Hanoi');


Update Customer
Set state = 'DaNang'
Where ID = 3;


--- Procedure 1 ---
Create Proc Show_Customers
As
Select * From Customer

Exec Show_Customers


--- Procedure 2 ---
Alter Proc Show_Customers
As
Select * From Customer
Where ID = 2
--- Procedure 3 ---
Drop Proc Show_Customers

--------------------------------------------------------------------------------------------
--- Procedure 4 ---
Create Procedure Cal_Square 
@num int = 0
As
Begin
	Return (@num * @num);
End 

Declare @square int;
Execute @square = Cal_Square 100;
Print @square;


--- Procedure 5 ---
Create Proc total_Customers
@statename varchar(40), @no_of_cus int Output
As
Select @no_of_cus = Count(*) From Customer
Where state = @statename 


Declare @tot_cus int 
Execute total_Customers 'Hanoi', @tot_cus Output
Print @tot_cus

--- Procedure 6 ---
Create Procedure Divide_Square @num1 int, @num2 int
As
Begin
	Return (@num1 / @num2);
End 

Begin Try
Declare @divide int;
Exec @divide = Divide_Square 100, 10;
Print @divide
End Try

Begin Catch
	Select ERROR_MESSAGE() As ErrorMess
End Catch




