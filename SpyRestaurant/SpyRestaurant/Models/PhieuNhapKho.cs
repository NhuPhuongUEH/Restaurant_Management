using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace SpyRestaurant.Models
{
    [Table("PHIEUNHAPKHO")]
    public class PhieuNhapKho
    {
        [Column("PhieuNhapKho_ID")]
        public int Id { get; set; }

        [Column("NgayLap")]
        public DateTime ngaylap { get; set; }

        public int NhaCungCap_ID { get; set; }

        public int NhanVien_ID { get; set; }

        [ForeignKey("NhaCungCap_ID")]
        public virtual NhaCungCap NhaCungCap { get; set; }

        [ForeignKey("NhanVien_ID")]
        public virtual NhanVien NhanVien { get; set; }
    }
}
