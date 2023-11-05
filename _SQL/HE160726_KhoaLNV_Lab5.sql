 
Create Table PhongBan(
	TenPHG nvarchar(40),
	MaPHG int Primary key,
	TRGPHG nvarchar(20),
	Ng_NhanChuc date
)

Create Table NhanVien(
	HoNV nvarchar(30),
	TenLot nvarchar(30),
	TenNV nvarchar(30),
	MaNV nvarchar(20) Primary key,
	NgSinh date,
	DCHI nvarchar(200),
	GTinh nvarchar(20),
	Luong int,
	MaNQL nvarchar(20),
	MaPHG int foreign key references PhongBan(MaPHG)
)
Alter Table NhanVien
Add Constraint checkGender check(GTinh = 'Nam' or GTinh = 'Nu'); 

Create Table DiaDiemPHG(
	MaPHG int foreign key references PhongBan(MaPHG),
	DiaDiem nvarchar(50) primary key, 
)

Create Table DeAn(
	TenDA nvarchar(50), 
	MaDA int primary key,
	DDiem_DA nvarchar(50),
	MaPHG int foreign key references PhongBan(MaPHG)
)

Create Table PhanCong(
	MaNV nvarchar(20) foreign key references NhanVien(MaNV),
	MaDA int foreign key references DeAn(MaDA),
	TGian float
)

Create Table ThanNhan(
	MaNV nvarchar(20) foreign key references NhanVien(MaNV),
	TenTN nvarchar(50) primary key,
	GTinh nvarchar(10),
	NgSinh date,
	QHe nvarchar(10) 
) 

--Table PhongBan
Insert into PhongBan values ('Nghien cuu', 5, '3334455555', '1978-5-22'); 
Insert into PhongBan values ('Dieu han', 4, '987987987', '1985-1-1'); 
Insert into PhongBan values ('Quan ly', 1, '888665555', '1971-6-19');  

--Table NV
Insert into NhanVien values ('Dinh', 'Ba', 'Tien', '123456789', '1955-1-9', '731 Tran Hung Dao,Q1,TPHCM', 'Nam', 30000, '333445555', 5);  
Insert into NhanVien values ('Nguyen', 'Thanh', 'Tung', '333445555', '1945-8-12', '638 Nguyen Van Cu,Q5,TPHCM', 'Nam', 40000, '888665555', 5);  
Insert into NhanVien values ('Bui', 'Thuy', 'Vu', '999887777', '1958-7-19', '332 Nguyen Thai Ngoc,Q1,TPHCM', 'Nam', 25000, '987654321', 5);  
Insert into NhanVien values ('Le', 'Thi', 'Nhan', '987654321', '1931-6-20', '291 Ho Van Que,QPN,TPHCM', 'Nu', 43000, '888665555', 4);  
Insert into NhanVien values ('Nguyen', 'Manh', 'Nhan', '666884444', '1952-9-15', '975 Ba Ria,Vung Tau', 'Nam', 38000, '333445555', 5);  
Insert into NhanVien values ('Tran', 'Thanh', 'Hung', '453453453', '1962-7-31', '543 Mai Thi Luu,Q1,TPHCM', 'Nam', 25000, '333445555', 5);  
Insert into NhanVien values ('Tran', 'Hong', 'Quan', '987987987', '1959-3-29', '980 Le Hong Phong,Q10,TPHCM', 'Nam', 25000, '398765432133445555', 4);  
Insert into NhanVien values ('Vuong', 'Ngoc', 'Quyen', '888665555', '1926-10-10', '450 Trung Vuong,Ha Noi', 'Nu', 35000, Null, 1);  

--Table De an
Insert into DeAn values ('San Pham X', 1, 'Vung Tau', 5); 
Insert into DeAn values ('San Pham Y', 2, 'Nha Trang', 5); 
Insert into DeAn values ('San Pham Z', 3, 'TP HCM', 5); 
Insert into DeAn values ('Tin hoc hoa', 10, 'Ha Noi', 4); 
Insert into DeAn values ('Cap Quang', 20, 'TP HCM', 1); 
Insert into DeAn values ('Dao tao', 30, 'Ha Noi', 4); 
 
--Table DDiem phg
Insert into DiaDiemPHG values (1, 'TP HCM'); 
Insert into DiaDiemPHG values (4, 'Ha Noi'); 
Insert into DiaDiemPHG values (5, 'Vung Tau'); 
Insert into DiaDiemPHG values (5, 'Nha Trang'); 
Insert into DiaDiemPHG values (5, 'Hai Phong'); 

--Table Phan Cong 
Insert into PhanCong values ('123456789', 1, 32.5); 
Insert into PhanCong values ('123456789', 2, 7.5); 
Insert into PhanCong values ('666884444', 3, 40.0); 
Insert into PhanCong values ('453453453', 1, 20.0); 
Insert into PhanCong values ('453453453', 2, 20.0); 
Insert into PhanCong values ('333445555', 3, 10.0); 
Insert into PhanCong values ('333445555', 10, 10.0); 
Insert into PhanCong values ('333445555', 20, 10.0); 
Insert into PhanCong values ('999887777', 30, 30.0); 
Insert into PhanCong values ('999887777', 10, 10.0); 
Insert into PhanCong values ('987987987', 10, 35.0); 
Insert into PhanCong values ('987987987', 20, 5.0); 
Insert into PhanCong values ('987654321', 30, 20.0);
Insert into PhanCong values ('987654321', 20, 15.0);
Insert into PhanCong values ('888665555', 20, Null);

--Table ThanNhan
Insert into ThanNhan values ('333445555', 'Quang', 'Nu', '1976-4-5', 'Con gai');  
Insert into ThanNhan values ('333445555', 'Khang', 'Nam', '1973-10-25', 'Con trai');
Insert into ThanNhan values ('333445555', 'Duong', 'Nu', '1948-5-3', 'Vo Chong');
Insert into ThanNhan values ('987654321', 'Dang', 'Nam', '1932-2-19', 'Vo Chong');
Insert into ThanNhan values ('123456789', 'Duy', 'Nam', '1978-1-1', 'Con trai');
Insert into ThanNhan values ('123456789', 'Chau', 'Nu', '1978-12-31', 'Con gai');

 

---I.	Write store procedures to do bellow tasks: (SPs were named SP_[number])---
--1.	List all employees whose salary is greater than the input parameter.
Create Proc [GreaterSalary]
@Luong int 
As
Begin
	Select * 
	From NhanVien
	Where Luong > @Luong
End;

Declare @lg int 
Execute [GreaterSalary] 30000

Drop Proc [GreaterSalary];

--2.	List all information of employees (code, name, entered date, supervisor’s id, supervisor’s name) 
--that were employed from s to f. S and f are date value that were been input parameters.

Create Proc [Date]
@s date, @f date
As
Begin
	Select nv1.MaNV, nv1.TenNV, nv1.NgSinh, nv1.MaNQL
	From NhanVien nv1 join NhanVien nv2
	On nv1.MaNV = nv2.MaNV
	Where nv1.NgSinh > @s and nv1.NgSinh < @f
End;

Declare @s1 date, @f1 date
Execute [Date] '1956-4-5', '1976-4-5'

--3.	List all employees in the department that whose code is input parameter. 
Create Proc Code
@MaNV nvarchar(20)
As
Begin
	Select *
	From NhanVien 
	Where MaNV = @Manv
End;

Declare @code nvarchar(20)
Execute Code '333445555' 

Drop Proc Code
--4.	List all employees that do not have supervisor.
Create Proc NoSuper
As
	Select *
	From NhanVien 
	Where MaNQL is null

Execute NoSuper
--5.	List all information about employees, include: name, code, working times in months to now.
Create Proc emp1
As
	Select MaNV, TenNV
	From NhanVien  

Execute emp1

--6.	List all information about departments, include: code, name of department, number of employees of department.
Create Proc dept1
As
	Select d.MaPHG, d.TenPHG, COUNT(e.MaNV) as [SoLuongNV]
	From PhongBan d full join NhanVien e
	On d.MaPHG = e.MaPHG
	Group by d.MaPHG, d.TenPHG

Execute dept1

--7.	List all employees (code, name, salary) whose salary more than the average salary of the department that they work in.
SELECT AVG(Luong) FROM NhanVien;
---

Create Proc AvgSal
As
	Select MaNV, TenNV, Luong
	From NhanVien   
	WHERE Luong > 
		(
		SELECT AVG(Luong) 
		FROM NhanVien
		);

Execute AvgSal

	
--8.	List N employees that have the highest salary. N is the input parameter. 
Create Proc emp2
@num int
As
Begin
	Select Top (@num) *
	From NhanVien   
	Order by Luong desc
End;

Declare @num1 int
Execute emp2 3
 

--9.	Increase 10% for salary of all employees in the city A. A is the input parameter.
Create Proc emp3
@DCHI nvarchar(30)  
As
Begin
	Select MaNV, TenNV, DCHI, Luong, Luong*1.1 as [LuongSauKhiTang]
	From NhanVien 
	Where DCHI like @DCHI 
End;

Declare @DCHI2 nvarchar(30)  
Execute emp3 '%Ha Noi'
 

--10.	Delete all no personnel departments. 





---II.	Write triggers to ensure:
--1.	The average salary of each department must be fewer than 50000.
	Select MaPHG, Avg(Luong) as AvgSalary
	From NhanVien   
	Group by MaPHG

--2.	The salary of the head of each department must be greater than or equal to salary of all employees in this department.
--3.	The different between average salary of employees in HCM and HN must fewer than 10000.
--4.	There is not group that have more than five employees that are in the same family.
--5.	The different between number of male and female employees must fewer than 10%.





























