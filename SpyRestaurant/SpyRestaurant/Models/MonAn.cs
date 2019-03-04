using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace SpyRestaurant.Models
{
    [Table("MONAN")]
    public class MonAn
    {
        [Column("MonAn_ID")]
        public int Id { get; set; }

        [Column("TenMonAn")]
        public string tenmon { get; set; }

        [Column("MoTa")]
        public string mota { get; set; }

        [Column("Hinh")]
        public string hinh { get; set; }

        [Column("TrangThai")]
        public string trangthai { get; set; }

        [Column("Gia")]
        public double gia { get; set; }

        [NotMapped]
        public IFormFile File { get; set; }

        public int LoaiMonAn_ID { get; set; }

        [ForeignKey("LoaiMonAn_ID")]
        public virtual LoaiMonAn LoaiMonAn { get; set; }
    }
}
