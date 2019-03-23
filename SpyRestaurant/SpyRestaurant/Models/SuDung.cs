using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace SpyRestaurant.Models
{
    [Table("tmp_su_dung")]
    public class SuDung
    {
        [Key]
        public DateTime ngay { get; set; }
        public int id_nguyenlieu { get; set; }
        public Nullable<double> soluongsudung { get; set; }
        public Nullable<double> soluongxuat { get; set; }
    }
}
