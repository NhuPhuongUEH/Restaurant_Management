using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace SpyRestaurant.Models
{
    [Table("HOADON")]
    public class HoaDon
    { 
        [Column("HoaDon_ID")]
        public int Id { get; set; }

        [Column("Ngay")]
        public DateTime ngay { get; set; }

        [Column("TrangThai")]
        public bool trangthai { get; set; }

        [Column("GhiChu")]
        public string ghichu { get; set; }

        public int Ban_ID { get; set; }

        public int NhanVien_ID { get; set; }

        public int KhachHang_ID { get; set; }

        [ForeignKey("Ban_ID")]
        public virtual Ban Ban { get; set; }

        [ForeignKey("NhanVien_ID")]
        public virtual NhanVien NhanVien { get; set; }

        [ForeignKey("KhachHang_ID")]
        public virtual KhachHang KhachHang { get; set; }

        [NotMapped]
        public double tongtien { get; set; }
    }
}
