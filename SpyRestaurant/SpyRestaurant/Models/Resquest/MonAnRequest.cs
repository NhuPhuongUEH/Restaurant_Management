using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace SpyRestaurant.Models.Resquest
{
    public class MonAnRequest
    {
        public string tenmonan { get; set; }
        public double dongia { get; set; }
        public string hinh { get; set; }
        public string trangthai { get; set; }
        public string mota { get; set; }
        public int loaimonan_id { get; set; }
        [NotMapped]
        public IFormFile File { get; set; }
    }
}
