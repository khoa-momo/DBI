
--Q1
--Table KHACHHANG
Create Table KHACHHANG(
	MAKH Nvarchar(5) Primary key,
	TENKH Nvarchar(30) NOT NULL,
	DIACHI Nvarchar(50),
	DT Nvarchar(10),
	EMAIL Nvarchar(30)
);

--Table SANPHAM
Create Table SANPHAM(
	MAVT Nvarchar(5) NOT NULL Primary key,
	TENVT Nvarchar(30),
	DVT Nvarchar(20),
	GIAMUA Int Check (GIAMUA > 0),
	SLTON Int Check (SLTON >= 0)
);

--Table HOADON
Create Table HOADON(
	MAHD Nvarchar(10)  Primary key,
	NGAY Date,
	MAKH Nvarchar(5) foreign key references KHACHHANG(MAKH),
	TONGTG Int
);

--Table CHITIETHOADON
Create Table CHITIETHOADON( 
	MAHD Nvarchar(10) foreign key references HOADON(MAHD),
	MAVT Nvarchar(5) foreign key references SANPHAM(MAVT),
	SL Int Check (SL >= 0),
	KHUYENMAI Int,
	GIABAN Int, 
);

--Insert data into KHACHHANG (MAKH, TENKH, DIACHI, DT, EMAIL)
Insert into KHACHHANG values ('KH01', 'NGUYEN THI BE', 'TAN BINH', '8457895', 'bnt@yahoo.com'); 
Insert into KHACHHANG values ('KH02', 'LE HOANG NAM', 'BINH CHANH', '9878987', 'namlehoang @abc.com.vn'); 
Insert into KHACHHANG values ('KH03', 'TRAN THI CHIEU', 'TAN BINH', '8457895', Null); 
Insert into KHACHHANG values ('KH04', 'MAI THI QUE ANH', 'BINH CHANH', Null, Null); 
Insert into KHACHHANG values ('KH05', 'LE VAN SANG', 'QUAN 10', Null, 'sanglv@hcm.vnn.vn'); 
Insert into KHACHHANG values ('KH06', 'TRAN HOANG KHAI', 'TAN BINH', '8457897', Null); 

--Insert data into SANPHAM  (MAVT, TENVT, DVT, GIAMUA, SLTON)
Insert into SANPHAM values ('VT01', 'XI MANG', 'BAO', 50000, 5000);
Insert into SANPHAM values ('VT02', 'CAT', 'KHOI', 45000, 50000);
Insert into SANPHAM values ('VT03', 'GACH  ONG', 'VIEN', 120, 800000);
Insert into SANPHAM values ('VT04', 'GACH THE', 'VIEN', 110, 800000);
Insert into SANPHAM values ('VT05', 'DA LON', 'KHOI', 25000, 100000);
Insert into SANPHAM values ('VT06', 'DA NHO', 'KHOI', 33000, 100000); 

--Insert data into HOADON (MAHD, NGAY, MAKH, TONGTG)
Insert into HOADON values ('HD001', '2000-05-12', 'KH01', Null); 
Insert into HOADON values ('HD002', '2000-05-25', 'KH02', Null); 
Insert into HOADON values ('HD003', '2000-05-25', 'KH01', Null); 
Insert into HOADON values ('HD004', '2000-05-25', 'KH04', Null); 
Insert into HOADON values ('HD005', '2000-05-26', 'KH04', Null); 
Insert into HOADON values ('HD006', '2000-06-02', 'KH03', Null); 
Insert into HOADON values ('HD007', '2000-06-22', 'KH04', Null); 
Insert into HOADON values ('HD008', '2000-06-25', 'KH03', Null); 
Insert into HOADON values ('HD009', '2000-08-15', 'KH04', Null); 
Insert into HOADON values ('HD010', '2000-09-30', 'KH01', Null); 

--Insert data into CHITIETHOADON (MAHD, MAVT, SL, KHUYENMAI, GIA BAN)
Insert into CHITIETHOADON values ('HD001', 'VT01', 5, Null, 52000);  
Insert into CHITIETHOADON values ('HD001', 'VT05', 10, Null, 30000);  
Insert into CHITIETHOADON values ('HD002', 'VT03', 10000, Null, 150);  
Insert into CHITIETHOADON values ('HD003', 'VT02', 20, Null, 55000); 
Insert into CHITIETHOADON values ('HD004', 'VT03', 50000, Null, 150);  
Insert into CHITIETHOADON values ('HD004', 'VT04', 20000, Null, 120); 
Insert into CHITIETHOADON values ('HD005', 'VT05', 10, Null, 30000);  
Insert into CHITIETHOADON values ('HD006', 'VT04', 10000, Null, 120); 
Insert into CHITIETHOADON values ('HD007', 'VT04', 20000, Null, 125);  
Insert into CHITIETHOADON values ('HD008', 'VT01', 100, Null, 55000); 
Insert into CHITIETHOADON values ('HD009', 'VT02', 25, Null, 48000);  
Insert into CHITIETHOADON values ('HD010', 'VT01', 25, Null, 57000); 

--Q2
--List all customers live in “TAN BINH” as following:
Select *
From KHACHHANG
Where DIACHI = 'TAN BINH';


--Q3
--List all products whose name include “GACH” and price more than 110 as following:
Select *
From SANPHAM
Where TENVT Like '%GACH%' and GIAMUA > 110;


 --Q4
 --List all orders with these customer, by ascending order of order date as following: 
Select h.MAHD, h.NGAY, k.TENKH, k.DIACHI, k.DT
From HOADON h Inner join KHACHHANG k
ON h.MAKH = k.MAKH
Order by NGAY


--Q5
--List all customers that did not place order in June 2000 as following:
Select KHACHHANG.MAKH, DIACHI, DT 
From KHACHHANG
Except
Select KHACHHANG.MAKH, DIACHI, DT
From KHACHHANG Inner join HOADON
ON KHACHHANG.MAKH = HOADON.MAKH
Where DATEPART(year, NGAY) = 2000 and DATEPART(month, NGAY) = 6 


--Q6
--List all detail orders that have GIABAN >= GIAMUA. Note that: TriGiaMua = GIAMUA * SL, TriGiaBan = GIABAN * SL
Select c.MAHD, s.MAVT, s.TENVT, s.DVT, c.GIABAN, s.GIAMUA, c.SL, GIAMUA*SL as [TriGiaMua], GIABAN*SL as [TriGiaBan]
From SANPHAM s Inner join CHITIETHOADON c
ON s.MAVT = c.MAVT
Where c.GIABAN >= s.GIAMUA;


--Q7
--List all orders which has maximum total value as following:  
-----------------------
With Mytable as(
	Select c.MAHD, hd.Ngay, hd.MAKH, kh.TENKH, kh.DIACHI, Sum(GIABAN*SL) as [TongGiaTri]
	From SANPHAM s inner join CHITIETHOADON c
	On s.MAVT = c.MAVT inner join HOADON hd
	On c.MAHD = hd.MAHD inner join KHACHHANG kh
	On hd.MAKH = kh.MAKH
	Group By c.MAHD, hd.Ngay, hd.MAKH, kh.TENKH, kh.DIACHI
)
Select * 
From Mytable
Where Mytable.TongGiaTri = 
	(
	Select max(Mytable.TongGiaTri) 
	From Mytable
	) 



--Q8 
--List all products which were bought in minimum number of orders as following:
--C1
With Mytable2 as
(
	Select sp.MAVT, sp.TENVT, sp.DVT, sp.GIAMUA, count(c.MAHD) as [SL HoaDon]
	From SANPHAM sp left outer join CHITIETHOADON c
	On sp.MAVT = c.MAVT
	Group By sp.MAVT, sp.TENVT, sp.DVT, sp.GIAMUA, c.MAVT
)
Select * From Mytable2
Where Mytable2.[SL HoaDon] = 
	(
	Select min(Mytable2.[SL HoaDon]) 
	From Mytable2
	) 






----
--C2
Select sp.MAVT, sp.TENVT, sp.DVT, sp.GIAMUA, count(c.MAHD) as [SL HoaDon]
From SANPHAM sp left outer join CHITIETHOADON c
On sp.MAVT = c.MAVT
Group By sp.MAVT, sp.TENVT, sp.DVT, sp.GIAMUA, c.MAVT
Having count(c.MAHD) =
	(
	Select Min([SL HoaDon])
	From
		(
		Select sp.MAVT, sp.TENVT, sp.DVT, sp.GIAMUA, count(c.MAHD) as [SL HoaDon]
		From SANPHAM sp left outer join CHITIETHOADON c
		On sp.MAVT = c.MAVT
		Group By sp.MAVT, sp.TENVT, sp.DVT, sp.GIAMUA, c.MAVT
		)as Mytable
	)