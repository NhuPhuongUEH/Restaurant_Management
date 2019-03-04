using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace SpyRestaurant.Models
{
    [Table("CHITIETPHIEUXUATKHO")]
    public class ChiTietPhieuXuatKho
    {
        [Column("ChiTietPhieuXuatKho_ID")]
        public int Id { get; set; }

        [Column("SoLuongXuat")]
        public int soluong { get; set; }

        [Column("DonVi")]
        public int donvi { get; set; }

        [Column("Gia")]
        public double gia { get; set; }

        public int PhieuXuatKho_ID { get; set; }

        public int NguyenLieu_ID { get; set; }

        [ForeignKey("PhieuXuatKho_ID")]
        public virtual PhieuXuatKho PhieuXuatKho { get; set; }

        [ForeignKey("NguyenLieu_ID")]
        public virtual NguyenLieu NguyenLieu { get; set; }
    }
}
