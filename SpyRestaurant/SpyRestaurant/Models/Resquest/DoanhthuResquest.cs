using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SpyRestaurant.Models.Resquest
{
    public class DoanhthuResquest
    {
        public int idnguyenlieu { get; set; }
        public DateTime dateFrom { get; set; }
        public DateTime dateTo { get; set; }
    }
}
