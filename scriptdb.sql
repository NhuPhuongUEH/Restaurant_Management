USE [master]
GO
/****** Object:  Database [SpyRes]    Script Date: 3/4/2019 11:20:33 PM ******/
CREATE DATABASE [SpyRes]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SpyRes', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SpyRes.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SpyRes_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SpyRes_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SpyRes] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SpyRes].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SpyRes] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SpyRes] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SpyRes] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SpyRes] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SpyRes] SET ARITHABORT OFF 
GO
ALTER DATABASE [SpyRes] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SpyRes] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SpyRes] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SpyRes] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SpyRes] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SpyRes] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SpyRes] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SpyRes] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SpyRes] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SpyRes] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SpyRes] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SpyRes] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SpyRes] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SpyRes] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SpyRes] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SpyRes] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SpyRes] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SpyRes] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SpyRes] SET  MULTI_USER 
GO
ALTER DATABASE [SpyRes] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SpyRes] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SpyRes] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SpyRes] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SpyRes] SET DELAYED_DURABILITY = DISABLED 
GO
USE [SpyRes]
GO
/****** Object:  Table [dbo].[BAN]    Script Date: 3/4/2019 11:20:33 PM ******/
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
/****** Object:  Table [dbo].[CHITIETDONDATHANG]    Script Date: 3/4/2019 11:20:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHITIETDONDATHANG](
	[ChiTietDonDatHang_ID] [int] IDENTITY(1,1) NOT NULL,
	[DonDatHang_ID] [int] NULL,
	[NguyenLieu_ID] [int] NULL,
	[SoLuong] [int] NULL,
	[DonVi] [nvarchar](50) NULL,
 CONSTRAINT [PK_CHITIETDONDATHANG] PRIMARY KEY CLUSTERED 
(
	[ChiTietDonDatHang_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CHITIETDONGIAOHANG]    Script Date: 3/4/2019 11:20:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHITIETDONGIAOHANG](
	[ChiTietDonGiaoHang_ID] [int] IDENTITY(1,1) NOT NULL,
	[DonGiaoHang_ID] [int] NULL,
	[NguyenLieu_ID] [int] NULL,
	[SoLuong] [int] NULL,
	[DonGia] [float] NULL,
	[DonVi] [nvarchar](50) NULL,
 CONSTRAINT [PK_CHITIETDONGIAOHANG] PRIMARY KEY CLUSTERED 
(
	[ChiTietDonGiaoHang_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CHITIETHOADON]    Script Date: 3/4/2019 11:20:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHITIETHOADON](
	[ChiTietHoaDon_ID] [int] IDENTITY(1,1) NOT NULL,
	[HoaDon_ID] [int] NULL,
	[MonAn_ID] [int] NULL,
	[SoLuong] [int] NULL,
	[DonGia] [float] NULL,
 CONSTRAINT [PK_CHITIETHOADON] PRIMARY KEY CLUSTERED 
(
	[ChiTietHoaDon_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CHITIETHOPDONG]    Script Date: 3/4/2019 11:20:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHITIETHOPDONG](
	[ChiTietHopDong_ID] [int] IDENTITY(1,1) NOT NULL,
	[HopDong_ID] [int] NULL,
	[NguyenLieu_ID] [int] NULL,
	[DonVi] [nvarchar](50) NULL,
	[SoLuong] [int] NULL,
 CONSTRAINT [PK_CHITIETHOPDONG] PRIMARY KEY CLUSTERED 
(
	[ChiTietHopDong_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CHITIETPHIEUNHAPKHO]    Script Date: 3/4/2019 11:20:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHITIETPHIEUNHAPKHO](
	[ChiTietPhieuNhapKho_ID] [int] IDENTITY(1,1) NOT NULL,
	[PhieuNhapKho_ID] [int] NULL,
	[NguyenLieu_ID] [int] NULL,
	[SoLuong] [int] NULL,
	[DonVi] [nvarchar](50) NULL,
 CONSTRAINT [PK_CHITIETPHIEUNHAPKHO] PRIMARY KEY CLUSTERED 
(
	[ChiTietPhieuNhapKho_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CHITIETPHIEUXUATKHO]    Script Date: 3/4/2019 11:20:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHITIETPHIEUXUATKHO](
	[ChiTietPhieuXuatKho_ID] [int] IDENTITY(1,1) NOT NULL,
	[PhieuXuatKho_ID] [int] NULL,
	[NguyenLieu_ID] [int] NULL,
	[SoLuongXuat] [int] NULL,
	[DonVi] [nvarchar](50) NULL,
	[Gia] [float] NULL,
 CONSTRAINT [PK_CHITIETPHIEUXUATKHO] PRIMARY KEY CLUSTERED 
(
	[ChiTietPhieuXuatKho_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DONDATHANG]    Script Date: 3/4/2019 11:20:33 PM ******/
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
/****** Object:  Table [dbo].[DONGIAOHANG]    Script Date: 3/4/2019 11:20:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DONGIAOHANG](
	[DonGiaoHang_ID] [int] IDENTITY(1,1) NOT NULL,
	[NhaCungCap_ID] [int] NOT NULL,
	[DonDatHang_ID] [int] NULL,
	[NgayGiao] [datetime] NULL,
	[SoDienThoai] [nvarchar](10) NULL,
 CONSTRAINT [PK_DONGIAOHANG] PRIMARY KEY CLUSTERED 
(
	[DonGiaoHang_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HOADON]    Script Date: 3/4/2019 11:20:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOADON](
	[HoaDon_ID] [int] IDENTITY(1,1) NOT NULL,
	[Ngay] [datetime] NULL,
	[TrangThai] [bit] NULL,
	[Ban_ID] [int] NULL,
	[NhanVien_ID] [int] NULL,
	[KhachHang_ID] [int] NULL,
	[GhiChu] [nvarchar](255) NULL,
 CONSTRAINT [PK_HOADON] PRIMARY KEY CLUSTERED 
(
	[HoaDon_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HOPDONG]    Script Date: 3/4/2019 11:20:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOPDONG](
	[HopDong_ID] [int] IDENTITY(1,1) NOT NULL,
	[NhanVien_ID] [int] NULL,
	[NhaCungCap_ID] [int] NULL,
	[TenHopDong] [nvarchar](50) NULL,
	[NgayLap] [datetime] NULL,
	[NgayKetThuc] [datetime] NULL,
 CONSTRAINT [PK_HOPDONG] PRIMARY KEY CLUSTERED 
(
	[HopDong_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 3/4/2019 11:20:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHACHHANG](
	[KhachHang_ID] [int] IDENTITY(1,1) NOT NULL,
	[HoKhachHang] [nvarchar](255) NULL,
	[TenKhachHang] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[DienThoai] [nvarchar](10) NULL,
	[GhiChu] [nvarchar](50) NULL,
 CONSTRAINT [PK_KHACHHANG] PRIMARY KEY CLUSTERED 
(
	[KhachHang_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LOAIMONAN]    Script Date: 3/4/2019 11:20:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOAIMONAN](
	[LoaiMonAn_ID] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](255) NULL,
 CONSTRAINT [PK_LOAIMONAN] PRIMARY KEY CLUSTERED 
(
	[LoaiMonAn_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MONAN]    Script Date: 3/4/2019 11:20:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MONAN](
	[MonAn_ID] [int] IDENTITY(1,1) NOT NULL,
	[TenMonAn] [nvarchar](255) NULL,
	[MoTa] [nvarchar](max) NULL,
	[Hinh] [nvarchar](max) NULL,
	[TrangThai] [nvarchar](100) NULL,
	[Gia] [float] NULL,
	[LoaiMonAn_ID] [int] NULL,
 CONSTRAINT [PK_MONAN] PRIMARY KEY CLUSTERED 
(
	[MonAn_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NGUYENLIEU]    Script Date: 3/4/2019 11:20:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NGUYENLIEU](
	[NguyenLieu_ID] [int] IDENTITY(1,1) NOT NULL,
	[TenNguyenLieu] [nvarchar](255) NULL,
	[DonVi] [nvarchar](50) NULL,
	[SoLuong] [int] NULL,
 CONSTRAINT [PK_NGUYENLIEU] PRIMARY KEY CLUSTERED 
(
	[NguyenLieu_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NHACUNGCAP]    Script Date: 3/4/2019 11:20:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHACUNGCAP](
	[NhaCungCap_ID] [int] IDENTITY(1,1) NOT NULL,
	[TenNCC] [nvarchar](255) NULL,
	[DiaChi] [nvarchar](255) NULL,
	[SoDienThoai] [nvarchar](10) NULL,
 CONSTRAINT [PK_NHACUNGCAP] PRIMARY KEY CLUSTERED 
(
	[NhaCungCap_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NHANVIEN]    Script Date: 3/4/2019 11:20:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHANVIEN](
	[NhanVien_ID] [int] IDENTITY(1,1) NOT NULL,
	[TenNhanVien] [nvarchar](50) NULL,
	[HoNhanVien] [nvarchar](255) NULL,
	[Email] [nvarchar](100) NULL,
	[DiaChi] [nvarchar](100) NULL,
	[MatKhau] [nvarchar](50) NULL,
	[TrangThai] [bit] NULL,
 CONSTRAINT [PK_NHANVIEN] PRIMARY KEY CLUSTERED 
(
	[NhanVien_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PHIEUNHAPKHO]    Script Date: 3/4/2019 11:20:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHIEUNHAPKHO](
	[PhieuNhapKho_ID] [int] IDENTITY(1,1) NOT NULL,
	[NhaCungCap_ID] [int] NULL,
	[NhanVien_ID] [int] NULL,
	[NgayLap] [datetime] NULL,
 CONSTRAINT [PK_PHIEUNHAPKHO] PRIMARY KEY CLUSTERED 
(
	[PhieuNhapKho_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PHIEUXUATKHO]    Script Date: 3/4/2019 11:20:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHIEUXUATKHO](
	[PhieuXuatKho_ID] [int] IDENTITY(1,1) NOT NULL,
	[NhanVien_ID] [int] NULL,
	[NgayXuat] [datetime] NULL,
 CONSTRAINT [PK_PHIEUXUATKHO] PRIMARY KEY CLUSTERED 
(
	[PhieuXuatKho_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[THANHPHANMONAN]    Script Date: 3/4/2019 11:20:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THANHPHANMONAN](
	[CongThuc_ID] [int] IDENTITY(1,1) NOT NULL,
	[NguyenLieu_ID] [int] NULL,
	[MonAn_ID] [int] NULL,
	[SoLuong] [float] NULL,
 CONSTRAINT [PK_THANHPHANMONAN] PRIMARY KEY CLUSTERED 
(
	[CongThuc_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[BAN] ON 

INSERT [dbo].[BAN] ([Ban_ID], [SoBan], [TrangThai], [HoaDonDangPhucVu]) VALUES (1, 1, 0, NULL)
INSERT [dbo].[BAN] ([Ban_ID], [SoBan], [TrangThai], [HoaDonDangPhucVu]) VALUES (2, 2, 0, NULL)
INSERT [dbo].[BAN] ([Ban_ID], [SoBan], [TrangThai], [HoaDonDangPhucVu]) VALUES (3, 3, 0, NULL)
INSERT [dbo].[BAN] ([Ban_ID], [SoBan], [TrangThai], [HoaDonDangPhucVu]) VALUES (4, 4, 0, NULL)
INSERT [dbo].[BAN] ([Ban_ID], [SoBan], [TrangThai], [HoaDonDangPhucVu]) VALUES (5, 5, 0, NULL)
INSERT [dbo].[BAN] ([Ban_ID], [SoBan], [TrangThai], [HoaDonDangPhucVu]) VALUES (6, 6, 0, NULL)
INSERT [dbo].[BAN] ([Ban_ID], [SoBan], [TrangThai], [HoaDonDangPhucVu]) VALUES (7, 7, 0, NULL)
INSERT [dbo].[BAN] ([Ban_ID], [SoBan], [TrangThai], [HoaDonDangPhucVu]) VALUES (8, 8, 0, NULL)
INSERT [dbo].[BAN] ([Ban_ID], [SoBan], [TrangThai], [HoaDonDangPhucVu]) VALUES (9, 9, 0, NULL)
INSERT [dbo].[BAN] ([Ban_ID], [SoBan], [TrangThai], [HoaDonDangPhucVu]) VALUES (10, 10, 0, NULL)
SET IDENTITY_INSERT [dbo].[BAN] OFF
SET IDENTITY_INSERT [dbo].[CHITIETHOADON] ON 

INSERT [dbo].[CHITIETHOADON] ([ChiTietHoaDon_ID], [HoaDon_ID], [MonAn_ID], [SoLuong], [DonGia]) VALUES (1, 1, 1, 1, 35000)
INSERT [dbo].[CHITIETHOADON] ([ChiTietHoaDon_ID], [HoaDon_ID], [MonAn_ID], [SoLuong], [DonGia]) VALUES (2, 1, 10, 1, 8000)
SET IDENTITY_INSERT [dbo].[CHITIETHOADON] OFF
SET IDENTITY_INSERT [dbo].[HOADON] ON 

INSERT [dbo].[HOADON] ([HoaDon_ID], [Ngay], [TrangThai], [Ban_ID], [NhanVien_ID], [KhachHang_ID], [GhiChu]) VALUES (1, CAST(N'2019-03-02 00:00:00.000' AS DateTime), 0, 1, 1, 1, N'không')
SET IDENTITY_INSERT [dbo].[HOADON] OFF
SET IDENTITY_INSERT [dbo].[KHACHHANG] ON 

INSERT [dbo].[KHACHHANG] ([KhachHang_ID], [HoKhachHang], [TenKhachHang], [Email], [DiaChi], [DienThoai], [GhiChu]) VALUES (1, N'Nguyễn', N'Minh', N'minh@gmail.com', N'Hồ Chí Minh', N'0563896123', N'không')
INSERT [dbo].[KHACHHANG] ([KhachHang_ID], [HoKhachHang], [TenKhachHang], [Email], [DiaChi], [DienThoai], [GhiChu]) VALUES (2, N'Dương', N'Ngọc', N'ngoc@gmail.com', N'Vũng Tàu', N'0963562123', N'không')
INSERT [dbo].[KHACHHANG] ([KhachHang_ID], [HoKhachHang], [TenKhachHang], [Email], [DiaChi], [DienThoai], [GhiChu]) VALUES (3, N'Bùi', N'Khang', N'khang@gmail.com', N'Ninh Thuận', N'0896325652', N'không')
SET IDENTITY_INSERT [dbo].[KHACHHANG] OFF
SET IDENTITY_INSERT [dbo].[LOAIMONAN] ON 

INSERT [dbo].[LOAIMONAN] ([LoaiMonAn_ID], [TenLoai]) VALUES (1, N'Cơm')
INSERT [dbo].[LOAIMONAN] ([LoaiMonAn_ID], [TenLoai]) VALUES (2, N'Món nước')
INSERT [dbo].[LOAIMONAN] ([LoaiMonAn_ID], [TenLoai]) VALUES (3, N'Nước giải khát')
SET IDENTITY_INSERT [dbo].[LOAIMONAN] OFF
SET IDENTITY_INSERT [dbo].[MONAN] ON 

INSERT [dbo].[MONAN] ([MonAn_ID], [TenMonAn], [MoTa], [Hinh], [TrangThai], [Gia], [LoaiMonAn_ID]) VALUES (1, N'Phở bò', N'phở thơm ngon, bánh phở mềm dai, bò tươi mới', N'phobo.jpg', N'đang kinh doanh', 35000, 2)
INSERT [dbo].[MONAN] ([MonAn_ID], [TenMonAn], [MoTa], [Hinh], [TrangThai], [Gia], [LoaiMonAn_ID]) VALUES (2, N'Hủ tiếu', N'hủ tiếu nam vang, hương vị quê hương ', N'hutieu.jpg', N'đang kinh doanh', 35000, 2)
INSERT [dbo].[MONAN] ([MonAn_ID], [TenMonAn], [MoTa], [Hinh], [TrangThai], [Gia], [LoaiMonAn_ID]) VALUES (3, N'Cơm bò xào', N'cơm bò xào với hạt cơm dẻo, bò tươi kết hợp với các loại rau củ ', N'comboxao.jpg', N'đang kinh doanh', 35000, 1)
INSERT [dbo].[MONAN] ([MonAn_ID], [TenMonAn], [MoTa], [Hinh], [TrangThai], [Gia], [LoaiMonAn_ID]) VALUES (4, N'Cơm tấm', N'cơm với hạt gạo dẻo thơm, sườn nướng đậm đà', N'comtam.jpg', N'ngừng kinh doanh', 25000, 1)
INSERT [dbo].[MONAN] ([MonAn_ID], [TenMonAn], [MoTa], [Hinh], [TrangThai], [Gia], [LoaiMonAn_ID]) VALUES (5, N'Cơm chiên dương châu', N'cơm được chiên với rau củ, thịt heo xá xíu', N'comchienduongchau.jpg', N'đang kinh doanh', 25000, 1)
INSERT [dbo].[MONAN] ([MonAn_ID], [TenMonAn], [MoTa], [Hinh], [TrangThai], [Gia], [LoaiMonAn_ID]) VALUES (6, N'Bánh canh cua', N'bánh canh được nấu chung với cua biển, chả cua', N'banhcanhcua.jpg', N'đang kinh doanh', 25000, 2)
INSERT [dbo].[MONAN] ([MonAn_ID], [TenMonAn], [MoTa], [Hinh], [TrangThai], [Gia], [LoaiMonAn_ID]) VALUES (7, N'Bún bò', N'bún bò hương vị Huế đặc sắc', N'bunbo.jpg', N'ngừng kinh doanh', 30000, 2)
INSERT [dbo].[MONAN] ([MonAn_ID], [TenMonAn], [MoTa], [Hinh], [TrangThai], [Gia], [LoaiMonAn_ID]) VALUES (8, N'7up', N'nước có gas được giới trẻ yêu thích', N'7up.jpg', N'đang kinh doanh', 10000, 3)
INSERT [dbo].[MONAN] ([MonAn_ID], [TenMonAn], [MoTa], [Hinh], [TrangThai], [Gia], [LoaiMonAn_ID]) VALUES (9, N'Coca Cola', N'nước có gas được giới trẻ yêu thích', N'coca.jpg', N'đang kinh doanh', 10000, 3)
INSERT [dbo].[MONAN] ([MonAn_ID], [TenMonAn], [MoTa], [Hinh], [TrangThai], [Gia], [LoaiMonAn_ID]) VALUES (10, N'Nước mía', N'loại nước mát được nhiều người ưa chuộng', N'nuocmia.jpg', N'đang kinh doanh', 8000, 3)
INSERT [dbo].[MONAN] ([MonAn_ID], [TenMonAn], [MoTa], [Hinh], [TrangThai], [Gia], [LoaiMonAn_ID]) VALUES (11, N'Trà đá', N'loại nước được nhiều người uống nhất', N'trada.jpg', N'đang kinh doanh', 5000, 3)
SET IDENTITY_INSERT [dbo].[MONAN] OFF
SET IDENTITY_INSERT [dbo].[NGUYENLIEU] ON 

INSERT [dbo].[NGUYENLIEU] ([NguyenLieu_ID], [TenNguyenLieu], [DonVi], [SoLuong]) VALUES (1, N'thịt bò', N'kg', 50)
INSERT [dbo].[NGUYENLIEU] ([NguyenLieu_ID], [TenNguyenLieu], [DonVi], [SoLuong]) VALUES (2, N'thịt heo', N'kg', 50)
INSERT [dbo].[NGUYENLIEU] ([NguyenLieu_ID], [TenNguyenLieu], [DonVi], [SoLuong]) VALUES (3, N'thịt càng cua', N'kg', 40)
INSERT [dbo].[NGUYENLIEU] ([NguyenLieu_ID], [TenNguyenLieu], [DonVi], [SoLuong]) VALUES (4, N'tôm sú', N'kg', 15)
INSERT [dbo].[NGUYENLIEU] ([NguyenLieu_ID], [TenNguyenLieu], [DonVi], [SoLuong]) VALUES (5, N'rau húng quế', N'kg', 5)
INSERT [dbo].[NGUYENLIEU] ([NguyenLieu_ID], [TenNguyenLieu], [DonVi], [SoLuong]) VALUES (6, N'rau om', N'kg', 5)
INSERT [dbo].[NGUYENLIEU] ([NguyenLieu_ID], [TenNguyenLieu], [DonVi], [SoLuong]) VALUES (7, N'gừng', N'kg', 5)
INSERT [dbo].[NGUYENLIEU] ([NguyenLieu_ID], [TenNguyenLieu], [DonVi], [SoLuong]) VALUES (8, N'hành lá', N'kg', 7)
INSERT [dbo].[NGUYENLIEU] ([NguyenLieu_ID], [TenNguyenLieu], [DonVi], [SoLuong]) VALUES (9, N'giá sống', N'kg', 4)
INSERT [dbo].[NGUYENLIEU] ([NguyenLieu_ID], [TenNguyenLieu], [DonVi], [SoLuong]) VALUES (10, N'tần ô', N'kg', 3)
INSERT [dbo].[NGUYENLIEU] ([NguyenLieu_ID], [TenNguyenLieu], [DonVi], [SoLuong]) VALUES (11, N'bún', N'kg', 15)
INSERT [dbo].[NGUYENLIEU] ([NguyenLieu_ID], [TenNguyenLieu], [DonVi], [SoLuong]) VALUES (12, N'sả', N'kg', 5)
INSERT [dbo].[NGUYENLIEU] ([NguyenLieu_ID], [TenNguyenLieu], [DonVi], [SoLuong]) VALUES (13, N'trứng cút', N'quả', 150)
INSERT [dbo].[NGUYENLIEU] ([NguyenLieu_ID], [TenNguyenLieu], [DonVi], [SoLuong]) VALUES (14, N'gân bò', N'kg', 10)
INSERT [dbo].[NGUYENLIEU] ([NguyenLieu_ID], [TenNguyenLieu], [DonVi], [SoLuong]) VALUES (15, N'bắp bò', N'kg', 15)
INSERT [dbo].[NGUYENLIEU] ([NguyenLieu_ID], [TenNguyenLieu], [DonVi], [SoLuong]) VALUES (16, N'thảo quả', N'kg', 5)
INSERT [dbo].[NGUYENLIEU] ([NguyenLieu_ID], [TenNguyenLieu], [DonVi], [SoLuong]) VALUES (17, N'hoa hồi', N'kg', 5)
INSERT [dbo].[NGUYENLIEU] ([NguyenLieu_ID], [TenNguyenLieu], [DonVi], [SoLuong]) VALUES (18, N'quế', N'kg', 5)
INSERT [dbo].[NGUYENLIEU] ([NguyenLieu_ID], [TenNguyenLieu], [DonVi], [SoLuong]) VALUES (19, N'gạo', N'kg', 5)
INSERT [dbo].[NGUYENLIEU] ([NguyenLieu_ID], [TenNguyenLieu], [DonVi], [SoLuong]) VALUES (20, N'cốt lết heo', N'kg', 60)
INSERT [dbo].[NGUYENLIEU] ([NguyenLieu_ID], [TenNguyenLieu], [DonVi], [SoLuong]) VALUES (21, N'dưa leo', N'kg', 5)
INSERT [dbo].[NGUYENLIEU] ([NguyenLieu_ID], [TenNguyenLieu], [DonVi], [SoLuong]) VALUES (22, N'cà chua', N'kg', 9)
INSERT [dbo].[NGUYENLIEU] ([NguyenLieu_ID], [TenNguyenLieu], [DonVi], [SoLuong]) VALUES (23, N'bánh phở ', N'kg', 15)
SET IDENTITY_INSERT [dbo].[NGUYENLIEU] OFF
SET IDENTITY_INSERT [dbo].[NHACUNGCAP] ON 

INSERT [dbo].[NHACUNGCAP] ([NhaCungCap_ID], [TenNCC], [DiaChi], [SoDienThoai]) VALUES (1, N'Công ty A', N'Hồ Chí Minh', N'012563256')
INSERT [dbo].[NHACUNGCAP] ([NhaCungCap_ID], [TenNCC], [DiaChi], [SoDienThoai]) VALUES (2, N'Công ty B', N'Hồ Chí Minh', N'0963325560')
INSERT [dbo].[NHACUNGCAP] ([NhaCungCap_ID], [TenNCC], [DiaChi], [SoDienThoai]) VALUES (3, N'Công ty C', N'Tây Ninh', N'0896325412')
SET IDENTITY_INSERT [dbo].[NHACUNGCAP] OFF
SET IDENTITY_INSERT [dbo].[NHANVIEN] ON 

INSERT [dbo].[NHANVIEN] ([NhanVien_ID], [TenNhanVien], [HoNhanVien], [Email], [DiaChi], [MatKhau], [TrangThai]) VALUES (1, N'An', N'Nguyễn', N'an@gmail.com', N'Hồ Chí Minh', N'123456', 1)
INSERT [dbo].[NHANVIEN] ([NhanVien_ID], [TenNhanVien], [HoNhanVien], [Email], [DiaChi], [MatKhau], [TrangThai]) VALUES (2, N'Phượng', N'Kiều', N'phuong@gmail.com', N'Hồ Chí Minh', N'123456', 1)
INSERT [dbo].[NHANVIEN] ([NhanVien_ID], [TenNhanVien], [HoNhanVien], [Email], [DiaChi], [MatKhau], [TrangThai]) VALUES (3, N'Tuấn', N'Phạm', N'tuan@gmail.com', N'Hồ Chí Minh', N'123456', 0)
INSERT [dbo].[NHANVIEN] ([NhanVien_ID], [TenNhanVien], [HoNhanVien], [Email], [DiaChi], [MatKhau], [TrangThai]) VALUES (4, N'Kiên', N'Lê', N'kien@gmail.com', N'Hồ Chí Minh', N'123456', 1)
INSERT [dbo].[NHANVIEN] ([NhanVien_ID], [TenNhanVien], [HoNhanVien], [Email], [DiaChi], [MatKhau], [TrangThai]) VALUES (5, N'Mẫn', N'Châu', N'man@gmail.com', N'Hồ Chí Minh', N'123456', 1)
SET IDENTITY_INSERT [dbo].[NHANVIEN] OFF
SET IDENTITY_INSERT [dbo].[THANHPHANMONAN] ON 

INSERT [dbo].[THANHPHANMONAN] ([CongThuc_ID], [NguyenLieu_ID], [MonAn_ID], [SoLuong]) VALUES (1, 15, 10, 0.05)
INSERT [dbo].[THANHPHANMONAN] ([CongThuc_ID], [NguyenLieu_ID], [MonAn_ID], [SoLuong]) VALUES (2, 14, 10, 0.05)
INSERT [dbo].[THANHPHANMONAN] ([CongThuc_ID], [NguyenLieu_ID], [MonAn_ID], [SoLuong]) VALUES (3, 11, 10, 0.1)
INSERT [dbo].[THANHPHANMONAN] ([CongThuc_ID], [NguyenLieu_ID], [MonAn_ID], [SoLuong]) VALUES (4, 8, 10, 0.001)
INSERT [dbo].[THANHPHANMONAN] ([CongThuc_ID], [NguyenLieu_ID], [MonAn_ID], [SoLuong]) VALUES (5, 1, 1, 0.05)
INSERT [dbo].[THANHPHANMONAN] ([CongThuc_ID], [NguyenLieu_ID], [MonAn_ID], [SoLuong]) VALUES (6, 8, 1, 0.001)
INSERT [dbo].[THANHPHANMONAN] ([CongThuc_ID], [NguyenLieu_ID], [MonAn_ID], [SoLuong]) VALUES (7, 23, 1, 0.1)
SET IDENTITY_INSERT [dbo].[THANHPHANMONAN] OFF
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
ALTER TABLE [dbo].[CHITIETHOPDONG]  WITH CHECK ADD  CONSTRAINT [FK_CHITIETHOPDONG_HOPDONG1] FOREIGN KEY([HopDong_ID])
REFERENCES [dbo].[HOPDONG] ([HopDong_ID])
GO
ALTER TABLE [dbo].[CHITIETHOPDONG] CHECK CONSTRAINT [FK_CHITIETHOPDONG_HOPDONG1]
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
ALTER TABLE [dbo].[HOPDONG]  WITH CHECK ADD  CONSTRAINT [FK_HOPDONG_NHANVIEN1] FOREIGN KEY([NhanVien_ID])
REFERENCES [dbo].[NHANVIEN] ([NhanVien_ID])
GO
ALTER TABLE [dbo].[HOPDONG] CHECK CONSTRAINT [FK_HOPDONG_NHANVIEN1]
GO
ALTER TABLE [dbo].[MONAN]  WITH CHECK ADD  CONSTRAINT [FK_MONAN_LOAIMONAN] FOREIGN KEY([LoaiMonAn_ID])
REFERENCES [dbo].[LOAIMONAN] ([LoaiMonAn_ID])
GO
ALTER TABLE [dbo].[MONAN] CHECK CONSTRAINT [FK_MONAN_LOAIMONAN]
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
ALTER DATABASE [SpyRes] SET  READ_WRITE 
GO
