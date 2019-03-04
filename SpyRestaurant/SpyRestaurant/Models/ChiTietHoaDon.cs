using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace SpyRestaurant.Models
{
    [Table("CHITIETHOADON")]
    public class ChiTietHoaDon
    {
        [Column("ChiTietHoaDon_ID")]
        public int Id { get; set; }

        [Column("SoLuong")]
        public int soluong { get; set; }

        [Column("DonGia")]
        public double dongia { get; set; }

        public int HoaDon_ID { get; set; }

        public int MonAn_ID { get; set; }

        [ForeignKey("HoaDon_ID")]
        public virtual HoaDon HoaDon { get; set; }

        [ForeignKey("MonAn_ID")]
        public virtual MonAn MonAn { get; set; }
    }
}


