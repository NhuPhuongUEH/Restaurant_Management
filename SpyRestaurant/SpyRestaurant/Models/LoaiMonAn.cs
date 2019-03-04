using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace SpyRestaurant.Models
{
    [Table("LOAIMONAN")]
    public class LoaiMonAn
    {
        [Column("LoaiMonAn_ID")]
        public int Id { get; set; }

        [Column("TenLoai")]
        public string tenloai { get; set; }
    }
}
