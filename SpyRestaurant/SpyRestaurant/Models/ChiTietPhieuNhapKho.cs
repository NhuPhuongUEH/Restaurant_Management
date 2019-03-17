using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace SpyRestaurant.Models
{
    [Table("CHITIETPHIEUNHAPKHO")]
    public class ChiTietPhieuNhapKho
    {
        [Column("ChiTietPhieuNhapKho_ID")]
        public int Id { get; set; }

        [Column("SoLuong")]
        public int soluong { get; set; }

        [Column("DonVi")]
        public string donvi { get; set; }

        [Column("Gia")]
        public int gia { get; set; }

        public int PhieuNhapKho_ID { get; set; }

        public int NguyenLieu_ID { get; set; }

        [ForeignKey("PhieuNhapKho_ID")]
        public virtual PhieuNhapKho PhieuNhapKho { get; set; }

        [ForeignKey("NguyenLieu_ID")]
        public virtual NguyenLieu NguyenLieu { get; set; }
    }
}


