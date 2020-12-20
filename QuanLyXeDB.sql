-- SQL Manager 2010 for SQL Server 3.5.0.4
-- ---------------------------------------
-- Host      : (local)
-- Database  : NDS
-- Version   : Microsoft SQL Server  9.00.1399.06

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

ALTER TABLE [dbo].[DangKyXeMay]  WITH CHECK ADD  CONSTRAINT [FK_DangKyXeMay_User] FOREIGN KEY([registerID])
REFERENCES [dbo].[User] ([IDUser])
GO

ALTER TABLE [dbo].[DangKyXeMay] CHECK CONSTRAINT [FK_DangKyXeMay_User]
GO

-------------------------------------

IF DB_ID ('XuLyViPham') IS NOT NULL DROP DATABASE XuLyViPham
GO
CREATE DATABASE XuLyViPham
GO
use XuLyViPham


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
	[LoiViPham] [nvarchar](50)  NOT NULL,
	[DiaDiem] [nvarchar](50)  NOT NULL,
	[DonViXuPhat] [nvarchar](50)  NOT NULL,
	[SoTien] [int] NOT NULL,

 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[IDBienBan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[LoiViPham](
	[IDLoiVP] [int] IDENTITY(1,1) NOT NULL,
	[LoiViPham] [nvarchar](50) NOT NULL,
	[SoTien] [int] NULL,

 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[IDLoiVP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[LoiViPham]  WITH CHECK ADD  CONSTRAINT [FK_LoiViPham_BienBanXuPhat] FOREIGN KEY([IDLoiVP])
REFERENCES [dbo].[User] ([IDLoiVP])
GO
