
Create Table Employees(
	emp_no int Primary key, 
	birth_date Date,
	firstname varchar(14),
	lastname varchar(16),
	gender varchar(10),
	hire_date Date
)
Alter Table Employees
Add Constraint checkGender check(gender = 'Male' or gender = 'Female'); 

Create Table Departments(
	dept_no char(4) Primary key,
	Dept_Name varchar(40), 
)

Create Table Salaries(
	emp_no int foreign key references Employees(emp_no),
	salary int,
	from_date Date,
	to_date Date
)

Create Table Dept_emp(
	emp_no int foreign key references Employees(emp_no),
	dept_no char(4) foreign key references Departments(dept_no),
	from_date Date,
	to_date Date
)

Create Table Dept_manager(
	emp_no int foreign key references Employees(emp_no),
	dept_no char(4) foreign key references Departments(dept_no),
	from_date Date,
	to_date Date
)

Create Table Titles(
	emp_no int foreign key references Employees(emp_no),
	title varchar(50),
	from_date Date,
	to_date Date
) 

--Employee table
Insert into Employees values (1, '1998-10-10', 'Luong Van', 'A', 'Female', '2021-10-30'); 
Insert into Employees values (2, '2001-11-9', 'Luong Van', 'B', 'Male', '2021-12-1'); 
Insert into Employees values (3, '2002-6-19', 'Luong Van', 'C', 'Male', '2019-11-9'); 
Insert into Employees values (4, '2001-7-18', 'Luong Van', 'D', 'Male', '2018-10-12'); 
Insert into Employees values (5, '2002-8-21', 'Luong Van', 'A', 'Female', '2023-11-17'); 
Insert into Employees values (6, '1999-11-6', 'Nguyen Van', 'F', 'Female', '2024-10-18'); 
Insert into Employees values (7, '2002-12-4', 'Nguyen Van', 'G', 'Male', '2025-09-21'); 
Insert into Employees values (8, '2001-1-8', 'Nguyen Van', 'H', 'Female', '2024-03-11'); 
Insert into Employees values (9, '2002-2-21', 'Nguyen Van', 'J', 'Male', '2021-04-11'); 
Insert into Employees values (10, '2000-5-21', 'Nguyen Van', 'F', 'Female', '2025-11-10'); 
Insert into Employees values (11, '1997-5-29', 'Tran Van', 'M', 'Male', '2026-9-11');  
Insert into Employees values (12, '2003-5-12', 'Tran Van', 'N', 'Male', '2027-4-12');  
Insert into Employees values (13, '2004-5-3', 'Tran Van', 'O', 'Female', '2026-3-5');  
Insert into Employees values (14, '2002-5-19', 'Tran Van', 'P', 'Male', '2025-12-6');  
Insert into Employees values (15, '2005-5-7', 'Tran Van', 'Q', 'Female', '2027-1-7');  
Insert into Employees values (16, '2005-5-7', 'Tran Van', 'Q', 'Female', '2027-1-7');  

Insert into Employees values (17, '1997-5-29', 'Tran Van', 'X', 'Male', '2026-9-11');  
Insert into Employees values (18, '1997-5-29', 'Tran Van', 'Y', 'Male', '2026-9-11');  
Insert into Employees values (19, '1997-5-29', 'Tran Van', 'Z', 'Male', '2026-9-11');  
Insert into Employees values (20, '1997-5-29', 'Tran Van', 'I', 'Male', '2026-9-11');  
Insert into Employees values (21, '1997-5-29', 'Tran Van', 'U', 'Male', '2026-9-11');  
Insert into Employees values (22, '1997-5-29', 'Tran Van', 'J', 'Male', '2026-9-11');
   
Insert into Employees values (23, '1997-5-29', 'Tran Van', 'Q', 'Male', '2026-9-11');  

--Departments table
Insert into Departments values (1, 'Sales'); 
Insert into Departments values (2, 'Finance');  
Insert into Departments values (3, 'Marketing');  
Insert into Departments values (4, 'Production');  
Insert into Departments values (5, 'Management');  
Insert into Departments values (6, 'Security');  
Insert into Departments values (7, 'Customer');   
Insert into Departments values (8, 'Accounting');  
Insert into Departments values (9, 'Insurance');  
Insert into Departments values (10, 'Media');  

--Salaries table
Insert into Salaries values (1, 98000, '2030-10-10', '2031-10-10');  
Insert into Salaries values (2, 80000, '2030-10-10', '2031-10-10');  
Insert into Salaries values (3, 70000, '2030-10-10', '2031-10-10');  
Insert into Salaries values (4, 84000, '2030-10-10', '2031-10-10');  
Insert into Salaries values (5, 81000, '2030-10-10', '2031-10-10');  
Insert into Salaries values (6, 86000, '2030-10-10', '2031-10-10');  
Insert into Salaries values (7, 96000, '2030-10-10', '2031-10-10');  
Insert into Salaries values (8, 85000, '2030-10-10', '2031-10-10');  
Insert into Salaries values (9, 67000, '2030-10-10', '2031-10-10');  
Insert into Salaries values (10, 63000, '2030-10-10', '2031-10-10');   
Insert into Salaries values (11, 99000, '2030-10-10', '2031-10-10');  
Insert into Salaries values (12, 93000, '2030-10-10', '2031-10-10');  
Insert into Salaries values (13, 83000, '2030-10-10', '2031-10-10');  
Insert into Salaries values (14, 78000, '2030-10-10', '2031-10-10');  
Insert into Salaries values (15, 87000, '2030-10-10', '2031-10-10');  
Insert into Salaries values (16, 100000, '2030-10-10', '2031-10-10');  

Insert into Salaries values (23, 100000, '2002-10-10', '2003-10-10');

--Titles 
Insert into Titles values (1, 'manager', '2021-10-30', '2041-10-11'); 
Insert into Titles values (2, 'employee', '2021-12-1', '2042-10-11'); 
Insert into Titles values (3, 'employee', '2019-11-9', '2039-10-11'); 
Insert into Titles values (4, 'employee', '2018-10-12', '2041-10-11'); 
Insert into Titles values (5, 'employee', '2023-11-17', '2031-10-11'); 
Insert into Titles values (6, 'manager', '2024-10-18', '2042-10-11'); 
Insert into Titles values (7, 'employee', '2025-09-21', '2043-10-11'); 
Insert into Titles values (8, 'employee', '2024-03-11', '2046-10-11'); 
Insert into Titles values (9, 'employee', '2021-04-11', '2044-10-11'); 
Insert into Titles values (10, 'employee', '2025-11-10', '2035-10-11');  
Insert into Titles values (11, 'manager', '2026-9-11', '2041-10-11');  
Insert into Titles values (12, 'employee', '2027-4-12', '2046-10-11');  
Insert into Titles values (13, 'employee', '2026-3-5', '2044-10-11');  
Insert into Titles values (14, 'employee', '2025-12-6', '2043-10-11');  
Insert into Titles values (15, 'employee', '2027-1-7', '2042-10-11');  

--Dept_emp table 
Insert into Dept_emp values (2, 1, '2021-12-1', '2042-10-11'); 
Insert into Dept_emp values (3, 1, '2019-11-9', '2039-10-11'); 
Insert into Dept_emp values (4, 1, '2018-10-12', '2041-10-11'); 
Insert into Dept_emp values (5, 1, '2023-11-17', '2031-10-11');  
Insert into Dept_emp values (7, 2, '2025-09-11', '2040-10-11'); 
Insert into Dept_emp values (8, 2, '2017-03-11', '2040-10-11'); 
Insert into Dept_emp values (9, 2, '2011-04-11', '2040-10-11'); 
Insert into Dept_emp values (10, 2, '2001-10-10', '2040-10-11');    
Insert into Dept_emp values (12, 3, '2027-4-12', '2046-10-11');  
Insert into Dept_emp values (13, 3, '2026-3-5', '2044-10-11');  
Insert into Dept_emp values (14, 3, '2025-12-6', '2043-10-11');  
Insert into Dept_emp values (15, 3, '2027-1-7', '2042-10-11');  

--Dept_manager
Insert into Dept_manager values (1, 1, '2021-10-30', '2041-10-11'); 
Insert into Dept_manager values (6, 2, '2024-10-18', '2042-10-11'); 
Insert into Dept_manager values (16, 3, '2026-9-11', '2041-10-11');  
Insert into Dept_manager values (17, 4, '2026-9-11', '2041-10-11');  
Insert into Dept_manager values (18, 5, '2026-9-11', '2041-10-11');  
Insert into Dept_manager values (19, 6, '2026-9-11', '2041-10-11');  
Insert into Dept_manager values (20, 7, '2026-9-11', '2041-10-11');  
Insert into Dept_manager values (21, 8, '2026-9-11', '2041-10-11');  
Insert into Dept_manager values (22, 9, '2026-9-11', '2041-10-11');  
Insert into Dept_manager values (23, 10, '2026-9-11', '2041-10-11');  

 

--SQL
--Q1
Select max(Salary) as [MaxSalary]
From Salaries

 
--Q2
Select emp_no, count(*) as [PaidTimes]
From Salaries
Group by emp_no;


--Q3
--Find employees that were paid more than 15 times
Select e.*, count(*) as [PaidTimes]
From Salaries s join Employees e
On s.emp_no = e.emp_no
Group by e.emp_no, e.birth_date, e.firstname, e.lastname, e.gender, e.hire_date, e.emp_no
Having count(*) >= 1;


--Q4
--How many times were employees paid 20% better salaries than the average?
Select e.emp_no, s.salary
From Employees e join Salaries s
On e.emp_no = s.emp_no
Where s.salary >= 
	(
	Select Avg(salary)*1.2 
	From Salaries
	)

--Q5
--Who work in the “Marketing” department?

Select e.firstname+' '+e.lastname as [FullName]
From Employees e  
Where Employees.emp_no in (
	select emp_no
	from Dept_emp join Departments on Dept_emp.dept_no
)


Select e.firstname+' '+e.lastname as [FullName]
From Employees e join Dept_emp de
On e.emp_no = de.emp_no join Departments d
On de.dept_no = d.dept_no
Where d.Dept_Name = 'Marketing'


--Q6
--Who have been already paid in only 2002?
Select e.firstname, e.lastname
From Employees e inner join Salaries s
On e.emp_no = s.emp_no
Where year(s.from_date) = 2002 

--Q7
--Find all employees who have never been paid
Select * 
From Employees  e
Where emp_no not in (
	Select emp_no from Salaries
)

--Q8
--How many times were all employees named “Facello” paid in total?

With t as(
	Select s.emp_no, e.lastname, Count(Salary) as PaidTime
	From Salaries s join Employees e
	On s.emp_no = e.emp_no
	Where e.lastname = 'A'
	Group by s.emp_no, e.lastname
) 
Select Sum(PaidTime) as TotalPaidTime
From t  