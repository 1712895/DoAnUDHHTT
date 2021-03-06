-- SQL Manager 2010 for SQL Server 3.5.0.4
-- ---------------------------------------
-- Host      : (local)
-- Database  : NDS
-- Version   : Microsoft SQL Server  9.00.1399.06
use master

IF DB_ID ('QLXeMay') IS NOT NULL DROP DATABASE QLXeMay
GO
CREATE DATABASE QLXeMay
GO
use QLXeMay


/****** Object:  Table [dbo].[User]    Script Date: 12/17/2020 1:35:53 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[User](
	[IDUser] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[DiaChi] [nvarchar](50) NULL,
	[SDT] [nvarchar](50) NULL,
	[DOB] [datetime] NULL,
	[CMND] [char](10) NULL,
	[NgayCap] [datetime]  NULL,
	[NoiCap] [nvarchar](50) NULL,
	[accountName] [char](20) NOT NULL,
	[password] [char](20)  NOT NULL,
	[Role] [int] NOT NULL,
	[GioiTinh] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[IDUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[DangKyXeMay]    Script Date: 12/17/2020 1:33:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DangKyXeMay](
	[ToKhaiDK_ID] [int] NOT NULL,
	[registerID] [int] NOT NULL,
	[co_ownerName] [nvarchar](50) NULL,
	[co_ownerCMND] [char](10) NULL,
	[co_ownerNgayCap] [datetime] NULL,
	[co_ownerNoiCap] [nvarchar](50) NULL,
	[Co_ownAdress] [nvarchar](100) NULL,
	[LoaiXeMay] [char](50) NULL,
	[MauSon] [char](50) NULL,
	[NhanHieu] [char](50) NULL,
	[CongSuat] [float] NULL,
	[NuocSX] [char](50) NULL,
	[NamSX] [int] NULL,
	[SoDongCo] [char](100) NULL,
	[SoKhung] [char](100) NULL,
	[KichThuoc] [char](100) NULL,
	[TrongLuong] [char](100) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_DangKyXeMay] PRIMARY KEY CLUSTERED 
(
	[ToKhaiDK_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[BangLaiXe]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BangLaiXe](
	[maBang] [nchar](20) NOT NULL,
	[hangXe] [nchar](10) NOT NULL,
	[ngayTrungTuyen] [date] NOT NULL,
	[ThoiHan] [int] NOT NULL,
	[IDUser] [int] NOT NULL,
 CONSTRAINT [PK_BangLaiXe] PRIMARY KEY CLUSTERED 
(
	[maBang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[DangKyXeMay]  WITH CHECK ADD  CONSTRAINT [FK_DangKyXeMay_User] FOREIGN KEY([registerID])
REFERENCES [dbo].[User] ([IDUser])
GO

ALTER TABLE [dbo].[DangKyXeMay] CHECK CONSTRAINT [FK_DangKyXeMay_User]
GO

ALTER TABLE [dbo].[BangLaiXe]  WITH CHECK ADD  CONSTRAINT [FK_BangLaiXe_User] FOREIGN KEY([IDUser])
REFERENCES [dbo].[User] ([IDUser])
GO
ALTER TABLE [dbo].[BangLaiXe] CHECK CONSTRAINT [FK_BangLaiXe_User]
GO

USE [QLXeMay]
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([IDUser], [UserName], [DiaChi], [SDT], [DOB], [CMND], [NgayCap], [NoiCap], [accountName], [password], [Role], [GioiTinh]) VALUES (1, N'Le Thanh Nhan', N'41/1, Nguyen Trai, Quan 5', N'0342726584', NULL, N'272771177 ', CAST(N'2010-02-22T00:00:00.000' AS DateTime), N'Ho Chi Minh', N'thanhnhan99         ', N'123456              ', 1, 1)
INSERT [dbo].[User] ([IDUser], [UserName], [DiaChi], [SDT], [DOB], [CMND], [NgayCap], [NoiCap], [accountName], [password], [Role], [GioiTinh]) VALUES (2, N'Nguyen Thi Nu', N'28, Nguyen Van Cu, Quan 5', N'0345879657', NULL, N'263734499 ', CAST(N'2011-12-09T00:00:00.000' AS DateTime), N'Ho Chi Minh', N'thinu235            ', N'123456              ', 1, 0)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
INSERT [dbo].[BangLaiXe] ([maBang], [hangXe], [ngayTrungTuyen], [ThoiHan], [IDUser]) VALUES (N'012334212345        ', N'A1        ', CAST(N'2017-01-21' AS Date), 0, 1)
INSERT [dbo].[BangLaiXe] ([maBang], [hangXe], [ngayTrungTuyen], [ThoiHan], [IDUser]) VALUES (N'013456437687        ', N'B2        ', CAST(N'2017-11-21' AS Date), 10, 2)
GO


/****** Object:  Table [dbo].[BienBanXuPhat] */
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[BienBanXuPhat](
	[IDBienBan] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[DiaChi] [nvarchar](50) NULL,
	[SDT] [nvarchar](50) NULL,
	[NgaySinh] [datetime] NULL,
	[CMND] [char](10) NULL,
	[NgayCap] [datetime]  NULL,
	[NoiCap] [nvarchar](50) NULL,
	[NgayViPham] [datetime] NOT NULL,
	[IDLoiVP] [int] NOT NULL,
	[DiaDiem] [nvarchar](50)  NOT NULL,
	[DonViXuPhat] [nvarchar](50)  NOT NULL,
	[SoTien] [int] NOT NULL,

 CONSTRAINT [PK_IDBienBan] PRIMARY KEY CLUSTERED 
(
	[IDBienBan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


/****** Object:  Table [dbo].[LoiViPham] */

CREATE TABLE [dbo].[LoiViPham](
	[IDLoiVP] [int] IDENTITY(1,1) NOT NULL,
	[LoiViPham] [nvarchar](50) NOT NULL,
	[SoTien] [int] NULL,

 CONSTRAINT [PK_IDLoiVP] PRIMARY KEY CLUSTERED 
(
	[IDLoiVP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

INSERT [dbo].[LoiViPham] ([IDLoiVP], [LoiViPham], [SoTien]) VALUES (1, N'Không Chấp Hành Biển Báo', 200000)
INSERT [dbo].[LoiViPham] ([IDLoiVP], [LoiViPham], [SoTien]) VALUES (2, N'Không Thắt Dây An Toàn', 1000000)
INSERT [dbo].[LoiViPham] ([IDLoiVP], [LoiViPham], [SoTien]) VALUES (3, N'Không Đội Mũ Bảo Hiểm', 300000)
INSERT [dbo].[LoiViPham] ([IDLoiVP], [LoiViPham], [SoTien]) VALUES (4, N'Dùng Điện Thoại Khi Lái Xe', 1000000)
INSERT [dbo].[LoiViPham] ([IDLoiVP], [LoiViPham], [SoTien]) VALUES (5, N'Vượt Đèn Đỏ', 1000000)
INSERT [dbo].[LoiViPham] ([IDLoiVP], [LoiViPham], [SoTien]) VALUES (6, N'Không Mang Bằng Lái', 200000)
INSERT [dbo].[LoiViPham] ([IDLoiVP], [LoiViPham], [SoTien]) VALUES (7, N'Không Có Bằng Lái', 1200000)
INSERT [dbo].[LoiViPham] ([IDLoiVP], [LoiViPham], [SoTien]) VALUES (8, N'Không Mang Đăng Ký Xe', 200000)
INSERT [dbo].[LoiViPham] ([IDLoiVP], [LoiViPham], [SoTien]) VALUES (9, N'Không Có Đăng Ký Xe', 400000)
INSERT [dbo].[LoiViPham] ([IDLoiVP], [LoiViPham], [SoTien]) VALUES (10, N'Không Có Bảo Hiểm Xe', 200000)
INSERT [dbo].[LoiViPham] ([IDLoiVP], [LoiViPham], [SoTien]) VALUES (11, N'Quá Tốc Độ 5-10km', 300000)
INSERT [dbo].[LoiViPham] ([IDLoiVP], [LoiViPham], [SoTien]) VALUES (12, N'Quá Tốc Độ 10-20km', 1000000)
INSERT [dbo].[LoiViPham] ([IDLoiVP], [LoiViPham], [SoTien]) VALUES (13, N'Quá Tốc Độ Trên 20km', 5000000)
INSERT [dbo].[LoiViPham] ([IDLoiVP], [LoiViPham], [SoTien]) VALUES (14, N'Nồng Độ Cồn <0.25', 3000000)
INSERT [dbo].[LoiViPham] ([IDLoiVP], [LoiViPham], [SoTien]) VALUES (17, N'Nồng Độ Cồn 0.25-0.4', 5000000)

ALTER TABLE [dbo].[BienBanXuPhat]  WITH CHECK ADD  CONSTRAINT [FK_BienBanXuPhat_LoiViPham] FOREIGN KEY([IDLoiVP])
REFERENCES [dbo].[LoiViPham] ([IDLoiVP])
GO
