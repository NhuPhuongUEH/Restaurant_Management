USE [master]
GO
/****** Object:  Database [SpyRes1]    Script Date: 3/26/2019 11:22:39 PM ******/
CREATE DATABASE [SpyRes1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SpyRes1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SpyRes1.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SpyRes1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SpyRes1_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SpyRes1] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SpyRes1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SpyRes1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SpyRes1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SpyRes1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SpyRes1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SpyRes1] SET ARITHABORT OFF 
GO
ALTER DATABASE [SpyRes1] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SpyRes1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SpyRes1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SpyRes1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SpyRes1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SpyRes1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SpyRes1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SpyRes1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SpyRes1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SpyRes1] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SpyRes1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SpyRes1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SpyRes1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SpyRes1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SpyRes1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SpyRes1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SpyRes1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SpyRes1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SpyRes1] SET  MULTI_USER 
GO
ALTER DATABASE [SpyRes1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SpyRes1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SpyRes1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SpyRes1] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SpyRes1] SET DELAYED_DURABILITY = DISABLED 
GO
USE [SpyRes1]
GO
/****** Object:  Table [dbo].[BAN]    Script Date: 3/26/2019 11:22:39 PM ******/
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
/****** Object:  Table [dbo].[CHITIETDONDATHANG]    Script Date: 3/26/2019 11:22:39 PM ******/
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
/****** Object:  Table [dbo].[CHITIETDONGIAOHANG]    Script Date: 3/26/2019 11:22:39 PM ******/
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
/****** Object:  Table [dbo].[CHITIETHOADON]    Script Date: 3/26/2019 11:22:39 PM ******/
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
/****** Object:  Table [dbo].[CHITIETHOPDONG]    Script Date: 3/26/2019 11:22:39 PM ******/
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
/****** Object:  Table [dbo].[CHITIETPHIEUNHAPKHO]    Script Date: 3/26/2019 11:22:39 PM ******/
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
	[Gia] [int] NULL,
 CONSTRAINT [PK_CHITIETPHIEUNHAPKHO] PRIMARY KEY CLUSTERED 
(
	[ChiTietPhieuNhapKho_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CHITIETPHIEUXUATKHO]    Script Date: 3/26/2019 11:22:39 PM ******/
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
/****** Object:  Table [dbo].[DONDATHANG]    Script Date: 3/26/2019 11:22:39 PM ******/
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
/****** Object:  Table [dbo].[DONGIAOHANG]    Script Date: 3/26/2019 11:22:39 PM ******/
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
/****** Object:  Table [dbo].[HOADON]    Script Date: 3/26/2019 11:22:39 PM ******/
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
/****** Object:  Table [dbo].[HOPDONG]    Script Date: 3/26/2019 11:22:39 PM ******/
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
/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 3/26/2019 11:22:39 PM ******/
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
/****** Object:  Table [dbo].[LOAIMONAN]    Script Date: 3/26/2019 11:22:39 PM ******/
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
/****** Object:  Table [dbo].[MONAN]    Script Date: 3/26/2019 11:22:39 PM ******/
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
/****** Object:  Table [dbo].[NGUYENLIEU]    Script Date: 3/26/2019 11:22:39 PM ******/
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
/****** Object:  Table [dbo].[NHACUNGCAP]    Script Date: 3/26/2019 11:22:39 PM ******/
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
/****** Object:  Table [dbo].[NHANVIEN]    Script Date: 3/26/2019 11:22:39 PM ******/
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
/****** Object:  Table [dbo].[PHIEUNHAPKHO]    Script Date: 3/26/2019 11:22:39 PM ******/
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
/****** Object:  Table [dbo].[PHIEUXUATKHO]    Script Date: 3/26/2019 11:22:39 PM ******/
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
/****** Object:  Table [dbo].[THANHPHANMONAN]    Script Date: 3/26/2019 11:22:39 PM ******/
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
/****** Object:  Table [dbo].[tmp_so_luong_ban_duoc]    Script Date: 3/26/2019 11:22:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_so_luong_ban_duoc](
	[khoa] [nvarchar](100) NOT NULL,
	[ten_mon] [nvarchar](255) NULL,
	[ngay] [date] NULL,
	[so_luong] [int] NULL,
 CONSTRAINT [PK_tmp_so_luong_ban_duoc] PRIMARY KEY CLUSTERED 
(
	[khoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tmp_su_dung]    Script Date: 3/26/2019 11:22:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_su_dung](
	[id_nguyenlieu] [int] NOT NULL,
	[ngay] [date] NOT NULL,
	[soluongsudung] [float] NULL,
	[soluongxuat] [float] NULL,
 CONSTRAINT [PK_tmp_su_dung] PRIMARY KEY CLUSTERED 
(
	[ngay] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tmp_thong_ke_ton_kho]    Script Date: 3/26/2019 11:22:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_thong_ke_ton_kho](
	[id_nguyenlieu] [int] NOT NULL,
	[tennguyenlieu] [nvarchar](255) NULL,
	[dvt] [nvarchar](50) NULL,
	[tondau] [float] NULL,
	[xuat] [float] NULL,
	[nhap] [float] NULL,
	[toncuoi] [float] NULL,
 CONSTRAINT [PK_tmp_thong_ke_ton_kho] PRIMARY KEY CLUSTERED 
(
	[id_nguyenlieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tmp_thu_chi]    Script Date: 3/26/2019 11:22:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_thu_chi](
	[ngay] [date] NOT NULL,
	[thu] [float] NULL,
	[chi] [float] NULL,
 CONSTRAINT [PK_tmp_thu_chi] PRIMARY KEY CLUSTERED 
(
	[ngay] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[tbl_chi]    Script Date: 3/26/2019 11:22:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[tbl_chi] AS
select V_PhieuNhapKho.ngaylap, sum(V_PhieuNhapKho.tongtien) as tongtiennhap
from (select pn.PhieuNhapKho_ID, CONVERT(date, (pn.NgayLap)) as ngaylap, (select sum(ctpn.Gia * ctpn.SoLuong) from CHITIETPHIEUNHAPKHO ctpn where ctpn.PhieuNhapKho_ID = pn.PhieuNhapKho_ID) as tongtien
		from PHIEUNHAPKHO pn) V_PhieuNhapKho
group by V_PhieuNhapKho.ngaylap
GO
/****** Object:  View [dbo].[tbl_thu]    Script Date: 3/26/2019 11:22:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[tbl_thu] AS
select ngaydat, sum(tongtien) as tongtienthu
from (select hd.HoaDon_ID, CONVERT(date, (hd.Ngay)) as ngaydat, (select sum(c.DonGia * c.SoLuong) from CHITIETHOADON c where c.HoaDon_ID = hd.HoaDon_ID) as tongtien
		from HOADON hd) V_hoadon
group by ngaydat
GO
/****** Object:  View [dbo].[thu1]    Script Date: 3/26/2019 11:22:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[thu1] As
select * from tbl_thu t left join tbl_chi c on c.ngaylap = t.ngaydat
GO
/****** Object:  View [dbo].[thu2]    Script Date: 3/26/2019 11:22:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[thu2] as
select * from tbl_thu t right join tbl_chi c on c.ngaylap = t.ngaydat
GO
/****** Object:  View [dbo].[tbl_soluongsudung]    Script Date: 3/26/2019 11:22:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[tbl_soluongsudung] as
select tpma.NguyenLieu_ID as nguyenlieusudung, convert(date, hd.Ngay) as ngay,sum(tpma.SoLuong*cthd.SoLuong) as soluongsudung from THANHPHANMONAN tpma,CHITIETHOADON cthd,HOADON hd
	where tpma.MonAn_ID=cthd.MonAn_ID and hd.HoaDon_ID=cthd.HoaDon_ID
	group by tpma.NguyenLieu_ID, convert(date, hd.Ngay)
GO
/****** Object:  View [dbo].[tbl_soluongxuat]    Script Date: 3/26/2019 11:22:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[tbl_soluongxuat] as
select ctp.NguyenLieu_ID as nguyenlieuxuat, convert(date, px.NgayXuat) as ngayxuat,sum(ctp.SoLuongXuat) as soluongxuat from PHIEUXUATKHO px, CHITIETPHIEUXUATKHO ctp
	where px.PhieuXuatKho_ID=ctp.PhieuXuatKho_ID
	group by ctp.NguyenLieu_ID, convert(date, px.NgayXuat)
GO
/****** Object:  View [dbo].[view_thongke_soluong]    Script Date: 3/26/2019 11:22:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[view_thongke_soluong] as
select ma.MonAn_ID,ma.TenMonAn,CONVERT(date,hd.Ngay) as ngay, sum(cthd.SoLuong) as soluongban
from (HOADON hd join CHITIETHOADON cthd on hd.HoaDon_ID = cthd.HoaDon_ID) join MONAN ma on ma.MonAn_ID = cthd.MonAn_ID
group by ma.TenMonAn,ma.MonAn_ID, CONVERT(date,hd.Ngay)
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

INSERT [dbo].[CHITIETHOADON] ([ChiTietHoaDon_ID], [HoaDon_ID], [MonAn_ID], [SoLuong], [DonGia]) VALUES (1, 1, 2, 1, 35000)
INSERT [dbo].[CHITIETHOADON] ([ChiTietHoaDon_ID], [HoaDon_ID], [MonAn_ID], [SoLuong], [DonGia]) VALUES (2, 1, 3, 1, 35000)
INSERT [dbo].[CHITIETHOADON] ([ChiTietHoaDon_ID], [HoaDon_ID], [MonAn_ID], [SoLuong], [DonGia]) VALUES (8, 2, 2, 1, 35000)
INSERT [dbo].[CHITIETHOADON] ([ChiTietHoaDon_ID], [HoaDon_ID], [MonAn_ID], [SoLuong], [DonGia]) VALUES (9, 2, 4, 1, 25000)
INSERT [dbo].[CHITIETHOADON] ([ChiTietHoaDon_ID], [HoaDon_ID], [MonAn_ID], [SoLuong], [DonGia]) VALUES (12, 3, 2, 2, 35000)
INSERT [dbo].[CHITIETHOADON] ([ChiTietHoaDon_ID], [HoaDon_ID], [MonAn_ID], [SoLuong], [DonGia]) VALUES (13, 4, 8, 2, 10000)
INSERT [dbo].[CHITIETHOADON] ([ChiTietHoaDon_ID], [HoaDon_ID], [MonAn_ID], [SoLuong], [DonGia]) VALUES (14, 5, 6, 2, 25000)
INSERT [dbo].[CHITIETHOADON] ([ChiTietHoaDon_ID], [HoaDon_ID], [MonAn_ID], [SoLuong], [DonGia]) VALUES (15, 5, 10, 1, 8000)
INSERT [dbo].[CHITIETHOADON] ([ChiTietHoaDon_ID], [HoaDon_ID], [MonAn_ID], [SoLuong], [DonGia]) VALUES (17, 6, 4, 3, 25000)
INSERT [dbo].[CHITIETHOADON] ([ChiTietHoaDon_ID], [HoaDon_ID], [MonAn_ID], [SoLuong], [DonGia]) VALUES (18, 6, 6, 2, 25000)
INSERT [dbo].[CHITIETHOADON] ([ChiTietHoaDon_ID], [HoaDon_ID], [MonAn_ID], [SoLuong], [DonGia]) VALUES (19, 6, 9, 1, 10000)
INSERT [dbo].[CHITIETHOADON] ([ChiTietHoaDon_ID], [HoaDon_ID], [MonAn_ID], [SoLuong], [DonGia]) VALUES (20, 6, 10, 1, 8000)
INSERT [dbo].[CHITIETHOADON] ([ChiTietHoaDon_ID], [HoaDon_ID], [MonAn_ID], [SoLuong], [DonGia]) VALUES (21, 6, 14, 1, 45000)
INSERT [dbo].[CHITIETHOADON] ([ChiTietHoaDon_ID], [HoaDon_ID], [MonAn_ID], [SoLuong], [DonGia]) VALUES (22, 7, 3, 1, 35000)
INSERT [dbo].[CHITIETHOADON] ([ChiTietHoaDon_ID], [HoaDon_ID], [MonAn_ID], [SoLuong], [DonGia]) VALUES (23, 7, 4, 1, 25000)
INSERT [dbo].[CHITIETHOADON] ([ChiTietHoaDon_ID], [HoaDon_ID], [MonAn_ID], [SoLuong], [DonGia]) VALUES (24, 7, 6, 1, 25000)
INSERT [dbo].[CHITIETHOADON] ([ChiTietHoaDon_ID], [HoaDon_ID], [MonAn_ID], [SoLuong], [DonGia]) VALUES (25, 7, 8, 1, 10000)
INSERT [dbo].[CHITIETHOADON] ([ChiTietHoaDon_ID], [HoaDon_ID], [MonAn_ID], [SoLuong], [DonGia]) VALUES (26, 8, 6, 1, 25000)
INSERT [dbo].[CHITIETHOADON] ([ChiTietHoaDon_ID], [HoaDon_ID], [MonAn_ID], [SoLuong], [DonGia]) VALUES (27, 8, 4, 1, 25000)
INSERT [dbo].[CHITIETHOADON] ([ChiTietHoaDon_ID], [HoaDon_ID], [MonAn_ID], [SoLuong], [DonGia]) VALUES (28, 8, 11, 1, 5000)
INSERT [dbo].[CHITIETHOADON] ([ChiTietHoaDon_ID], [HoaDon_ID], [MonAn_ID], [SoLuong], [DonGia]) VALUES (29, 9, 4, 2, 25000)
INSERT [dbo].[CHITIETHOADON] ([ChiTietHoaDon_ID], [HoaDon_ID], [MonAn_ID], [SoLuong], [DonGia]) VALUES (30, 9, 11, 1, 5000)
INSERT [dbo].[CHITIETHOADON] ([ChiTietHoaDon_ID], [HoaDon_ID], [MonAn_ID], [SoLuong], [DonGia]) VALUES (31, 9, 9, 1, 10000)
INSERT [dbo].[CHITIETHOADON] ([ChiTietHoaDon_ID], [HoaDon_ID], [MonAn_ID], [SoLuong], [DonGia]) VALUES (32, 10, 1, 5, 25000)
INSERT [dbo].[CHITIETHOADON] ([ChiTietHoaDon_ID], [HoaDon_ID], [MonAn_ID], [SoLuong], [DonGia]) VALUES (34, 11, 1, 5, 25000)
INSERT [dbo].[CHITIETHOADON] ([ChiTietHoaDon_ID], [HoaDon_ID], [MonAn_ID], [SoLuong], [DonGia]) VALUES (35, 11, 9, 1, 10000)
INSERT [dbo].[CHITIETHOADON] ([ChiTietHoaDon_ID], [HoaDon_ID], [MonAn_ID], [SoLuong], [DonGia]) VALUES (36, 12, 1, 1, 25000)
INSERT [dbo].[CHITIETHOADON] ([ChiTietHoaDon_ID], [HoaDon_ID], [MonAn_ID], [SoLuong], [DonGia]) VALUES (37, 13, 1, 2, 25000)
INSERT [dbo].[CHITIETHOADON] ([ChiTietHoaDon_ID], [HoaDon_ID], [MonAn_ID], [SoLuong], [DonGia]) VALUES (38, 13, 3, 1, 35000)
INSERT [dbo].[CHITIETHOADON] ([ChiTietHoaDon_ID], [HoaDon_ID], [MonAn_ID], [SoLuong], [DonGia]) VALUES (39, 13, 10, 1, 8000)
INSERT [dbo].[CHITIETHOADON] ([ChiTietHoaDon_ID], [HoaDon_ID], [MonAn_ID], [SoLuong], [DonGia]) VALUES (40, 14, 14, 1, 45000)
INSERT [dbo].[CHITIETHOADON] ([ChiTietHoaDon_ID], [HoaDon_ID], [MonAn_ID], [SoLuong], [DonGia]) VALUES (41, 14, 2, 1, 35000)
INSERT [dbo].[CHITIETHOADON] ([ChiTietHoaDon_ID], [HoaDon_ID], [MonAn_ID], [SoLuong], [DonGia]) VALUES (42, 14, 4, 1, 25000)
INSERT [dbo].[CHITIETHOADON] ([ChiTietHoaDon_ID], [HoaDon_ID], [MonAn_ID], [SoLuong], [DonGia]) VALUES (44, 15, 2, 1, 35000)
INSERT [dbo].[CHITIETHOADON] ([ChiTietHoaDon_ID], [HoaDon_ID], [MonAn_ID], [SoLuong], [DonGia]) VALUES (45, 15, 1, 2, 25000)
INSERT [dbo].[CHITIETHOADON] ([ChiTietHoaDon_ID], [HoaDon_ID], [MonAn_ID], [SoLuong], [DonGia]) VALUES (46, 15, 11, 1, 5000)
SET IDENTITY_INSERT [dbo].[CHITIETHOADON] OFF
SET IDENTITY_INSERT [dbo].[CHITIETPHIEUNHAPKHO] ON 

INSERT [dbo].[CHITIETPHIEUNHAPKHO] ([ChiTietPhieuNhapKho_ID], [PhieuNhapKho_ID], [NguyenLieu_ID], [SoLuong], [DonVi], [Gia]) VALUES (1, 1, 1, 10, N'kg', 15000)
INSERT [dbo].[CHITIETPHIEUNHAPKHO] ([ChiTietPhieuNhapKho_ID], [PhieuNhapKho_ID], [NguyenLieu_ID], [SoLuong], [DonVi], [Gia]) VALUES (2, 1, 2, 15, N'kg', 20000)
INSERT [dbo].[CHITIETPHIEUNHAPKHO] ([ChiTietPhieuNhapKho_ID], [PhieuNhapKho_ID], [NguyenLieu_ID], [SoLuong], [DonVi], [Gia]) VALUES (3, 2, 3, 5, N'kg', 15000)
INSERT [dbo].[CHITIETPHIEUNHAPKHO] ([ChiTietPhieuNhapKho_ID], [PhieuNhapKho_ID], [NguyenLieu_ID], [SoLuong], [DonVi], [Gia]) VALUES (4, 2, 4, 12, N'kg', 16000)
INSERT [dbo].[CHITIETPHIEUNHAPKHO] ([ChiTietPhieuNhapKho_ID], [PhieuNhapKho_ID], [NguyenLieu_ID], [SoLuong], [DonVi], [Gia]) VALUES (5, 3, 1, 10, N'kg', 12000)
INSERT [dbo].[CHITIETPHIEUNHAPKHO] ([ChiTietPhieuNhapKho_ID], [PhieuNhapKho_ID], [NguyenLieu_ID], [SoLuong], [DonVi], [Gia]) VALUES (6, 4, 3, 10, N'kg', 20000)
INSERT [dbo].[CHITIETPHIEUNHAPKHO] ([ChiTietPhieuNhapKho_ID], [PhieuNhapKho_ID], [NguyenLieu_ID], [SoLuong], [DonVi], [Gia]) VALUES (9, 5, 4, 5, N'kg', 10000)
INSERT [dbo].[CHITIETPHIEUNHAPKHO] ([ChiTietPhieuNhapKho_ID], [PhieuNhapKho_ID], [NguyenLieu_ID], [SoLuong], [DonVi], [Gia]) VALUES (12, 5, 17, 2, N'kg', 15000)
INSERT [dbo].[CHITIETPHIEUNHAPKHO] ([ChiTietPhieuNhapKho_ID], [PhieuNhapKho_ID], [NguyenLieu_ID], [SoLuong], [DonVi], [Gia]) VALUES (13, 5, 23, 2, N'kg', 10000)
INSERT [dbo].[CHITIETPHIEUNHAPKHO] ([ChiTietPhieuNhapKho_ID], [PhieuNhapKho_ID], [NguyenLieu_ID], [SoLuong], [DonVi], [Gia]) VALUES (14, 5, 1, 2, N'kg', 15000)
INSERT [dbo].[CHITIETPHIEUNHAPKHO] ([ChiTietPhieuNhapKho_ID], [PhieuNhapKho_ID], [NguyenLieu_ID], [SoLuong], [DonVi], [Gia]) VALUES (15, 6, 1, 3, N'kg', 25000)
INSERT [dbo].[CHITIETPHIEUNHAPKHO] ([ChiTietPhieuNhapKho_ID], [PhieuNhapKho_ID], [NguyenLieu_ID], [SoLuong], [DonVi], [Gia]) VALUES (16, 6, 8, 2, N'kg', 12000)
INSERT [dbo].[CHITIETPHIEUNHAPKHO] ([ChiTietPhieuNhapKho_ID], [PhieuNhapKho_ID], [NguyenLieu_ID], [SoLuong], [DonVi], [Gia]) VALUES (17, 7, 1, 2, N'kg', 12000)
INSERT [dbo].[CHITIETPHIEUNHAPKHO] ([ChiTietPhieuNhapKho_ID], [PhieuNhapKho_ID], [NguyenLieu_ID], [SoLuong], [DonVi], [Gia]) VALUES (18, 7, 22, 2, N'kg', 15000)
INSERT [dbo].[CHITIETPHIEUNHAPKHO] ([ChiTietPhieuNhapKho_ID], [PhieuNhapKho_ID], [NguyenLieu_ID], [SoLuong], [DonVi], [Gia]) VALUES (19, 8, 2, 3, N'kg', 20000)
INSERT [dbo].[CHITIETPHIEUNHAPKHO] ([ChiTietPhieuNhapKho_ID], [PhieuNhapKho_ID], [NguyenLieu_ID], [SoLuong], [DonVi], [Gia]) VALUES (20, 9, 6, 5, N'kg', 15000)
INSERT [dbo].[CHITIETPHIEUNHAPKHO] ([ChiTietPhieuNhapKho_ID], [PhieuNhapKho_ID], [NguyenLieu_ID], [SoLuong], [DonVi], [Gia]) VALUES (21, 9, 1, 3, N'kg', 16000)
INSERT [dbo].[CHITIETPHIEUNHAPKHO] ([ChiTietPhieuNhapKho_ID], [PhieuNhapKho_ID], [NguyenLieu_ID], [SoLuong], [DonVi], [Gia]) VALUES (22, 9, 8, 3, N'kg', 20000)
SET IDENTITY_INSERT [dbo].[CHITIETPHIEUNHAPKHO] OFF
SET IDENTITY_INSERT [dbo].[CHITIETPHIEUXUATKHO] ON 

INSERT [dbo].[CHITIETPHIEUXUATKHO] ([ChiTietPhieuXuatKho_ID], [PhieuXuatKho_ID], [NguyenLieu_ID], [SoLuongXuat], [DonVi], [Gia]) VALUES (1, 1, 1, 2, N'kg', 10000)
INSERT [dbo].[CHITIETPHIEUXUATKHO] ([ChiTietPhieuXuatKho_ID], [PhieuXuatKho_ID], [NguyenLieu_ID], [SoLuongXuat], [DonVi], [Gia]) VALUES (2, 2, 8, 2, N'kg', 10000)
INSERT [dbo].[CHITIETPHIEUXUATKHO] ([ChiTietPhieuXuatKho_ID], [PhieuXuatKho_ID], [NguyenLieu_ID], [SoLuongXuat], [DonVi], [Gia]) VALUES (3, 2, 11, 1, N'kg', 10000)
INSERT [dbo].[CHITIETPHIEUXUATKHO] ([ChiTietPhieuXuatKho_ID], [PhieuXuatKho_ID], [NguyenLieu_ID], [SoLuongXuat], [DonVi], [Gia]) VALUES (4, 3, 8, 1, N'kg', 15000)
INSERT [dbo].[CHITIETPHIEUXUATKHO] ([ChiTietPhieuXuatKho_ID], [PhieuXuatKho_ID], [NguyenLieu_ID], [SoLuongXuat], [DonVi], [Gia]) VALUES (5, 3, 14, 1, N'kg', 10000)
INSERT [dbo].[CHITIETPHIEUXUATKHO] ([ChiTietPhieuXuatKho_ID], [PhieuXuatKho_ID], [NguyenLieu_ID], [SoLuongXuat], [DonVi], [Gia]) VALUES (6, 3, 1, 1, N'kg', 15000)
INSERT [dbo].[CHITIETPHIEUXUATKHO] ([ChiTietPhieuXuatKho_ID], [PhieuXuatKho_ID], [NguyenLieu_ID], [SoLuongXuat], [DonVi], [Gia]) VALUES (7, 4, 1, 1, N'kg', 10000)
INSERT [dbo].[CHITIETPHIEUXUATKHO] ([ChiTietPhieuXuatKho_ID], [PhieuXuatKho_ID], [NguyenLieu_ID], [SoLuongXuat], [DonVi], [Gia]) VALUES (8, 4, 8, 1, N'kg', 10000)
INSERT [dbo].[CHITIETPHIEUXUATKHO] ([ChiTietPhieuXuatKho_ID], [PhieuXuatKho_ID], [NguyenLieu_ID], [SoLuongXuat], [DonVi], [Gia]) VALUES (9, 4, 23, 2, N'kg', 12000)
INSERT [dbo].[CHITIETPHIEUXUATKHO] ([ChiTietPhieuXuatKho_ID], [PhieuXuatKho_ID], [NguyenLieu_ID], [SoLuongXuat], [DonVi], [Gia]) VALUES (10, 5, 1, 3, N'kg', 10000)
INSERT [dbo].[CHITIETPHIEUXUATKHO] ([ChiTietPhieuXuatKho_ID], [PhieuXuatKho_ID], [NguyenLieu_ID], [SoLuongXuat], [DonVi], [Gia]) VALUES (11, 5, 8, 2, N'kg', 15000)
INSERT [dbo].[CHITIETPHIEUXUATKHO] ([ChiTietPhieuXuatKho_ID], [PhieuXuatKho_ID], [NguyenLieu_ID], [SoLuongXuat], [DonVi], [Gia]) VALUES (12, 5, 23, 2, N'kg', 10000)
INSERT [dbo].[CHITIETPHIEUXUATKHO] ([ChiTietPhieuXuatKho_ID], [PhieuXuatKho_ID], [NguyenLieu_ID], [SoLuongXuat], [DonVi], [Gia]) VALUES (13, 5, 4, 1, N'kg', 12000)
INSERT [dbo].[CHITIETPHIEUXUATKHO] ([ChiTietPhieuXuatKho_ID], [PhieuXuatKho_ID], [NguyenLieu_ID], [SoLuongXuat], [DonVi], [Gia]) VALUES (14, 6, 1, 3, N'kg', 10000)
INSERT [dbo].[CHITIETPHIEUXUATKHO] ([ChiTietPhieuXuatKho_ID], [PhieuXuatKho_ID], [NguyenLieu_ID], [SoLuongXuat], [DonVi], [Gia]) VALUES (15, 6, 8, 2, N'kg', 12000)
INSERT [dbo].[CHITIETPHIEUXUATKHO] ([ChiTietPhieuXuatKho_ID], [PhieuXuatKho_ID], [NguyenLieu_ID], [SoLuongXuat], [DonVi], [Gia]) VALUES (16, 6, 5, 2, N'kg', 10000)
INSERT [dbo].[CHITIETPHIEUXUATKHO] ([ChiTietPhieuXuatKho_ID], [PhieuXuatKho_ID], [NguyenLieu_ID], [SoLuongXuat], [DonVi], [Gia]) VALUES (17, 7, 1, 2, N'kg', 10000)
INSERT [dbo].[CHITIETPHIEUXUATKHO] ([ChiTietPhieuXuatKho_ID], [PhieuXuatKho_ID], [NguyenLieu_ID], [SoLuongXuat], [DonVi], [Gia]) VALUES (18, 7, 23, 3, N'kg', 12000)
INSERT [dbo].[CHITIETPHIEUXUATKHO] ([ChiTietPhieuXuatKho_ID], [PhieuXuatKho_ID], [NguyenLieu_ID], [SoLuongXuat], [DonVi], [Gia]) VALUES (19, 7, 8, 2, N'kg', 10000)
INSERT [dbo].[CHITIETPHIEUXUATKHO] ([ChiTietPhieuXuatKho_ID], [PhieuXuatKho_ID], [NguyenLieu_ID], [SoLuongXuat], [DonVi], [Gia]) VALUES (20, 7, 4, 1, N'kg', 10000)
SET IDENTITY_INSERT [dbo].[CHITIETPHIEUXUATKHO] OFF
SET IDENTITY_INSERT [dbo].[HOADON] ON 

INSERT [dbo].[HOADON] ([HoaDon_ID], [Ngay], [TrangThai], [Ban_ID], [NhanVien_ID], [KhachHang_ID], [GhiChu]) VALUES (1, CAST(N'2019-08-03 00:00:00.000' AS DateTime), 1, 1, 1, 1, N'')
INSERT [dbo].[HOADON] ([HoaDon_ID], [Ngay], [TrangThai], [Ban_ID], [NhanVien_ID], [KhachHang_ID], [GhiChu]) VALUES (2, CAST(N'2019-03-10 02:22:19.553' AS DateTime), 1, 2, 1, 1, N'')
INSERT [dbo].[HOADON] ([HoaDon_ID], [Ngay], [TrangThai], [Ban_ID], [NhanVien_ID], [KhachHang_ID], [GhiChu]) VALUES (3, CAST(N'2019-03-11 12:15:07.730' AS DateTime), 1, 4, 1, 1, N'')
INSERT [dbo].[HOADON] ([HoaDon_ID], [Ngay], [TrangThai], [Ban_ID], [NhanVien_ID], [KhachHang_ID], [GhiChu]) VALUES (4, CAST(N'2019-03-11 14:25:40.953' AS DateTime), 1, 3, 1, 1, N'')
INSERT [dbo].[HOADON] ([HoaDon_ID], [Ngay], [TrangThai], [Ban_ID], [NhanVien_ID], [KhachHang_ID], [GhiChu]) VALUES (5, CAST(N'2019-03-13 15:49:16.610' AS DateTime), 1, 7, 1, 1, N'')
INSERT [dbo].[HOADON] ([HoaDon_ID], [Ngay], [TrangThai], [Ban_ID], [NhanVien_ID], [KhachHang_ID], [GhiChu]) VALUES (6, CAST(N'2019-03-16 12:58:43.373' AS DateTime), 1, 7, 1, 1, N'')
INSERT [dbo].[HOADON] ([HoaDon_ID], [Ngay], [TrangThai], [Ban_ID], [NhanVien_ID], [KhachHang_ID], [GhiChu]) VALUES (7, CAST(N'2019-03-17 11:37:22.230' AS DateTime), 1, 2, 1, 1, N'')
INSERT [dbo].[HOADON] ([HoaDon_ID], [Ngay], [TrangThai], [Ban_ID], [NhanVien_ID], [KhachHang_ID], [GhiChu]) VALUES (8, CAST(N'2019-03-18 13:30:39.200' AS DateTime), 1, 8, 1, 1, N'')
INSERT [dbo].[HOADON] ([HoaDon_ID], [Ngay], [TrangThai], [Ban_ID], [NhanVien_ID], [KhachHang_ID], [GhiChu]) VALUES (9, CAST(N'2019-03-20 10:45:08.913' AS DateTime), 1, 2, 1, 1, N'')
INSERT [dbo].[HOADON] ([HoaDon_ID], [Ngay], [TrangThai], [Ban_ID], [NhanVien_ID], [KhachHang_ID], [GhiChu]) VALUES (10, CAST(N'2019-03-23 10:07:28.307' AS DateTime), 1, 6, 1, 1, N'')
INSERT [dbo].[HOADON] ([HoaDon_ID], [Ngay], [TrangThai], [Ban_ID], [NhanVien_ID], [KhachHang_ID], [GhiChu]) VALUES (11, CAST(N'2019-03-24 02:56:46.303' AS DateTime), 1, 10, 1, 1, N'')
INSERT [dbo].[HOADON] ([HoaDon_ID], [Ngay], [TrangThai], [Ban_ID], [NhanVien_ID], [KhachHang_ID], [GhiChu]) VALUES (12, CAST(N'2019-03-24 02:59:59.450' AS DateTime), 1, 8, 1, 1, N'')
INSERT [dbo].[HOADON] ([HoaDon_ID], [Ngay], [TrangThai], [Ban_ID], [NhanVien_ID], [KhachHang_ID], [GhiChu]) VALUES (13, CAST(N'2019-03-25 04:52:48.127' AS DateTime), 1, 10, 1, 1, N'')
INSERT [dbo].[HOADON] ([HoaDon_ID], [Ngay], [TrangThai], [Ban_ID], [NhanVien_ID], [KhachHang_ID], [GhiChu]) VALUES (14, CAST(N'2019-03-25 04:53:10.933' AS DateTime), 1, 8, 1, 1, N'')
INSERT [dbo].[HOADON] ([HoaDon_ID], [Ngay], [TrangThai], [Ban_ID], [NhanVien_ID], [KhachHang_ID], [GhiChu]) VALUES (15, CAST(N'2019-03-26 16:13:40.227' AS DateTime), 1, 9, 1, 1, N'')
SET IDENTITY_INSERT [dbo].[HOADON] OFF
SET IDENTITY_INSERT [dbo].[KHACHHANG] ON 

INSERT [dbo].[KHACHHANG] ([KhachHang_ID], [HoKhachHang], [TenKhachHang], [Email], [DiaChi], [DienThoai], [GhiChu]) VALUES (1, N'Phạm', N'Bình', N'binh@gmail.com', N'Hồ Chí Minh', N'0639856123', N'không')
INSERT [dbo].[KHACHHANG] ([KhachHang_ID], [HoKhachHang], [TenKhachHang], [Email], [DiaChi], [DienThoai], [GhiChu]) VALUES (2, N'Phạm', N'Vy', N'vy@gmail.com', N'Hồ Chí Minh', N'0569874563', N'không')
INSERT [dbo].[KHACHHANG] ([KhachHang_ID], [HoKhachHang], [TenKhachHang], [Email], [DiaChi], [DienThoai], [GhiChu]) VALUES (3, N'Phạm ', N'Khang', N'khang@gmail.com', N'Hồ Chí Minh', N'0563894230', N'không')
SET IDENTITY_INSERT [dbo].[KHACHHANG] OFF
SET IDENTITY_INSERT [dbo].[LOAIMONAN] ON 

INSERT [dbo].[LOAIMONAN] ([LoaiMonAn_ID], [TenLoai]) VALUES (1, N'Cơm')
INSERT [dbo].[LOAIMONAN] ([LoaiMonAn_ID], [TenLoai]) VALUES (2, N'Món nước')
INSERT [dbo].[LOAIMONAN] ([LoaiMonAn_ID], [TenLoai]) VALUES (3, N'Nước giải khát')
INSERT [dbo].[LOAIMONAN] ([LoaiMonAn_ID], [TenLoai]) VALUES (4, N'Canh')
SET IDENTITY_INSERT [dbo].[LOAIMONAN] OFF
SET IDENTITY_INSERT [dbo].[MONAN] ON 

INSERT [dbo].[MONAN] ([MonAn_ID], [TenMonAn], [MoTa], [Hinh], [TrangThai], [Gia], [LoaiMonAn_ID]) VALUES (1, N'Phở bò', N'phở thơm ngon, bánh phở mềm dai, bò tươi mới', N'phobo.jpg', N'đang kinh doanh', 25000, 2)
INSERT [dbo].[MONAN] ([MonAn_ID], [TenMonAn], [MoTa], [Hinh], [TrangThai], [Gia], [LoaiMonAn_ID]) VALUES (2, N'Hủ tiếu', N'hủ tiếu nam vang, hương vị quê hương ', N'hutieu.jpg', N'đang kinh doanh', 35000, 2)
INSERT [dbo].[MONAN] ([MonAn_ID], [TenMonAn], [MoTa], [Hinh], [TrangThai], [Gia], [LoaiMonAn_ID]) VALUES (3, N'Cơm bò xào', N'cơm bò xào với hạt cơm dẻo, bò tươi kết hợp với các loại rau củ ', N'comboxao.jpg', N'đang kinh doanh', 35000, 1)
INSERT [dbo].[MONAN] ([MonAn_ID], [TenMonAn], [MoTa], [Hinh], [TrangThai], [Gia], [LoaiMonAn_ID]) VALUES (4, N'Cơm tấm', N'cơm với hạt gạo dẻo thơm, sườn nướng đậm đà', N'comtam.jpg', N'đang kinh doanh', 25000, 1)
INSERT [dbo].[MONAN] ([MonAn_ID], [TenMonAn], [MoTa], [Hinh], [TrangThai], [Gia], [LoaiMonAn_ID]) VALUES (5, N'Cơm chiên', N'<p>cơm được chi&ecirc;n với rau củ, thịt heo x&aacute; x&iacute;u</p>
', N'comchienduongchau.jpg', N'ngừng kinh doanh', 25000, 1)
INSERT [dbo].[MONAN] ([MonAn_ID], [TenMonAn], [MoTa], [Hinh], [TrangThai], [Gia], [LoaiMonAn_ID]) VALUES (6, N'Bánh canh cua', N'bánh canh được nấu chung với cua biển, chả cua', N'banhcanhcua.jpg', N'đang kinh doanh', 25000, 2)
INSERT [dbo].[MONAN] ([MonAn_ID], [TenMonAn], [MoTa], [Hinh], [TrangThai], [Gia], [LoaiMonAn_ID]) VALUES (7, N'Bún bò', N'bún bò hương vị Huế đặc sắc', N'bunbo.jpg', N'ngừng kinh doanh', 30000, 2)
INSERT [dbo].[MONAN] ([MonAn_ID], [TenMonAn], [MoTa], [Hinh], [TrangThai], [Gia], [LoaiMonAn_ID]) VALUES (8, N'7up', N'nước có gas được giới trẻ yêu thích', N'7up.jpg', N'đang kinh doanh', 10000, 3)
INSERT [dbo].[MONAN] ([MonAn_ID], [TenMonAn], [MoTa], [Hinh], [TrangThai], [Gia], [LoaiMonAn_ID]) VALUES (9, N'Coca Cola', N'nước có gas được giới trẻ yêu thích', N'coca.jpg', N'đang kinh doanh', 10000, 3)
INSERT [dbo].[MONAN] ([MonAn_ID], [TenMonAn], [MoTa], [Hinh], [TrangThai], [Gia], [LoaiMonAn_ID]) VALUES (10, N'Nước mía', N'loại nước mát được nhiều người ưa chuộng', N'nuocmia.jpg', N'đang kinh doanh', 8000, 3)
INSERT [dbo].[MONAN] ([MonAn_ID], [TenMonAn], [MoTa], [Hinh], [TrangThai], [Gia], [LoaiMonAn_ID]) VALUES (11, N'Trà đá', N'loại nước được nhiều người uống nhất', N'trada.jpg', N'đang kinh doanh', 5000, 3)
INSERT [dbo].[MONAN] ([MonAn_ID], [TenMonAn], [MoTa], [Hinh], [TrangThai], [Gia], [LoaiMonAn_ID]) VALUES (12, N'Canh chua ca loc', N'<p>ngon</p>
', N'12_canhchua.jpg', N'ngừng kinh doanh', 50000, 4)
INSERT [dbo].[MONAN] ([MonAn_ID], [TenMonAn], [MoTa], [Hinh], [TrangThai], [Gia], [LoaiMonAn_ID]) VALUES (13, N'Khổ qua', N'<p>ngon</p>
', N'13_khoqua.jpg', N'xóa', 35000, 4)
INSERT [dbo].[MONAN] ([MonAn_ID], [TenMonAn], [MoTa], [Hinh], [TrangThai], [Gia], [LoaiMonAn_ID]) VALUES (14, N'Canh rong biển', N'<p>abc</p>
', N'14_canhrongbien.JPG', N'đang kinh doanh', 45000, 4)
INSERT [dbo].[MONAN] ([MonAn_ID], [TenMonAn], [MoTa], [Hinh], [TrangThai], [Gia], [LoaiMonAn_ID]) VALUES (15, N'Cơm trộn', N'<p>a</p>
', N'15_comtron.jpg', N'ngừng kinh doanh', 45000, 1)
INSERT [dbo].[MONAN] ([MonAn_ID], [TenMonAn], [MoTa], [Hinh], [TrangThai], [Gia], [LoaiMonAn_ID]) VALUES (16, N'Lẩu hải sản', NULL, N'16_lauca.jpg', N'đang kinh doanh', 120000, 2)
SET IDENTITY_INSERT [dbo].[MONAN] OFF
SET IDENTITY_INSERT [dbo].[NGUYENLIEU] ON 

INSERT [dbo].[NGUYENLIEU] ([NguyenLieu_ID], [TenNguyenLieu], [DonVi], [SoLuong]) VALUES (1, N'thịt bò', N'kg', 50)
INSERT [dbo].[NGUYENLIEU] ([NguyenLieu_ID], [TenNguyenLieu], [DonVi], [SoLuong]) VALUES (2, N'thịt heo', N'kg', 50)
INSERT [dbo].[NGUYENLIEU] ([NguyenLieu_ID], [TenNguyenLieu], [DonVi], [SoLuong]) VALUES (3, N'thịt càng cua', N'kg', 40)
INSERT [dbo].[NGUYENLIEU] ([NguyenLieu_ID], [TenNguyenLieu], [DonVi], [SoLuong]) VALUES (4, N'tôm sú', N'kg', 15)
INSERT [dbo].[NGUYENLIEU] ([NguyenLieu_ID], [TenNguyenLieu], [DonVi], [SoLuong]) VALUES (5, N'rau húng quế', N'kg', 5)
INSERT [dbo].[NGUYENLIEU] ([NguyenLieu_ID], [TenNguyenLieu], [DonVi], [SoLuong]) VALUES (6, N'rau ôm', N'kg', 5)
INSERT [dbo].[NGUYENLIEU] ([NguyenLieu_ID], [TenNguyenLieu], [DonVi], [SoLuong]) VALUES (7, N'gừng', N'kg', 5)
INSERT [dbo].[NGUYENLIEU] ([NguyenLieu_ID], [TenNguyenLieu], [DonVi], [SoLuong]) VALUES (8, N'hành lá', N'kg', 7)
INSERT [dbo].[NGUYENLIEU] ([NguyenLieu_ID], [TenNguyenLieu], [DonVi], [SoLuong]) VALUES (9, N'giá sống', N'kg', 4)
INSERT [dbo].[NGUYENLIEU] ([NguyenLieu_ID], [TenNguyenLieu], [DonVi], [SoLuong]) VALUES (10, N'tần ô', N'kg', 3)
INSERT [dbo].[NGUYENLIEU] ([NguyenLieu_ID], [TenNguyenLieu], [DonVi], [SoLuong]) VALUES (11, N'bún ', N'kg', 15)
INSERT [dbo].[NGUYENLIEU] ([NguyenLieu_ID], [TenNguyenLieu], [DonVi], [SoLuong]) VALUES (12, N'sả', N'kg', 5)
INSERT [dbo].[NGUYENLIEU] ([NguyenLieu_ID], [TenNguyenLieu], [DonVi], [SoLuong]) VALUES (13, N'trứng cút', N'quả', 150)
INSERT [dbo].[NGUYENLIEU] ([NguyenLieu_ID], [TenNguyenLieu], [DonVi], [SoLuong]) VALUES (14, N'gân bò', N'kg', 10)
INSERT [dbo].[NGUYENLIEU] ([NguyenLieu_ID], [TenNguyenLieu], [DonVi], [SoLuong]) VALUES (15, N'bắp bò', N'kg', 15)
INSERT [dbo].[NGUYENLIEU] ([NguyenLieu_ID], [TenNguyenLieu], [DonVi], [SoLuong]) VALUES (16, N'thảo quả', N'kg', 15)
INSERT [dbo].[NGUYENLIEU] ([NguyenLieu_ID], [TenNguyenLieu], [DonVi], [SoLuong]) VALUES (17, N'hoa hồi ', N'kg', 5)
INSERT [dbo].[NGUYENLIEU] ([NguyenLieu_ID], [TenNguyenLieu], [DonVi], [SoLuong]) VALUES (18, N'quế', N'kg', 5)
INSERT [dbo].[NGUYENLIEU] ([NguyenLieu_ID], [TenNguyenLieu], [DonVi], [SoLuong]) VALUES (19, N'gạo', N'kg', 5)
INSERT [dbo].[NGUYENLIEU] ([NguyenLieu_ID], [TenNguyenLieu], [DonVi], [SoLuong]) VALUES (20, N'cốt lết heo', N'kg', 60)
INSERT [dbo].[NGUYENLIEU] ([NguyenLieu_ID], [TenNguyenLieu], [DonVi], [SoLuong]) VALUES (21, N'dưa leo', N'kg', 5)
INSERT [dbo].[NGUYENLIEU] ([NguyenLieu_ID], [TenNguyenLieu], [DonVi], [SoLuong]) VALUES (22, N'cà chua ', N'kg', 9)
INSERT [dbo].[NGUYENLIEU] ([NguyenLieu_ID], [TenNguyenLieu], [DonVi], [SoLuong]) VALUES (23, N'bánh phở', N'kg', 15)
SET IDENTITY_INSERT [dbo].[NGUYENLIEU] OFF
SET IDENTITY_INSERT [dbo].[NHACUNGCAP] ON 

INSERT [dbo].[NHACUNGCAP] ([NhaCungCap_ID], [TenNCC], [DiaChi], [SoDienThoai]) VALUES (1, N'Công ty A', N'Quãng Ngãi', N'0563210456')
INSERT [dbo].[NHACUNGCAP] ([NhaCungCap_ID], [TenNCC], [DiaChi], [SoDienThoai]) VALUES (2, N'Công ty B', N'Khánh Hòa', N'0125623120')
INSERT [dbo].[NHACUNGCAP] ([NhaCungCap_ID], [TenNCC], [DiaChi], [SoDienThoai]) VALUES (3, N'Công ty C', N'Hồ Chí Minh', N'0563895520')
SET IDENTITY_INSERT [dbo].[NHACUNGCAP] OFF
SET IDENTITY_INSERT [dbo].[NHANVIEN] ON 

INSERT [dbo].[NHANVIEN] ([NhanVien_ID], [TenNhanVien], [HoNhanVien], [Email], [DiaChi], [MatKhau], [TrangThai]) VALUES (1, N'Phượng', N'Kiều', N'phuong@gmail.com', N'Hồ Chí Minh', N'123456', 1)
INSERT [dbo].[NHANVIEN] ([NhanVien_ID], [TenNhanVien], [HoNhanVien], [Email], [DiaChi], [MatKhau], [TrangThai]) VALUES (2, N'An', N'Phạm', N'an@gmail.com', N'Hồ Chí Minh', N'123456', 0)
INSERT [dbo].[NHANVIEN] ([NhanVien_ID], [TenNhanVien], [HoNhanVien], [Email], [DiaChi], [MatKhau], [TrangThai]) VALUES (3, N'Mẫn', N'Châu', N'man@gmail.com', N'Hồ Chí Minh', N'123456', 1)
SET IDENTITY_INSERT [dbo].[NHANVIEN] OFF
SET IDENTITY_INSERT [dbo].[PHIEUNHAPKHO] ON 

INSERT [dbo].[PHIEUNHAPKHO] ([PhieuNhapKho_ID], [NhaCungCap_ID], [NhanVien_ID], [NgayLap]) VALUES (1, 1, 1, CAST(N'2019-03-11 00:00:00.000' AS DateTime))
INSERT [dbo].[PHIEUNHAPKHO] ([PhieuNhapKho_ID], [NhaCungCap_ID], [NhanVien_ID], [NgayLap]) VALUES (2, 2, 2, CAST(N'2019-08-03 00:00:00.000' AS DateTime))
INSERT [dbo].[PHIEUNHAPKHO] ([PhieuNhapKho_ID], [NhaCungCap_ID], [NhanVien_ID], [NgayLap]) VALUES (3, 2, 1, CAST(N'2019-03-04 00:00:00.000' AS DateTime))
INSERT [dbo].[PHIEUNHAPKHO] ([PhieuNhapKho_ID], [NhaCungCap_ID], [NhanVien_ID], [NgayLap]) VALUES (4, 1, 2, CAST(N'2019-03-13 00:00:00.000' AS DateTime))
INSERT [dbo].[PHIEUNHAPKHO] ([PhieuNhapKho_ID], [NhaCungCap_ID], [NhanVien_ID], [NgayLap]) VALUES (5, 1, 3, CAST(N'2019-03-17 00:00:00.000' AS DateTime))
INSERT [dbo].[PHIEUNHAPKHO] ([PhieuNhapKho_ID], [NhaCungCap_ID], [NhanVien_ID], [NgayLap]) VALUES (6, 2, 2, CAST(N'2019-03-23 00:00:00.000' AS DateTime))
INSERT [dbo].[PHIEUNHAPKHO] ([PhieuNhapKho_ID], [NhaCungCap_ID], [NhanVien_ID], [NgayLap]) VALUES (7, 2, 1, CAST(N'2019-03-24 00:00:00.000' AS DateTime))
INSERT [dbo].[PHIEUNHAPKHO] ([PhieuNhapKho_ID], [NhaCungCap_ID], [NhanVien_ID], [NgayLap]) VALUES (8, 1, 3, CAST(N'2019-03-25 00:00:00.000' AS DateTime))
INSERT [dbo].[PHIEUNHAPKHO] ([PhieuNhapKho_ID], [NhaCungCap_ID], [NhanVien_ID], [NgayLap]) VALUES (9, 3, 2, CAST(N'2019-03-26 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[PHIEUNHAPKHO] OFF
SET IDENTITY_INSERT [dbo].[PHIEUXUATKHO] ON 

INSERT [dbo].[PHIEUXUATKHO] ([PhieuXuatKho_ID], [NhanVien_ID], [NgayXuat]) VALUES (1, 2, CAST(N'2019-03-08 00:00:00.000' AS DateTime))
INSERT [dbo].[PHIEUXUATKHO] ([PhieuXuatKho_ID], [NhanVien_ID], [NgayXuat]) VALUES (2, 2, CAST(N'2019-03-15 00:00:00.000' AS DateTime))
INSERT [dbo].[PHIEUXUATKHO] ([PhieuXuatKho_ID], [NhanVien_ID], [NgayXuat]) VALUES (3, 1, CAST(N'2019-03-11 00:00:00.000' AS DateTime))
INSERT [dbo].[PHIEUXUATKHO] ([PhieuXuatKho_ID], [NhanVien_ID], [NgayXuat]) VALUES (4, 1, CAST(N'2019-03-23 00:00:00.000' AS DateTime))
INSERT [dbo].[PHIEUXUATKHO] ([PhieuXuatKho_ID], [NhanVien_ID], [NgayXuat]) VALUES (5, 1, CAST(N'2019-03-24 00:00:00.000' AS DateTime))
INSERT [dbo].[PHIEUXUATKHO] ([PhieuXuatKho_ID], [NhanVien_ID], [NgayXuat]) VALUES (6, 2, CAST(N'2019-03-25 00:00:00.000' AS DateTime))
INSERT [dbo].[PHIEUXUATKHO] ([PhieuXuatKho_ID], [NhanVien_ID], [NgayXuat]) VALUES (7, 1, CAST(N'2019-03-26 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[PHIEUXUATKHO] OFF
SET IDENTITY_INSERT [dbo].[THANHPHANMONAN] ON 

INSERT [dbo].[THANHPHANMONAN] ([CongThuc_ID], [NguyenLieu_ID], [MonAn_ID], [SoLuong]) VALUES (1, 14, 10, 0.5)
INSERT [dbo].[THANHPHANMONAN] ([CongThuc_ID], [NguyenLieu_ID], [MonAn_ID], [SoLuong]) VALUES (2, 11, 10, 0.1)
INSERT [dbo].[THANHPHANMONAN] ([CongThuc_ID], [NguyenLieu_ID], [MonAn_ID], [SoLuong]) VALUES (3, 8, 10, 0.4)
INSERT [dbo].[THANHPHANMONAN] ([CongThuc_ID], [NguyenLieu_ID], [MonAn_ID], [SoLuong]) VALUES (4, 8, 1, 0.8)
INSERT [dbo].[THANHPHANMONAN] ([CongThuc_ID], [NguyenLieu_ID], [MonAn_ID], [SoLuong]) VALUES (5, 23, 1, 0.4)
INSERT [dbo].[THANHPHANMONAN] ([CongThuc_ID], [NguyenLieu_ID], [MonAn_ID], [SoLuong]) VALUES (6, 1, 10, 0.3)
INSERT [dbo].[THANHPHANMONAN] ([CongThuc_ID], [NguyenLieu_ID], [MonAn_ID], [SoLuong]) VALUES (7, 1, 1, 0.5)
INSERT [dbo].[THANHPHANMONAN] ([CongThuc_ID], [NguyenLieu_ID], [MonAn_ID], [SoLuong]) VALUES (8, 8, 4, 0.8)
INSERT [dbo].[THANHPHANMONAN] ([CongThuc_ID], [NguyenLieu_ID], [MonAn_ID], [SoLuong]) VALUES (9, 9, 1, 0.5)
INSERT [dbo].[THANHPHANMONAN] ([CongThuc_ID], [NguyenLieu_ID], [MonAn_ID], [SoLuong]) VALUES (10, 1, 3, 0.6)
INSERT [dbo].[THANHPHANMONAN] ([CongThuc_ID], [NguyenLieu_ID], [MonAn_ID], [SoLuong]) VALUES (11, 19, 3, 0.3)
INSERT [dbo].[THANHPHANMONAN] ([CongThuc_ID], [NguyenLieu_ID], [MonAn_ID], [SoLuong]) VALUES (12, 1, 16, 1)
SET IDENTITY_INSERT [dbo].[THANHPHANMONAN] OFF
INSERT [dbo].[tmp_so_luong_ban_duoc] ([khoa], [ten_mon], [ngay], [so_luong]) VALUES (N'102019-03-25', N'Nước mía', CAST(N'2019-03-25' AS Date), 1)
INSERT [dbo].[tmp_so_luong_ban_duoc] ([khoa], [ten_mon], [ngay], [so_luong]) VALUES (N'112019-03-26', N'Trà đá', CAST(N'2019-03-26' AS Date), 1)
INSERT [dbo].[tmp_so_luong_ban_duoc] ([khoa], [ten_mon], [ngay], [so_luong]) VALUES (N'12019-03-23', N'Phở bò', CAST(N'2019-03-23' AS Date), 5)
INSERT [dbo].[tmp_so_luong_ban_duoc] ([khoa], [ten_mon], [ngay], [so_luong]) VALUES (N'12019-03-24', N'Phở bò', CAST(N'2019-03-24' AS Date), 6)
INSERT [dbo].[tmp_so_luong_ban_duoc] ([khoa], [ten_mon], [ngay], [so_luong]) VALUES (N'12019-03-25', N'Phở bò', CAST(N'2019-03-25' AS Date), 2)
INSERT [dbo].[tmp_so_luong_ban_duoc] ([khoa], [ten_mon], [ngay], [so_luong]) VALUES (N'12019-03-26', N'Phở bò', CAST(N'2019-03-26' AS Date), 2)
INSERT [dbo].[tmp_so_luong_ban_duoc] ([khoa], [ten_mon], [ngay], [so_luong]) VALUES (N'142019-03-25', N'Canh rong biển', CAST(N'2019-03-25' AS Date), 1)
INSERT [dbo].[tmp_so_luong_ban_duoc] ([khoa], [ten_mon], [ngay], [so_luong]) VALUES (N'22019-03-25', N'Hủ tiếu', CAST(N'2019-03-25' AS Date), 1)
INSERT [dbo].[tmp_so_luong_ban_duoc] ([khoa], [ten_mon], [ngay], [so_luong]) VALUES (N'22019-03-26', N'Hủ tiếu', CAST(N'2019-03-26' AS Date), 1)
INSERT [dbo].[tmp_so_luong_ban_duoc] ([khoa], [ten_mon], [ngay], [so_luong]) VALUES (N'32019-03-25', N'Cơm bò xào', CAST(N'2019-03-25' AS Date), 1)
INSERT [dbo].[tmp_so_luong_ban_duoc] ([khoa], [ten_mon], [ngay], [so_luong]) VALUES (N'42019-03-25', N'Cơm tấm', CAST(N'2019-03-25' AS Date), 1)
INSERT [dbo].[tmp_so_luong_ban_duoc] ([khoa], [ten_mon], [ngay], [so_luong]) VALUES (N'92019-03-24', N'Coca Cola', CAST(N'2019-03-24' AS Date), 1)
INSERT [dbo].[tmp_su_dung] ([id_nguyenlieu], [ngay], [soluongsudung], [soluongxuat]) VALUES (1, CAST(N'2019-03-23' AS Date), 2.5, 1)
INSERT [dbo].[tmp_su_dung] ([id_nguyenlieu], [ngay], [soluongsudung], [soluongxuat]) VALUES (1, CAST(N'2019-03-24' AS Date), 3, 3)
INSERT [dbo].[tmp_su_dung] ([id_nguyenlieu], [ngay], [soluongsudung], [soluongxuat]) VALUES (1, CAST(N'2019-03-25' AS Date), 1.9000000000000001, 3)
INSERT [dbo].[tmp_su_dung] ([id_nguyenlieu], [ngay], [soluongsudung], [soluongxuat]) VALUES (1, CAST(N'2019-03-26' AS Date), 1, 2)
INSERT [dbo].[tmp_thong_ke_ton_kho] ([id_nguyenlieu], [tennguyenlieu], [dvt], [tondau], [xuat], [nhap], [toncuoi]) VALUES (1, N'thịt bò', N'kg', 20.8, 8.4, 8, 20.4)
INSERT [dbo].[tmp_thong_ke_ton_kho] ([id_nguyenlieu], [tennguyenlieu], [dvt], [tondau], [xuat], [nhap], [toncuoi]) VALUES (2, N'thịt heo', N'kg', 15, 0, 3, 18)
INSERT [dbo].[tmp_thong_ke_ton_kho] ([id_nguyenlieu], [tennguyenlieu], [dvt], [tondau], [xuat], [nhap], [toncuoi]) VALUES (3, N'thịt càng cua', N'kg', 10, 0, 0, 10)
INSERT [dbo].[tmp_thong_ke_ton_kho] ([id_nguyenlieu], [tennguyenlieu], [dvt], [tondau], [xuat], [nhap], [toncuoi]) VALUES (4, N'tôm sú', N'kg', 5, 0, 0, 5)
INSERT [dbo].[tmp_thong_ke_ton_kho] ([id_nguyenlieu], [tennguyenlieu], [dvt], [tondau], [xuat], [nhap], [toncuoi]) VALUES (5, N'rau húng quế', N'kg', 0, 0, 0, 0)
INSERT [dbo].[tmp_thong_ke_ton_kho] ([id_nguyenlieu], [tennguyenlieu], [dvt], [tondau], [xuat], [nhap], [toncuoi]) VALUES (6, N'rau ôm', N'kg', 0, 0, 5, 5)
INSERT [dbo].[tmp_thong_ke_ton_kho] ([id_nguyenlieu], [tennguyenlieu], [dvt], [tondau], [xuat], [nhap], [toncuoi]) VALUES (7, N'gừng', N'kg', 0, 0, 0, 0)
INSERT [dbo].[tmp_thong_ke_ton_kho] ([id_nguyenlieu], [tennguyenlieu], [dvt], [tondau], [xuat], [nhap], [toncuoi]) VALUES (8, N'hành lá', N'kg', -7.2000000000000011, 13.2, 5, -15.4)
INSERT [dbo].[tmp_thong_ke_ton_kho] ([id_nguyenlieu], [tennguyenlieu], [dvt], [tondau], [xuat], [nhap], [toncuoi]) VALUES (9, N'giá sống', N'kg', 0, 7.5, 0, -7.5)
INSERT [dbo].[tmp_thong_ke_ton_kho] ([id_nguyenlieu], [tennguyenlieu], [dvt], [tondau], [xuat], [nhap], [toncuoi]) VALUES (10, N'tần ô', N'kg', 0, 0, 0, 0)
INSERT [dbo].[tmp_thong_ke_ton_kho] ([id_nguyenlieu], [tennguyenlieu], [dvt], [tondau], [xuat], [nhap], [toncuoi]) VALUES (11, N'bún ', N'kg', -0.2, 0.1, 0, -0.30000000000000004)
INSERT [dbo].[tmp_thong_ke_ton_kho] ([id_nguyenlieu], [tennguyenlieu], [dvt], [tondau], [xuat], [nhap], [toncuoi]) VALUES (12, N'sả', N'kg', 0, 0, 0, 0)
INSERT [dbo].[tmp_thong_ke_ton_kho] ([id_nguyenlieu], [tennguyenlieu], [dvt], [tondau], [xuat], [nhap], [toncuoi]) VALUES (13, N'trứng cút', N'quả', 0, 0, 0, 0)
INSERT [dbo].[tmp_thong_ke_ton_kho] ([id_nguyenlieu], [tennguyenlieu], [dvt], [tondau], [xuat], [nhap], [toncuoi]) VALUES (14, N'gân bò', N'kg', -1, 0.5, 0, -1.5)
INSERT [dbo].[tmp_thong_ke_ton_kho] ([id_nguyenlieu], [tennguyenlieu], [dvt], [tondau], [xuat], [nhap], [toncuoi]) VALUES (15, N'bắp bò', N'kg', 0, 0, 0, 0)
INSERT [dbo].[tmp_thong_ke_ton_kho] ([id_nguyenlieu], [tennguyenlieu], [dvt], [tondau], [xuat], [nhap], [toncuoi]) VALUES (16, N'thảo quả', N'kg', 0, 0, 0, 0)
INSERT [dbo].[tmp_thong_ke_ton_kho] ([id_nguyenlieu], [tennguyenlieu], [dvt], [tondau], [xuat], [nhap], [toncuoi]) VALUES (17, N'hoa hồi ', N'kg', 2, 0, 0, 2)
INSERT [dbo].[tmp_thong_ke_ton_kho] ([id_nguyenlieu], [tennguyenlieu], [dvt], [tondau], [xuat], [nhap], [toncuoi]) VALUES (18, N'quế', N'kg', 0, 0, 0, 0)
INSERT [dbo].[tmp_thong_ke_ton_kho] ([id_nguyenlieu], [tennguyenlieu], [dvt], [tondau], [xuat], [nhap], [toncuoi]) VALUES (19, N'gạo', N'kg', -0.3, 0.3, 0, -0.6)
INSERT [dbo].[tmp_thong_ke_ton_kho] ([id_nguyenlieu], [tennguyenlieu], [dvt], [tondau], [xuat], [nhap], [toncuoi]) VALUES (20, N'cốt lết heo', N'kg', 0, 0, 0, 0)
INSERT [dbo].[tmp_thong_ke_ton_kho] ([id_nguyenlieu], [tennguyenlieu], [dvt], [tondau], [xuat], [nhap], [toncuoi]) VALUES (21, N'dưa leo', N'kg', 0, 0, 0, 0)
INSERT [dbo].[tmp_thong_ke_ton_kho] ([id_nguyenlieu], [tennguyenlieu], [dvt], [tondau], [xuat], [nhap], [toncuoi]) VALUES (22, N'cà chua ', N'kg', 0, 0, 2, 2)
INSERT [dbo].[tmp_thong_ke_ton_kho] ([id_nguyenlieu], [tennguyenlieu], [dvt], [tondau], [xuat], [nhap], [toncuoi]) VALUES (23, N'bánh phở', N'kg', 2, 6, 0, -4)
INSERT [dbo].[tmp_thu_chi] ([ngay], [thu], [chi]) VALUES (CAST(N'2019-03-23' AS Date), 125000, 99000)
INSERT [dbo].[tmp_thu_chi] ([ngay], [thu], [chi]) VALUES (CAST(N'2019-03-24' AS Date), 160000, 54000)
INSERT [dbo].[tmp_thu_chi] ([ngay], [thu], [chi]) VALUES (CAST(N'2019-03-25' AS Date), 198000, 60000)
INSERT [dbo].[tmp_thu_chi] ([ngay], [thu], [chi]) VALUES (CAST(N'2019-03-26' AS Date), 90000, 183000)
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
/****** Object:  StoredProcedure [dbo].[doanh_thu]    Script Date: 3/26/2019 11:22:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[doanh_thu] @dateFrom date, @dateTo date
as
delete from tmp_thu_chi
while CONVERT(date, @dateFrom) <= CONVERT(date, @dateTo)
begin
	declare @thu float
	declare @chi float
	exec tongtien_hoadon @dateFrom, @thu output
	exec tongtien_phieunhap @dateFrom, @chi output
	insert into tmp_thu_chi values(@dateFrom, @thu, @chi)
	set @dateFrom=DATEADD(DAY, 1, @dateFrom)
end
GO
/****** Object:  StoredProcedure [dbo].[nglieudung2]    Script Date: 3/26/2019 11:22:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[nglieudung2] @ngaydat date, @id_nguyenlieu int, @soluongsudung float output
as
set @soluongsudung = (select t.soluongsudung
						from tbl_soluongsudung t where CONVERT(date, t.ngay) = CONVERT(date, @ngaydat) and t.nguyenlieusudung = @id_nguyenlieu)
GO
/****** Object:  StoredProcedure [dbo].[ngxuat]    Script Date: 3/26/2019 11:22:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ngxuat] @ngayxuat date, @id_nguyenlieu int, @soluongxuat float output
as 
set @soluongxuat = (select t.soluongxuat
						from tbl_soluongxuat t where CONVERT(date, t.ngayxuat) = CONVERT(date, @ngayxuat) and t.nguyenlieuxuat = @id_nguyenlieu)
GO
/****** Object:  StoredProcedure [dbo].[thong_ke_nguyen_lieu_dung]    Script Date: 3/26/2019 11:22:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[thong_ke_nguyen_lieu_dung] @dateFrom date,@dateTo date
as
delete from tmp_su_dung
DECLARE cursorNguyenlieu1 CURSOR FOR select NguyenLieu_ID from NguyenLieu
DECLARE @id_nguyenlieu int
declare @soluongsudung float
declare @soluongxuat float
open cursorNguyenlieu1
FETCH NEXT FROM cursorNguyenlieu1 into @id_nguyenlieu
WHILE @@FETCH_STATUS = 0  
   BEGIN
	exec nglieudung @dateFrom, @id_nguyenlieu, @soluongsudung output
	exec ngxuat @dateFrom, @id_nguyenlieu, @soluongxuat output
	if(@soluongsudung is NULL)
		set @soluongsudung=0; 
	if(@soluongxuat is NULL)
		set @soluongxuat=0; 
	insert into tmp_su_dung values(@id_nguyenlieu, @dateFrom, @soluongsudung, @soluongxuat)
    FETCH NEXT FROM cursorNguyenlieu1 into @id_nguyenlieu
   END;  
CLOSE cursorNguyenlieu1
DEALLOCATE cursorNguyenlieu1
GO
/****** Object:  StoredProcedure [dbo].[thong_ke_so_luong_ban]    Script Date: 3/26/2019 11:22:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[thong_ke_so_luong_ban] @dateFrom date, @dateTo date
as
delete from tmp_so_luong_ban_duoc
insert into tmp_so_luong_ban_duoc
select (CONVERT(nvarchar,v.MonAn_ID)+CONVERT(nvarchar,v.ngay)) as khoa,v.TenMonAn as ten_mon,v.ngay,v.soluongban as so_luong from view_thongke_soluong v where v.ngay>=CONVERT(date,@dateFrom) and v.ngay<=CONVERT(date,@dateTo)
GO
/****** Object:  StoredProcedure [dbo].[thong_ke_ton_kho]    Script Date: 3/26/2019 11:22:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[thong_ke_ton_kho] @dateFrom date,@dateTo date
as
delete from tmp_thong_ke_ton_kho
DECLARE cursorNguyenlieu CURSOR FOR select NguyenLieu_ID,TenNguyenLieu,DonVi from NguyenLieu
DECLARE @id_nguyenlieu int
DECLARE @nl_ten nvarchar(255)
DECLARE @nl_donvitinh nvarchar(50)
declare @tondau float
declare @toncuoi float
declare @soluongnhap float
declare @soluongxuat float
open cursorNguyenlieu
FETCH NEXT FROM cursorNguyenlieu into @id_nguyenlieu,@nl_ten,@nl_donvitinh
WHILE @@FETCH_STATUS = 0  
   BEGIN
	exec tinh_so_luong_nhap @dateFrom, @dateTo,@id_nguyenlieu, @soluongnhap output
	exec tinh_so_luong_xuat @dateFrom, @dateTo,@id_nguyenlieu, @soluongxuat output
	exec tinh_ton_dau @dateFrom,@id_nguyenlieu, @tondau output
	if(@soluongnhap is NULL)
		set @soluongnhap=0; 
	if(@soluongxuat is NULL)
		set @soluongxuat=0; 
	if(@tondau is NULL)
		set @tondau=0;
	set @toncuoi=@tondau+@soluongnhap-@soluongxuat
	insert into tmp_thong_ke_ton_kho values(@id_nguyenlieu,@nl_ten,@nl_donvitinh,@tondau,@soluongxuat,@soluongnhap,@toncuoi)
    FETCH NEXT FROM cursorNguyenlieu into @id_nguyenlieu,@nl_ten,@nl_donvitinh
   END;  
CLOSE cursorNguyenlieu
DEALLOCATE cursorNguyenlieu
GO
/****** Object:  StoredProcedure [dbo].[thongkesudung]    Script Date: 3/26/2019 11:22:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[thongkesudung] @dateFrom date, @dateTo date
as
delete from tmp_su_dung
while CONVERT(date, @dateFrom) <= CONVERT(date, @dateTo)
begin
	declare @soluongsudung float
	declare @soluongxuat float
	declare @id_nguyenlieu int
	exec nglieudung @dateFrom, @id_nguyenlieu, @soluongsudung output
	exec ngxuat @dateFrom, @id_nguyenlieu, @soluongxuat output
	insert into tmp_su_dung values(@id_nguyenlieu, @dateFrom, @soluongsudung, @soluongxuat)
	set @dateFrom=DATEADD(DAY, 1, @dateFrom)
end
GO
/****** Object:  StoredProcedure [dbo].[thongkesudung2]    Script Date: 3/26/2019 11:22:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[thongkesudung2] @dateFrom date, @dateTo date
as
delete from tmp_su_dung

while CONVERT(date, @dateFrom) <= CONVERT(date, @dateTo)
begin
	declare @soluongsudung float
	declare @soluongxuat float
	declare @id_nguyenlieu int
	set @id_nguyenlieu = (select NguyenLieu_ID from NGUYENLIEU)
	exec nglieudung @dateFrom, @id_nguyenlieu, @soluongsudung output
	exec ngxuat @dateFrom, @id_nguyenlieu, @soluongxuat output
	insert into tmp_su_dung values(@id_nguyenlieu, @dateFrom, @soluongsudung, @soluongxuat)
	set @dateFrom=DATEADD(DAY, 1, @dateFrom)
end
GO
/****** Object:  StoredProcedure [dbo].[thongkesudung3]    Script Date: 3/26/2019 11:22:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[thongkesudung3] @dateFrom date, @dateTo date
as
delete from tmp_su_dung

while CONVERT(date, @dateFrom) <= CONVERT(date, @dateTo)
begin
	declare @soluongsudung float
	declare @soluongxuat float
	declare @id_nguyenlieu int
	set @id_nguyenlieu = (select NguyenLieu_ID from NGUYENLIEU)
	exec nglieudung2 @dateFrom, @id_nguyenlieu, @soluongsudung output
	exec ngxuat @dateFrom, @id_nguyenlieu, @soluongxuat output
	insert into tmp_su_dung values(@id_nguyenlieu, @dateFrom, @soluongsudung, @soluongxuat)
	set @dateFrom=DATEADD(DAY, 1, @dateFrom)
end
GO
/****** Object:  StoredProcedure [dbo].[thongkesudung4]    Script Date: 3/26/2019 11:22:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[thongkesudung4] @dateFrom date, @dateTo date, @id_nguyenlieu int
as
delete from tmp_su_dung
while CONVERT(date, @dateFrom) <= CONVERT(date, @dateTo)
begin
	declare @soluongsudung float
	declare @soluongxuat float
	set @id_nguyenlieu = (select NguyenLieu_ID from NGUYENLIEU)
	exec nglieudung2 @dateFrom, @id_nguyenlieu, @soluongsudung output
	exec ngxuat @dateFrom, @id_nguyenlieu, @soluongxuat output
	insert into tmp_su_dung values(@id_nguyenlieu, @dateFrom, @soluongsudung, @soluongxuat)
	set @dateFrom=DATEADD(DAY, 1, @dateFrom)
end
GO
/****** Object:  StoredProcedure [dbo].[thongkesudung5]    Script Date: 3/26/2019 11:22:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[thongkesudung5] @dateFrom date, @dateTo date, @id_nguyenlieu int
as
delete from tmp_su_dung
while CONVERT(date, @dateFrom) <= CONVERT(date, @dateTo)
begin
	declare @soluongsudung float
	declare @soluongxuat float
	exec nglieudung2 @dateFrom, @id_nguyenlieu, @soluongsudung output
	exec ngxuat @dateFrom, @id_nguyenlieu, @soluongxuat output
	insert into tmp_su_dung values(@id_nguyenlieu, @dateFrom, @soluongsudung, @soluongxuat)
	set @dateFrom=DATEADD(DAY, 1, @dateFrom)
end
GO
/****** Object:  StoredProcedure [dbo].[tinh_so_luong_nhap]    Script Date: 3/26/2019 11:22:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tinh_so_luong_nhap] @dateFrom date,@dateTo date, @id_nguyenlieu int, @soluongnhap float output
	as
	set @soluongnhap=(select (CASE WHEN soluongnhap is NULL THEN 0 ELSE soluongnhap END) as soluongnhap from 
	--xuất nguyên liệu
	(select tpma.NguyenLieu_ID as nguyenlieuxuat,sum(tpma.SoLuong*cthd.SoLuong) as soluongxuat from THANHPHANMONAN tpma,CHITIETHOADON cthd,HOADON hd
	where tpma.MonAn_ID=cthd.MonAn_ID and hd.HoaDon_ID=cthd.HoaDon_ID and (CONVERT(date,hd.Ngay)>=CONVERT(date,@dateFrom) and CONVERT(date,hd.Ngay)<=CONVERT(date,@dateTo))
	group by tpma.NguyenLieu_ID) view1 full outer join
	--nhập nguyên liệu
	(select ctp.NguyenLieu_ID as nguyenlieunhap,sum(ctp.SoLuong) as soluongnhap from PHIEUNHAPKHO pn, CHITIETPHIEUNHAPKHO ctp
	where pn.PhieuNhapKho_ID=ctp.PhieuNhapKho_ID
	and (CONVERT(date,pn.NgayLap)>=CONVERT(date,@dateFrom) and CONVERT(date,pn.NgayLap)<=CONVERT(date,@dateTo))
	group by ctp.NguyenLieu_ID) view2 on view1.nguyenlieuxuat=view2.nguyenlieunhap
	where view1.nguyenlieuxuat=@id_nguyenlieu or view2.nguyenlieunhap=@id_nguyenlieu)
GO
/****** Object:  StoredProcedure [dbo].[tinh_so_luong_xuat]    Script Date: 3/26/2019 11:22:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tinh_so_luong_xuat] @dateFrom date,@dateTo date, @id_nguyenlieu int, @soluongxuat float output
	as
	set @soluongxuat=(select (CASE WHEN soluongxuat is NULL THEN 0 ELSE soluongxuat END) as soluongxuat from 
	--xuất nguyên liệu
	(select tpma.NguyenLieu_ID as nguyenlieuxuat,sum(tpma.SoLuong*cthd.SoLuong) as soluongxuat from THANHPHANMONAN tpma,CHITIETHOADON cthd,HOADON hd
	where tpma.MonAn_ID=cthd.MonAn_ID and hd.HoaDon_ID=cthd.HoaDon_ID and (CONVERT(date,hd.Ngay)>=CONVERT(date,@dateFrom) and CONVERT(date,hd.Ngay)<=CONVERT(date,@dateTo))
	group by tpma.NguyenLieu_ID) view1 full outer join
	--nhập nguyên liệu
	(select ctp.NguyenLieu_ID as nguyenlieunhap,sum(ctp.SoLuong) as soluongnhap from PHIEUNHAPKHO pn, CHITIETPHIEUNHAPKHO ctp
	where pn.PhieuNhapKho_ID=ctp.PhieuNhapKho_ID
	and (CONVERT(date,pn.NgayLap)>=CONVERT(date,@dateFrom) and CONVERT(date,pn.NgayLap)<=CONVERT(date,@dateTo))
	group by ctp.NguyenLieu_ID) view2 on view1.nguyenlieuxuat=view2.nguyenlieunhap
	where view1.nguyenlieuxuat=@id_nguyenlieu or view2.nguyenlieunhap=@id_nguyenlieu)
GO
/****** Object:  StoredProcedure [dbo].[tinh_ton_dau]    Script Date: 3/26/2019 11:22:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tinh_ton_dau] @dateFrom date, @id_nguyenlieu int, @tondau float output
	as
	set @tondau=(select ((CASE WHEN soluongnhap is NULL THEN 0 ELSE soluongnhap END)- (CASE WHEN soluongxuat is NULL THEN 0 ELSE soluongxuat END)) from 
	--xuất nguyên liệu
	(select tpma.NguyenLieu_ID as nguyenlieuxuat,sum(tpma.SoLuong*cthd.SoLuong) as soluongxuat from THANHPHANMONAN tpma,CHITIETHOADON cthd,HOADON hd
	where tpma.MonAn_ID=cthd.MonAn_ID and hd.HoaDon_ID=cthd.HoaDon_ID and (CONVERT(date,hd.Ngay)<CONVERT(date,@dateFrom))
	group by tpma.NguyenLieu_ID) view1 full outer join
	--nhập nguyên liệu
	(select ctp.NguyenLieu_ID as nguyenlieunhap,sum(ctp.SoLuong) as soluongnhap from PHIEUNHAPKHO pn, CHITIETPHIEUNHAPKHO ctp
	where pn.PhieuNhapKho_ID=ctp.PhieuNhapKho_ID
	and (CONVERT(date,pn.NgayLap)<CONVERT(date,@dateFrom))
	group by ctp.NguyenLieu_ID) view2 on view1.nguyenlieuxuat=view2.nguyenlieunhap
	where view1.nguyenlieuxuat=@id_nguyenlieu or view2.nguyenlieunhap=@id_nguyenlieu)
GO
/****** Object:  StoredProcedure [dbo].[tongtien_hoadon]    Script Date: 3/26/2019 11:22:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[tongtien_hoadon] @ngaydat date, @tongtien float output
as
set @tongtien=(select t.tongtienthu from tbl_thu t where CONVERT(date, t.ngaydat) = (CONVERT(date, @ngaydat)))
GO
/****** Object:  StoredProcedure [dbo].[tongtien_phieunhap]    Script Date: 3/26/2019 11:22:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[tongtien_phieunhap] @ngaylap date, @tongtien float output
as
set @tongtien=(select t.tongtiennhap from tbl_chi t where CONVERT(date, t.ngaylap) = (CONVERT(date, @ngaylap)))
GO
USE [master]
GO
ALTER DATABASE [SpyRes1] SET  READ_WRITE 
GO
