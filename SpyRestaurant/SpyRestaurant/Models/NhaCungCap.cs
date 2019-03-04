using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace SpyRestaurant.Models
{
    [Table("NHACUNGCAP")]
    public class NhaCungCap
    {
        [Column("NhaCungCap_ID")]
        public int Id { get; set; }
        
        [Column("TenNCC")]
        public string ten { get; set; }

        [Column("DiaChi")]
        public string diachi { get; set; }

        [Column("SoDienThoai")]
        public string sodienthoai { get; set; }
    }
}
