using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace SpyRestaurant.Models
{
    [Table("KHACHHANG")]
    public class KhachHang
    {
        [Column("KhachHang_ID")]
        public int Id { get; set; }

        [Column("HoKhachHang")]
        public string hokhachhang { get; set; }

        [Column("TenKhachHang")]
        public string tenkhachhang { get; set; }

        [Column("Email")]
        public string email { get; set; }

        [Column("DiaChi")]
        public string diachi { get; set; }

        [Column("DienThoai")]
        public string dienthoai { get; set; }

        [Column("GhiChu")]
        public string ghichu { get; set; }
    }
}
