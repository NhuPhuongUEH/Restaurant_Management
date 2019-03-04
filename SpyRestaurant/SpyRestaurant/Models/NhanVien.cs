using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace SpyRestaurant.Models
{
    [Table("NHANVIEN")]
    public class NhanVien
    {
        [Column("NhanVien_ID")]
        public int Id { get; set; }

        [Column("HoNhanVien")]
        public string honhanvien { get; set; }

        [Column("TenNhanVien")]
        public string tennhanvien { get; set; }

        [Column("Email")]
        public string email { get; set; }

        [Column("DiaChi")]
        public string diachi { get; set; }

        [Column("MatKhau")]
        public string matkhau { get; set; }

        [Column("TrangThai")]
        public bool trangthai { get; set; }
    }
}
