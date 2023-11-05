
--Creat DB
Create Table Khoa(
	MAKH varchar(4) Primary Key,
	TENKH Nvarchar(50),
	SLSV int
);

Create Table SinhVien(
	MASV varchar(4) Primary Key,
	HoSV Nvarchar(30),
	TenSV Nvarchar(10),
	Phai Nvarchar(4),
	NgSinh Date,
	NoiSinh Nvarchar(30),
	MaKH varchar(4) foreign key references Khoa(MAKH),
	HocBong money,
	DiemTB numeric(4,2)
);

Create Table MonHoc(
	MAMH varchar(4) Primary Key,
	TenMH varchar(35),
	Sotiet tinyint
);

Create Table KetQua(
	MASV varchar(4) foreign key references SinhVien(MASV),
	MAMH varchar(4) foreign key references MonHoc(MAMH),
	LanThi tinyint,
	Diem numeric(4,2),
	KQ varchar(1)
);

--Insert Data
--Khoa Table
Insert into Khoa values('HTTT', 'He Thong Thong Tin', Null);
Insert into Khoa values('MANG', 'Mang va Truyen Thong', Null);
Insert into Khoa values('CNPM', 'Cong Nghe Phan Mem', Null);
Insert into Khoa values('KTMT', 'Ky Thuat May Tinh', Null);
Insert into Khoa values('KHMT', 'Khoa Hoc May Tinh', Null);

--SinhVien Table
Insert into SinhVien values('SV01', 'Le Kim', 'Lan', 'Nu', '1990-02-23', 'Ha Noi', 'HTTT', 130000, Null);
Insert into SinhVien values('SV02', 'Tran Minh', 'Chanh', 'Nam', '1992-12-24', 'Binh Đinh', 'MANG', 150000, Null);
Insert into SinhVien values('SV03', 'Le An', 'Tuyet', 'Nu', '1991-02-27', 'Hai Phong', 'HTTT', 170000, Null);
Insert into SinhVien values('SV04', 'Tran Anh', 'Tuan', 'Nam', '1993-12-20', 'TpHCM', 'MANG', 80000, Null);
Insert into SinhVien values('SV05', 'Tran Thị', 'Mai', 'Nu', '1991-08-12', 'TpHCM', 'CNPM', 0, Null);
Insert into SinhVien values('SV06', 'Le Thi Nhu', 'Thuy', 'Nu', '1991-01-02', 'An Giang', 'HTTT', 0, Null);
Insert into SinhVien values('SV07', 'Nguyen Kim', 'Thu', 'Nu', '1990-02-02', 'Ha Noi', 'CNPM', 180000, Null);
Insert into SinhVien values('SV08', 'Le Van', 'Long', 'Nam', '1992-08-12 ', 'TpHCM', 'HTTT', 190000, Null);

--Monhoc Table
Insert into Khoa values('CSDL', 'Co So Du Lieu', 45);
Insert into Khoa values('TTNT', 'Tri Tue Nhan Tao', 45);
Insert into Khoa values('MMT', 'Mang May Tinh', 45);
Insert into Khoa values('DHMT', 'Đo Hoa May Tinh', 60);
Insert into Khoa values('CTDL', 'Cau Truc Du Lieu', 60);

--KetQua Table
Insert into KetQua values('SV01', 'CSDL', 1, 3, Null);
Insert into KetQua values('SV01', 'CSDL', 2, 6, Null);
Insert into KetQua values('SV01', 'CSDL', 1, 5.5, Null);
Insert into KetQua values('SV01', 'CSDL', 2, 6, Null);
Insert into KetQua values('SV01', 'CSDL', 1, 5, Null); 

Insert into KetQua values('SV02', 'CSDL', 1, 4.5, Null); 
Insert into KetQua values('SV02', 'CSDL', 2, 7, Null);
Insert into KetQua values('SV02', 'MMT', 1, 10, Null);
Insert into KetQua values('SV02', 'CTDL', 1, 9, Null);

Insert into KetQua values('SV03', 'CSDL', 1, 2, Null);
Insert into KetQua values('SV03', 'CSDL', 2, 5, Null);
Insert into KetQua values('SV03', 'MMT', 1, 2.5, Null);
Insert into KetQua values('SV03', 'MMT', 2, 4, Null);

Insert into KetQua values('SV04', 'CSDL', 1, 4.5, Null);
Insert into KetQua values('SV04', 'CTDL', 1, 10, Null);

Insert into KetQua values('SV05', 'CSDL', 1, 7, Null);
Insert into KetQua values('SV05', 'MMT', 1, 2.5, Null);
Insert into KetQua values('SV05', 'MMT', 2, 5, Null);

Insert into KetQua values('SV06', 'CTDL', 1, 6, Null);
Insert into KetQua values('SV06', 'CTDL', 1, 10, Null);