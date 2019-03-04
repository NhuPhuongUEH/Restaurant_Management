using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace SpyRestaurant.Models
{
    [Table("NGUYENLIEU")]
    public class NguyenLieu
    {
        [Column("NguyenLieu_ID")]
        public int Id { get; set; }
        
        [Column("TenNguyenLieu")]
        public string tennguyenlieu { get; set; }

        [Column("DonVi")]
        public string donvi { get; set; }

        [Column("SoLuong")]
        public int soluong { get; set; }
    }
}
