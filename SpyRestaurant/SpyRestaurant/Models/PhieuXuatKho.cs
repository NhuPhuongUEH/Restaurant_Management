using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace SpyRestaurant.Models
{
    [Table("PHIEUXUATKHO")]
    public class PhieuXuatKho
    {
        [Column("PhieuXuatKho_ID")]
        public int Id { get; set; }

        [Column("NgayXuat")]
        public DateTime ngayxuat { get; set; }

        public int NhanVien_ID { get; set; }

        [ForeignKey("NhanVien_ID")]
        public virtual NhanVien NhanVien { get; set; }
    }
}
