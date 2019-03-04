using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace SpyRestaurant.Models
{
    [Table("BAN")]
    public class Ban
    {
        [Column("Ban_ID")]
        public int Id { get; set; }

        [Column("SoBan")]
        public int soban { get; set; }

        [Column("TrangThai")]
        public bool trangthai { get; set; }

        [Column("HoaDonDangPhucVu")]
        public Nullable<int> hoadondangphucvu { get; set; }
    }
}
