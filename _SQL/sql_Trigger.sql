Use Northwind
GO

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

Create Trigger RegionLength
On Region
After Insert
As
Begin
Declare @RegionDescription nvarchar(70)
Select @RegionDescription = RegionDescription
From inserted
If LEN(@RegionDescription) < 7
Begin
RollBack Transaction
End
End

Insert Into Region Values(5,'Hanoi');

Drop Trigger RegionLength

Create Trigger NoNewTable
On Database
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

