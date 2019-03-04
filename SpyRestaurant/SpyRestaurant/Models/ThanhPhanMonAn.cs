using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace SpyRestaurant.Models
{
    [Table("THANHPHANMONAN")]
    public class ThanhPhanMonAn
    {
        [Column("CongThuc_ID")]
        public int Id { get; set; }

        [Column("SoLuong")]
        public double soluong { get; set; }

        public int NguyenLieu_ID { get; set; }

        public int MonAn_ID { get; set; }

        [ForeignKey("NguyenLieu_ID")]
        public virtual NguyenLieu NguyenLieu { get; set; }

        [ForeignKey("MonAn_ID")]
        public virtual MonAn MonAn { get; set; }
    }
}
