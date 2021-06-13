﻿-- use master; drop database testDB
-- Create database testDB;
use testDB;

--tạo bảng 

--Bang LoaiXe
CREATE TABLE [dbo].[LoaiXe] (
    [MaLoaiXe]		varchar(25)         NOT NULL,
    [TenLoaiXe]		nvarchar(MAX)		NULL,
	[GiaLoaiXe]		decimal(18,2)		NOT NULL,
    [SoCho]			INT					NULL,
    [SoLuong]		INT					NULL,
    PRIMARY KEY CLUSTERED ([MaLoaiXe] ASC)
);
--Bang Xe
CREATE TABLE [dbo].[Xe](
	[MaXe]			varchar(25)			NOT NULL,
	[MaLoaiXe]		varchar(25)			NOT NULL,
	[BienSo]		varchar(11)			NULL,
	[TenXe]			nvarchar(MAX)		NULL,
	[MoTa]			nvarchar(MAX)		NULL,
	[GiaXe]			decimal(18,2)		NULL,
	[TinhTrang]		bit					NOT NULL		default(0),
	[HinhAnh]		nvarchar(MAX)		NULL,
	PRIMARY KEY CLUSTERED ([MaXe] ASC),
	CONSTRAINT [FK_Xe_LoaiXe] FOREIGN KEY ([MaLoaiXe]) REFERENCES [dbo].[LoaiXe] ([MaLoaiXe])
);


--Bang Phan Quyen
CREATE TABLE [dbo].[PhanQuyen](
	[MaQuyen]			int			NOT NULL,
	[TenQuyen]			varchar(25)			NOT NULL, --admin  nhanvien  khachhang
	PRIMARY KEY CLUSTERED ([MaQuyen] ASC),
);
--Bang Account
--CREATE TABLE [dbo].[Account](
--	[IdA]			char(20)			NOT NULL,
--	[PassA]			varchar(25)			NOT NULL,
--	[MaQuyen]		int					NOT NULL,
--	[TenUser]		nvarchar(40)		NOT NULL,
--	PRIMARY KEY CLUSTERED ([IdA] ASC),
--	CONSTRAINT [FK_Account_PhanQuyen] FOREIGN KEY ([MaQuyen]) REFERENCES [dbo].[PhanQuyen] ([MaQuyen])
--);

--Bang User
CREATE TABLE [dbo].[User](
	[MaUser]		int					IDENTITY (1, 1)NOT NULL,
	[TenUser]		nvarchar(40)		NOT NULL,
	[NgaySinh]		date				NULL,
	[DiaChi]		nvarchar(MAX)		NULL,
	[Mail]			varchar(MAX)		NULL,
	[MaQuyen]		int					NOT NULL,
	[CMND]			int					NULL,
	[SDT]			char(20)			NOT NULL, --Tên đăng nhập
	[NganHang]		varchar(MAX)		NULL,
	[SoTK]			char(20)			NULL,
	[PasswordUser]	varchar(MAX)		NOT NULL,
	PRIMARY KEY CLUSTERED ([MaUser] ASC),
	CONSTRAINT [FK_Khach_Account_ID] FOREIGN KEY ([MaQuyen]) REFERENCES [dbo].[PhanQuyen] ([MaQuyen]),
);
--Alter table dbo.KHACH
--DROP CONSTRAINT FK_Khach_Account_ID
--Bang Loai NV
--CREATE TABLE [dbo].[LoaiNhanVien](
--	[MaLoaiNV]		int					IDENTITY (1, 1)NOT NULL,
--	[TenLoaiNV]		nvarchar(MAX)		NOT NULL
--	PRIMARY KEY CLUSTERED ([MaLoaiNV] ASC),

--);
--Bang NV
--CREATE TABLE [dbo].[NhanVien](
--	[MaNV]			varchar(25)			NOT NULL,
--	[MaLoaiNV]		int					NOT NULL,
--	[TenNV]			nvarchar(40)		NOT NULL,
--	[DiaChi]		nvarchar(MAX)		NULL,
--	[Mail]			varchar(MAX)		NULL,
--	[CMND]			int					NULL,
--	[SDT]			char(20)			NOT NULL, --Tên đăng nhập
--	PRIMARY KEY CLUSTERED ([MaNV] ASC),
--	CONSTRAINT [FK_NV_LoaiNV] FOREIGN KEY ([MaLoaiNV]) REFERENCES [dbo].[LoaiNhanVien] ([MaLoaiNV]),
--	--CONSTRAINT [FK_NV_Account_ID] FOREIGN KEY ([SDT]) REFERENCES [dbo].[Account] ([IdA]),
--	--Alter table dbo.NhanVien
--	--DROP CONSTRAINT FK_NV_Account_ID
--);

--Bang So Dat Xe
CREATE TABLE [dbo].[SoDatXe](
	[MaSo]			int					IDENTITY (1,1) NOT NULL,
	[SoHD]			int					NULL,
	[TinhTrang]		NVARCHAR(MAX)        NULL,	
);

--Bang Hop Dong
CREATE TABLE [dbo].[HopDong](
	[SoHD]			int					IDENTITY (1, 1) NOT NULL,
	[Ngay]			date				NULL,
	[MaUser]		int					NOT NULL,
	[NoiDung]		nvarchar(MAX)		NULL,
	[DonGia]		float				NULL,
	[HTTT]			nvarchar(MAX)		NULL,
	[GiaT]			decimal(18,2)		NOT NULL,
	[DieuKhoan]		nvarchar(MAX)		NULL,
	PRIMARY KEY CLUSTERED ([SoHD] ASC),
	CONSTRAINT [FK_HopDong_User] FOREIGN KEY ([MaUser]) REFERENCES [dbo].[User] ([MaUser])
);
--Bang Chi tiet hop dong
CREATE TABLE [dbo].[ChiTietHopDong](
	[SoCTHD]		int					IDENTITY (1, 1) NOT NULL,
	[SoHD]			int					NOT NULL,
	[MaXe]		varchar(25)         NOT NULL,
	[soLuong]		int					NOT NULL,
	[TraTruoc]		decimal(18,2)				NOT NULL,
	[NgayNhan]		date				NULL,
	[NgayTra]		date				NULL,
	[GhiChu]		nvarchar(MAX)		NULL,
	PRIMARY KEY CLUSTERED ([SoHD] ASC),
	CONSTRAINT [FK_CTHopDong_HopDong] FOREIGN KEY ([SoHD]) REFERENCES [dbo].[HopDong] ([SoHD]),
	CONSTRAINT [FK_CTHopDong_Xe] FOREIGN KEY ([MaXe]) REFERENCES [dbo].[Xe] ([MaXe])

);


--Bảng DatXe
CREATE TABLE [dbo].[DatXe](
	[MaDatXe]		int					IDENTITY (1, 1) NOT NULL,
	[Ngay]			date				NULL,
	[MaUser]		int					NOT NULL,
	[MaLoaiXe]		varchar(25)			NOT NULL,
	[SoLuong]		int					NULL,
	[NgayHenLay]	date				NOT NULL,
	[TinhTrang]		bit,
	PRIMARY KEY CLUSTERED ([MaDatXe] ASC),
	CONSTRAINT [FK_DatXe_LoaiXe] FOREIGN KEY ([MaLoaiXe]) REFERENCES [dbo].[LoaiXe] ([MaLoaiXe]),
	CONSTRAINT [FK_DatXe_Khach] FOREIGN KEY ([MaUser]) REFERENCES [dbo].[User] ([MaUser])
);


--Bang Xe Ra
CREATE TABLE [dbo].[XeRa](
	[NgayRa]		date				NOT NULL,
	[MaXe]			varchar(25)			NOT NULL,
	[GhiChu]		nvarchar(MAX)		NULL,
	CONSTRAINT [FK_XeRa_Xe] FOREIGN KEY ([MaXe]) REFERENCES [dbo].[Xe] ([MaXe]),
);
--Bang Xe Vao
CREATE TABLE [dbo].[XeVao](
	[NgayVao]		date				NOT NULL,
	[MaXe]			varchar(25)			NOT NULL,
	[GhiChu]		nvarchar(MAX)		NULL,
	CONSTRAINT [FK_XeVao_Xe] FOREIGN KEY ([MaXe]) REFERENCES [dbo].[Xe] ([MaXe]),
);

--Bang Thanh Toan
CREATE TABLE [dbo].[ThanhToan](
	[MaTT]			int					IDENTITY (1, 1)	NOT NULL,
	[SoHD]			int					NOT NULL,	
	[PhiPS]			float				NULL,
	[LyDo]			nvarchar(MAX)		NULL,
	[MaUser]		int			NOT NULL,
	PRIMARY KEY CLUSTERED ([MaTT] ASC),
	CONSTRAINT [FK_ThanhToan_HopDong] FOREIGN KEY ([SoHD]) REFERENCES [dbo].[HopDong] ([SoHD]),
	CONSTRAINT [FK_ThanhToan_NhanVien] FOREIGN KEY ([MaUser]) REFERENCES [dbo].[User] ([MaUser]),
);

--Bang Yeu Cau xe khong co trong db
CREATE TABLE [dbo].[YeuCau](
	[MaYC]			int					IDENTITY (1,1) NOT NULL,
	[MaUser]		int					NOT NULL,
	[TenLoaiXe]		nvarchar(MAX)		NULL,
	[SoCho]			INT					NULL,
    [SoLuong]		INT					NULL,
	[GhiChu]		nvarchar(MAX)		NULL,
	[TinhTrang]		bit					NOT NULL		default(0),
	PRIMARY KEY CLUSTERED ([MaYC] ASC),
	CONSTRAINT [FK_YeuCau_KHACH] FOREIGN KEY ([MaUser]) REFERENCES [dbo].[User] ([MaUser]),
);

CREATE TABLE [dbo].[ThamSo] (
    [TyLeTraThemKhiQuaNgay]               decimal(18,2)   NOT NULL,
    [TyLeTraThemKhiTonHaiXe]        decimal(18,2)       NOT NULL,
);

