USE [master]
GO
/****** Object:  Database [QLNH]    Script Date: 3/12/2019 9:30:04 PM ******/
CREATE DATABASE [QLNH]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLNH', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\QLNH.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLNH_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\QLNH_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QLNH] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLNH].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLNH] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLNH] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLNH] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLNH] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLNH] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLNH] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLNH] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLNH] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLNH] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLNH] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLNH] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLNH] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLNH] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLNH] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLNH] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLNH] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLNH] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLNH] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLNH] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLNH] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLNH] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLNH] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLNH] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLNH] SET  MULTI_USER 
GO
ALTER DATABASE [QLNH] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLNH] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLNH] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLNH] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QLNH] SET DELAYED_DURABILITY = DISABLED 
GO
USE [QLNH]
GO
/****** Object:  Table [dbo].[BAN]    Script Date: 3/12/2019 9:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAN](
	[Ban_ID] [int] IDENTITY(1,1) NOT NULL,
	[SoBan] [int] NULL,
	[TrangThai] [bit] NULL,
	[HoaDonDangPhucVu] [int] NULL,
 CONSTRAINT [PK_BAN] PRIMARY KEY CLUSTERED 
(
	[Ban_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CHITIETDONDATHANG]    Script Date: 3/12/2019 9:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHITIETDONDATHANG](
	[DonDatHang_ID] [int] NOT NULL,
	[NguyenLieu_ID] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[DonVi] [nvarchar](50) NULL,
 CONSTRAINT [PK_CHITIETDONDATHANG] PRIMARY KEY CLUSTERED 
(
	[DonDatHang_ID] ASC,
	[NguyenLieu_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CHITIETDONGIAOHANG]    Script Date: 3/12/2019 9:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHITIETDONGIAOHANG](
	[DonGiaoHang_ID] [int] NOT NULL,
	[NguyenLieu_ID] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[DonGia] [money] NULL,
	[DonVi] [nvarchar](50) NULL,
 CONSTRAINT [PK_CHITIETDONGIAOHANG] PRIMARY KEY CLUSTERED 
(
	[DonGiaoHang_ID] ASC,
	[NguyenLieu_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CHITIETHOADON]    Script Date: 3/12/2019 9:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHITIETHOADON](
	[HoaDon_ID] [int] NOT NULL,
	[MonAn_ID] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[Gia] [money] NULL,
 CONSTRAINT [PK_CHITIETHOADON] PRIMARY KEY CLUSTERED 
(
	[HoaDon_ID] ASC,
	[MonAn_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CHITIETHOPDONG]    Script Date: 3/12/2019 9:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHITIETHOPDONG](
	[HopDong_ID] [int] NOT NULL,
	[NguyenLieu_ID] [int] NOT NULL,
	[DonVi] [nvarchar](50) NULL,
	[SoLuong] [int] NULL,
 CONSTRAINT [PK_CHITIETHOPDONG] PRIMARY KEY CLUSTERED 
(
	[HopDong_ID] ASC,
	[NguyenLieu_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CHITIETPHIEUNHAPKHO]    Script Date: 3/12/2019 9:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHITIETPHIEUNHAPKHO](
	[PhieuNhapKho_ID] [int] NOT NULL,
	[NguyenLieu_ID] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[DonVi] [nvarchar](50) NULL,
	[Gia] [money] NULL,
 CONSTRAINT [PK_CHITIETPHIEUNHAPKHO] PRIMARY KEY CLUSTERED 
(
	[PhieuNhapKho_ID] ASC,
	[NguyenLieu_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CHITIETPHIEUXUATKHO]    Script Date: 3/12/2019 9:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHITIETPHIEUXUATKHO](
	[PhieuXuatKho_ID] [int] NOT NULL,
	[NguyenLieu_ID] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[DonVi] [nvarchar](50) NULL,
 CONSTRAINT [PK_CHITIETPHIEUXUATKHO] PRIMARY KEY CLUSTERED 
(
	[PhieuXuatKho_ID] ASC,
	[NguyenLieu_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DONDATHANG]    Script Date: 3/12/2019 9:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DONDATHANG](
	[DonDatHang_ID] [int] IDENTITY(1,1) NOT NULL,
	[NhanVien_ID] [int] NULL,
	[NhaCungCap_ID] [int] NULL,
	[SoDienThoai] [nvarchar](10) NULL,
	[NgayDat] [datetime] NULL,
 CONSTRAINT [PK_DONDATHANG] PRIMARY KEY CLUSTERED 
(
	[DonDatHang_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DONGIAOHANG]    Script Date: 3/12/2019 9:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DONGIAOHANG](
	[DonGiaoHang_ID] [int] IDENTITY(1,1) NOT NULL,
	[NhaCungCap_ID] [int] NULL,
	[NgayGiao] [date] NULL,
	[SdtNguoiGiao] [nvarchar](10) NULL,
	[DonDatHang_ID] [int] NULL,
 CONSTRAINT [PK_DONGIAOHANG] PRIMARY KEY CLUSTERED 
(
	[DonGiaoHang_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HOADON]    Script Date: 3/12/2019 9:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOADON](
	[HoaDon_ID] [int] IDENTITY(1,1) NOT NULL,
	[Ngay] [date] NULL,
	[TrangThai] [bit] NULL,
	[Ban_ID] [int] NULL,
	[NhanVien_ID] [int] NULL,
	[KhachHang_ID] [int] NULL,
 CONSTRAINT [PK_HOADON] PRIMARY KEY CLUSTERED 
(
	[HoaDon_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HOPDONG]    Script Date: 3/12/2019 9:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOPDONG](
	[HopDong_ID] [int] IDENTITY(1,1) NOT NULL,
	[NhanVien_ID] [int] NULL,
	[NhaCungCap_ID] [int] NULL,
	[TenHopDong] [nvarchar](50) NULL,
	[NgayLap] [date] NULL,
	[NgayKetThuc] [date] NULL,
 CONSTRAINT [PK_HOPDONG] PRIMARY KEY CLUSTERED 
(
	[HopDong_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 3/12/2019 9:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHACHHANG](
	[KhachHang_ID] [int] IDENTITY(1,1) NOT NULL,
	[TenKhachHang] [nvarchar](200) NULL,
	[Email] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](100) NULL,
	[DienThoai] [nvarchar](10) NULL,
 CONSTRAINT [PK_KHACHHANG] PRIMARY KEY CLUSTERED 
(
	[KhachHang_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LOAIMONAN]    Script Date: 3/12/2019 9:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOAIMONAN](
	[LoaiMonAn_ID] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](50) NULL,
 CONSTRAINT [PK_LOAIMONAN] PRIMARY KEY CLUSTERED 
(
	[LoaiMonAn_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LOAINGUYENLIEU]    Script Date: 3/12/2019 9:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOAINGUYENLIEU](
	[LoaiNguyenLieu_ID] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiNguyenLieu] [nvarchar](50) NULL,
 CONSTRAINT [PK_LOAINGUYENLIEU] PRIMARY KEY CLUSTERED 
(
	[LoaiNguyenLieu_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MONAN]    Script Date: 3/12/2019 9:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MONAN](
	[MonAn_ID] [int] IDENTITY(1,1) NOT NULL,
	[TenMonAn] [nvarchar](50) NULL,
	[MoTa] [nvarchar](max) NULL,
	[Hinh] [nvarchar](100) NULL,
	[TrangThai] [nvarchar](50) NULL,
	[LoaiMonAn_ID] [int] NULL,
	[Gia] [money] NULL,
 CONSTRAINT [PK_MONAN] PRIMARY KEY CLUSTERED 
(
	[MonAn_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NGUYENLIEU]    Script Date: 3/12/2019 9:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NGUYENLIEU](
	[NguyenLieu_ID] [int] IDENTITY(1,1) NOT NULL,
	[LoaiNguyenLieu_ID] [int] NULL,
	[TenNguyenLieu] [nvarchar](100) NULL,
	[DonViTinh] [nvarchar](50) NULL,
	[SoLuong] [int] NULL,
 CONSTRAINT [PK_NGUYENLIEU] PRIMARY KEY CLUSTERED 
(
	[NguyenLieu_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NHACUNGCAP]    Script Date: 3/12/2019 9:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHACUNGCAP](
	[NhaCungCap_ID] [int] IDENTITY(1,1) NOT NULL,
	[TenNCC] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](100) NULL,
	[SoDienThoai] [nvarchar](10) NULL,
 CONSTRAINT [PK_NHACUNGCAP] PRIMARY KEY CLUSTERED 
(
	[NhaCungCap_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NHANVIEN]    Script Date: 3/12/2019 9:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHANVIEN](
	[NhanVien_ID] [int] IDENTITY(1,1) NOT NULL,
	[TenNhanVien] [nvarchar](100) NULL,
	[Email] [nvarchar](50) NULL,
	[SoDienThoai] [nvarchar](10) NULL,
	[DiaChi] [nvarchar](100) NULL,
	[MatKhau] [nvarchar](20) NULL,
	[TrangThai] [bit] NULL,
	[HoNhanVien] [nvarchar](100) NULL,
 CONSTRAINT [PK_NHANVIEN] PRIMARY KEY CLUSTERED 
(
	[NhanVien_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PHIEUNHAPKHO]    Script Date: 3/12/2019 9:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHIEUNHAPKHO](
	[PhieuNhapKho_ID] [int] IDENTITY(1,1) NOT NULL,
	[NhaCungCap_ID] [int] NULL,
	[NhanVien_ID] [int] NULL,
	[NgayLap] [date] NULL,
 CONSTRAINT [PK_PHIEUNHAPKHO] PRIMARY KEY CLUSTERED 
(
	[PhieuNhapKho_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PHIEUXUATKHO]    Script Date: 3/12/2019 9:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHIEUXUATKHO](
	[PhieuXuatKho_ID] [int] IDENTITY(1,1) NOT NULL,
	[NhanVien_ID] [int] NULL,
	[NgayXuat] [date] NULL,
 CONSTRAINT [PK_PHIEUXUATKHO] PRIMARY KEY CLUSTERED 
(
	[PhieuXuatKho_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[THANHPHANMONAN]    Script Date: 3/12/2019 9:30:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THANHPHANMONAN](
	[NguyenLieu_ID] [int] NOT NULL,
	[MonAn_ID] [int] NOT NULL,
	[SoLuong] [float] NULL,
 CONSTRAINT [PK_THANHPHANMONAN] PRIMARY KEY CLUSTERED 
(
	[NguyenLieu_ID] ASC,
	[MonAn_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[CHITIETDONDATHANG]  WITH CHECK ADD  CONSTRAINT [FK_CHITIETDONDATHANG_DONDATHANG] FOREIGN KEY([DonDatHang_ID])
REFERENCES [dbo].[DONDATHANG] ([DonDatHang_ID])
GO
ALTER TABLE [dbo].[CHITIETDONDATHANG] CHECK CONSTRAINT [FK_CHITIETDONDATHANG_DONDATHANG]
GO
ALTER TABLE [dbo].[CHITIETDONDATHANG]  WITH CHECK ADD  CONSTRAINT [FK_CHITIETDONDATHANG_NGUYENLIEU] FOREIGN KEY([NguyenLieu_ID])
REFERENCES [dbo].[NGUYENLIEU] ([NguyenLieu_ID])
GO
ALTER TABLE [dbo].[CHITIETDONDATHANG] CHECK CONSTRAINT [FK_CHITIETDONDATHANG_NGUYENLIEU]
GO
ALTER TABLE [dbo].[CHITIETDONGIAOHANG]  WITH CHECK ADD  CONSTRAINT [FK_CHITIETDONGIAOHANG_DONGIAOHANG] FOREIGN KEY([DonGiaoHang_ID])
REFERENCES [dbo].[DONGIAOHANG] ([DonGiaoHang_ID])
GO
ALTER TABLE [dbo].[CHITIETDONGIAOHANG] CHECK CONSTRAINT [FK_CHITIETDONGIAOHANG_DONGIAOHANG]
GO
ALTER TABLE [dbo].[CHITIETDONGIAOHANG]  WITH CHECK ADD  CONSTRAINT [FK_CHITIETDONGIAOHANG_NGUYENLIEU] FOREIGN KEY([NguyenLieu_ID])
REFERENCES [dbo].[NGUYENLIEU] ([NguyenLieu_ID])
GO
ALTER TABLE [dbo].[CHITIETDONGIAOHANG] CHECK CONSTRAINT [FK_CHITIETDONGIAOHANG_NGUYENLIEU]
GO
ALTER TABLE [dbo].[CHITIETHOADON]  WITH CHECK ADD  CONSTRAINT [FK_CHITIETHOADON_HOADON] FOREIGN KEY([HoaDon_ID])
REFERENCES [dbo].[HOADON] ([HoaDon_ID])
GO
ALTER TABLE [dbo].[CHITIETHOADON] CHECK CONSTRAINT [FK_CHITIETHOADON_HOADON]
GO
ALTER TABLE [dbo].[CHITIETHOADON]  WITH CHECK ADD  CONSTRAINT [FK_CHITIETHOADON_MONAN] FOREIGN KEY([MonAn_ID])
REFERENCES [dbo].[MONAN] ([MonAn_ID])
GO
ALTER TABLE [dbo].[CHITIETHOADON] CHECK CONSTRAINT [FK_CHITIETHOADON_MONAN]
GO
ALTER TABLE [dbo].[CHITIETHOPDONG]  WITH CHECK ADD  CONSTRAINT [FK_CHITIETHOPDONG_HOPDONG] FOREIGN KEY([HopDong_ID])
REFERENCES [dbo].[HOPDONG] ([HopDong_ID])
GO
ALTER TABLE [dbo].[CHITIETHOPDONG] CHECK CONSTRAINT [FK_CHITIETHOPDONG_HOPDONG]
GO
ALTER TABLE [dbo].[CHITIETHOPDONG]  WITH CHECK ADD  CONSTRAINT [FK_CHITIETHOPDONG_NGUYENLIEU] FOREIGN KEY([NguyenLieu_ID])
REFERENCES [dbo].[NGUYENLIEU] ([NguyenLieu_ID])
GO
ALTER TABLE [dbo].[CHITIETHOPDONG] CHECK CONSTRAINT [FK_CHITIETHOPDONG_NGUYENLIEU]
GO
ALTER TABLE [dbo].[CHITIETPHIEUNHAPKHO]  WITH CHECK ADD  CONSTRAINT [FK_CHITIETPHIEUNHAPKHO_NGUYENLIEU] FOREIGN KEY([NguyenLieu_ID])
REFERENCES [dbo].[NGUYENLIEU] ([NguyenLieu_ID])
GO
ALTER TABLE [dbo].[CHITIETPHIEUNHAPKHO] CHECK CONSTRAINT [FK_CHITIETPHIEUNHAPKHO_NGUYENLIEU]
GO
ALTER TABLE [dbo].[CHITIETPHIEUNHAPKHO]  WITH CHECK ADD  CONSTRAINT [FK_CHITIETPHIEUNHAPKHO_PHIEUNHAPKHO] FOREIGN KEY([PhieuNhapKho_ID])
REFERENCES [dbo].[PHIEUNHAPKHO] ([PhieuNhapKho_ID])
GO
ALTER TABLE [dbo].[CHITIETPHIEUNHAPKHO] CHECK CONSTRAINT [FK_CHITIETPHIEUNHAPKHO_PHIEUNHAPKHO]
GO
ALTER TABLE [dbo].[CHITIETPHIEUXUATKHO]  WITH CHECK ADD  CONSTRAINT [FK_CHITIETPHIEUXUATKHO_NGUYENLIEU] FOREIGN KEY([NguyenLieu_ID])
REFERENCES [dbo].[NGUYENLIEU] ([NguyenLieu_ID])
GO
ALTER TABLE [dbo].[CHITIETPHIEUXUATKHO] CHECK CONSTRAINT [FK_CHITIETPHIEUXUATKHO_NGUYENLIEU]
GO
ALTER TABLE [dbo].[CHITIETPHIEUXUATKHO]  WITH CHECK ADD  CONSTRAINT [FK_CHITIETPHIEUXUATKHO_PHIEUXUATKHO] FOREIGN KEY([PhieuXuatKho_ID])
REFERENCES [dbo].[PHIEUXUATKHO] ([PhieuXuatKho_ID])
GO
ALTER TABLE [dbo].[CHITIETPHIEUXUATKHO] CHECK CONSTRAINT [FK_CHITIETPHIEUXUATKHO_PHIEUXUATKHO]
GO
ALTER TABLE [dbo].[DONDATHANG]  WITH CHECK ADD  CONSTRAINT [FK_DONDATHANG_NHACUNGCAP] FOREIGN KEY([NhaCungCap_ID])
REFERENCES [dbo].[NHACUNGCAP] ([NhaCungCap_ID])
GO
ALTER TABLE [dbo].[DONDATHANG] CHECK CONSTRAINT [FK_DONDATHANG_NHACUNGCAP]
GO
ALTER TABLE [dbo].[DONDATHANG]  WITH CHECK ADD  CONSTRAINT [FK_DONDATHANG_NHANVIEN] FOREIGN KEY([NhanVien_ID])
REFERENCES [dbo].[NHANVIEN] ([NhanVien_ID])
GO
ALTER TABLE [dbo].[DONDATHANG] CHECK CONSTRAINT [FK_DONDATHANG_NHANVIEN]
GO
ALTER TABLE [dbo].[DONGIAOHANG]  WITH CHECK ADD  CONSTRAINT [FK_DONGIAOHANG_DONDATHANG] FOREIGN KEY([DonDatHang_ID])
REFERENCES [dbo].[DONDATHANG] ([DonDatHang_ID])
GO
ALTER TABLE [dbo].[DONGIAOHANG] CHECK CONSTRAINT [FK_DONGIAOHANG_DONDATHANG]
GO
ALTER TABLE [dbo].[DONGIAOHANG]  WITH CHECK ADD  CONSTRAINT [FK_DONGIAOHANG_NHACUNGCAP] FOREIGN KEY([NhaCungCap_ID])
REFERENCES [dbo].[NHACUNGCAP] ([NhaCungCap_ID])
GO
ALTER TABLE [dbo].[DONGIAOHANG] CHECK CONSTRAINT [FK_DONGIAOHANG_NHACUNGCAP]
GO
ALTER TABLE [dbo].[HOADON]  WITH CHECK ADD  CONSTRAINT [FK_HOADON_BAN] FOREIGN KEY([Ban_ID])
REFERENCES [dbo].[BAN] ([Ban_ID])
GO
ALTER TABLE [dbo].[HOADON] CHECK CONSTRAINT [FK_HOADON_BAN]
GO
ALTER TABLE [dbo].[HOADON]  WITH CHECK ADD  CONSTRAINT [FK_HOADON_KHACHHANG] FOREIGN KEY([KhachHang_ID])
REFERENCES [dbo].[KHACHHANG] ([KhachHang_ID])
GO
ALTER TABLE [dbo].[HOADON] CHECK CONSTRAINT [FK_HOADON_KHACHHANG]
GO
ALTER TABLE [dbo].[HOADON]  WITH CHECK ADD  CONSTRAINT [FK_HOADON_NHANVIEN] FOREIGN KEY([NhanVien_ID])
REFERENCES [dbo].[NHANVIEN] ([NhanVien_ID])
GO
ALTER TABLE [dbo].[HOADON] CHECK CONSTRAINT [FK_HOADON_NHANVIEN]
GO
ALTER TABLE [dbo].[HOPDONG]  WITH CHECK ADD  CONSTRAINT [FK_HOPDONG_NHACUNGCAP] FOREIGN KEY([NhaCungCap_ID])
REFERENCES [dbo].[NHACUNGCAP] ([NhaCungCap_ID])
GO
ALTER TABLE [dbo].[HOPDONG] CHECK CONSTRAINT [FK_HOPDONG_NHACUNGCAP]
GO
ALTER TABLE [dbo].[HOPDONG]  WITH CHECK ADD  CONSTRAINT [FK_HOPDONG_NHANVIEN] FOREIGN KEY([NhanVien_ID])
REFERENCES [dbo].[NHANVIEN] ([NhanVien_ID])
GO
ALTER TABLE [dbo].[HOPDONG] CHECK CONSTRAINT [FK_HOPDONG_NHANVIEN]
GO
ALTER TABLE [dbo].[MONAN]  WITH CHECK ADD  CONSTRAINT [FK_MONAN_LOAIMONAN] FOREIGN KEY([LoaiMonAn_ID])
REFERENCES [dbo].[LOAIMONAN] ([LoaiMonAn_ID])
GO
ALTER TABLE [dbo].[MONAN] CHECK CONSTRAINT [FK_MONAN_LOAIMONAN]
GO
ALTER TABLE [dbo].[NGUYENLIEU]  WITH CHECK ADD  CONSTRAINT [FK_NGUYENLIEU_LOAINGUYENLIEU] FOREIGN KEY([LoaiNguyenLieu_ID])
REFERENCES [dbo].[LOAINGUYENLIEU] ([LoaiNguyenLieu_ID])
GO
ALTER TABLE [dbo].[NGUYENLIEU] CHECK CONSTRAINT [FK_NGUYENLIEU_LOAINGUYENLIEU]
GO
ALTER TABLE [dbo].[PHIEUNHAPKHO]  WITH CHECK ADD  CONSTRAINT [FK_PHIEUNHAPKHO_NHACUNGCAP] FOREIGN KEY([NhaCungCap_ID])
REFERENCES [dbo].[NHACUNGCAP] ([NhaCungCap_ID])
GO
ALTER TABLE [dbo].[PHIEUNHAPKHO] CHECK CONSTRAINT [FK_PHIEUNHAPKHO_NHACUNGCAP]
GO
ALTER TABLE [dbo].[PHIEUNHAPKHO]  WITH CHECK ADD  CONSTRAINT [FK_PHIEUNHAPKHO_NHANVIEN] FOREIGN KEY([NhanVien_ID])
REFERENCES [dbo].[NHANVIEN] ([NhanVien_ID])
GO
ALTER TABLE [dbo].[PHIEUNHAPKHO] CHECK CONSTRAINT [FK_PHIEUNHAPKHO_NHANVIEN]
GO
ALTER TABLE [dbo].[PHIEUXUATKHO]  WITH CHECK ADD  CONSTRAINT [FK_PHIEUXUATKHO_NHANVIEN] FOREIGN KEY([NhanVien_ID])
REFERENCES [dbo].[NHANVIEN] ([NhanVien_ID])
GO
ALTER TABLE [dbo].[PHIEUXUATKHO] CHECK CONSTRAINT [FK_PHIEUXUATKHO_NHANVIEN]
GO
ALTER TABLE [dbo].[THANHPHANMONAN]  WITH CHECK ADD  CONSTRAINT [FK_THANHPHANMONAN_MONAN] FOREIGN KEY([MonAn_ID])
REFERENCES [dbo].[MONAN] ([MonAn_ID])
GO
ALTER TABLE [dbo].[THANHPHANMONAN] CHECK CONSTRAINT [FK_THANHPHANMONAN_MONAN]
GO
ALTER TABLE [dbo].[THANHPHANMONAN]  WITH CHECK ADD  CONSTRAINT [FK_THANHPHANMONAN_NGUYENLIEU] FOREIGN KEY([NguyenLieu_ID])
REFERENCES [dbo].[NGUYENLIEU] ([NguyenLieu_ID])
GO
ALTER TABLE [dbo].[THANHPHANMONAN] CHECK CONSTRAINT [FK_THANHPHANMONAN_NGUYENLIEU]
GO
USE [master]
GO
ALTER DATABASE [QLNH] SET  READ_WRITE 
GO
