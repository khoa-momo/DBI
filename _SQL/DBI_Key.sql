

Create Table Persons(
	ID int Not Null constraint pk_person_id Primary Key,
	LastName varchar(255) Not Null,
	FirstName varchar(255) Not Null,
	Age int
)

Alter Table Persons
Add Address varchar(255) Not Null;


Create Table Orders(
OrderID int Not Null Primary Key, 

)