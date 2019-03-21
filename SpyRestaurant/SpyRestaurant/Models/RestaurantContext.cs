using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SpyRestaurant.Models
{
    public class RestaurantContext : DbContext
    {
        public RestaurantContext(DbContextOptions<RestaurantContext> options) : base(options)
        {

        }
        public DbSet<Ban> Bans { get; set; }
        public DbSet<ChiTietHoaDon> ChiTietHoaDons { get; set; }
        public DbSet<ChiTietPhieuNhapKho> ChiTietPhieuNhapKhos { get; set; }
        public DbSet<ChiTietPhieuXuatKho> ChiTietPhieuXuatKhos { get; set; }
        public DbSet<HoaDon> HoaDons { get; set; }
        public DbSet<KhachHang> KhachHangs { get; set; }
        public DbSet<LoaiMonAn> LoaiMonAns { get; set; }
        public DbSet<MonAn> MonAns { get; set; }
        public DbSet<NguyenLieu> NguyenLieus { get; set; }
        public DbSet<NhaCungCap> NhaCungCaps { get; set; }
        public DbSet<NhanVien> NhanViens { get; set; }
        public DbSet<PhieuNhapKho> PhieuNhapKhos { get; set; }
        public DbSet<PhieuXuatKho> PhieuXuatKhos { get; set; }
        public DbSet<ThanhPhanMonAn> ThanhPhanMonAns { get; set; }
        public DbSet<DoanhThu> DoanhThus { get; set; }
        public DbSet<ThongKeTonKho> ThongKeTonKhos { get; set; }
        public DbSet<ThongKeSoLuong> ThongKeSoLuongs { get; set; }
    }
}
