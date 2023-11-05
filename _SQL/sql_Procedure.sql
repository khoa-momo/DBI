
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


Create Proc Show_Customers
As
Select * From Customer

Exec Show_Customers

Alter Proc Show_Customers
As
Select * From Customer
Where ID = 2

Drop Proc Show_Customers

Create Procedure Cal_Square @num int = 0
As
	Begin
		Return (@num * @num);
	End 

Declare @square int;
Execute @square = Cal_Square 100;
Print @square;

Create Proc total_Customers
	@statename varchar(40), @no_of_cus int Output
As
	Select @no_of_cus = Count(*) From Customer
	Where state = @statename 


Declare @tot_cus int 
Execute total_Customers 'Hanoi', @tot_cus Output
Print @tot_cus


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









