Create Table Studios(
	name VARCHAR(50) Primary Key,
	address Varchar(255)
);

Create Table Stars(
	name VARCHAR(50) Primary Key,
	address Varchar(255),
	phone INT
);

Create Table Movies(
	title VARCHAR(50) Primary Key,
	year Date,
	length INT,
	genre VARCHAR(10)
);

Drop Table Movies;

Alter Table Movies
Add description VARCHAR(255);

Alter Table Movies
Drop Column description;

Insert into studios values ('Pixar', '123 California');
Update Studios
Set name = 'Walt Disney',
	address = 'California'
Where name = 'Pixar';

