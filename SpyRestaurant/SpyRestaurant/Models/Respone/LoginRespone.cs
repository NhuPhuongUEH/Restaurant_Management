using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SpyRestaurant.Models.Respone
{
    public class LoginRespone
    {
        public int id { get; set; }
        public bool trangthai { get; set; }
        public string ho { get; set; }
        public string ten { get; set; }
        public string token { get; set; }
    }
}
