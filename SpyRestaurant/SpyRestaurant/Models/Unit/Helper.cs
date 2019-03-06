using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SpyRestaurant.Models.Unit
{
    public class Helper
    {
        public static string getUrl(HttpRequest req)
        {
            return "http" + (req.IsHttps ? "s" : "") + "://" + req.Host.ToString() + "/data/sanpham/";
        }
    }
}
