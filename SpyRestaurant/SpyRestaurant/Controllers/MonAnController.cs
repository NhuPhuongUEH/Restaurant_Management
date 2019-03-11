using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting.Internal;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using SpyRestaurant.Models;
using SpyRestaurant.Models.Respone;
using SpyRestaurant.Models.Resquest;

namespace SpyRestaurant.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MonAnController : ControllerBase
    {
        private readonly RestaurantContext _context;
        private readonly HostingEnvironment _hostingEnviroment;

        public MonAnController(RestaurantContext context, HostingEnvironment hostingEnvironment)
        {
            _context = context;
            _hostingEnviroment = hostingEnvironment;
        }

        // GET: api/MonAn
        [HttpGet]
        public async Task<ActionResult<IEnumerable<MonAn>>> GetMonAns()
        {
            return await _context.MonAns.Where(x => x.trangthai != "xóa").Select(x => new MonAn {
                Id = x.Id,
                hinh = Models.Unit.Helper.getUrl(Request) + x.hinh,
                gia = x.gia,
                tenmon = x.tenmon,
                mota = x.mota,
                trangthai = x.trangthai,
                LoaiMonAn = x.LoaiMonAn,
                LoaiMonAn_ID = x.LoaiMonAn_ID
            }).ToListAsync();
        }

        [HttpGet("banhang")]
        public async Task<ActionResult<IEnumerable<MonAn>>> GetMonAnsBanHang()
        {
            return await _context.MonAns.Where(x => x.trangthai == "đang kinh doanh").Select(x => new MonAn
            {
                Id = x.Id,
                hinh = Models.Unit.Helper.getUrl(Request) + x.hinh,
                gia = x.gia,
                tenmon = x.tenmon,
                mota = x.mota,
                trangthai = x.trangthai,
                LoaiMonAn = x.LoaiMonAn,
                LoaiMonAn_ID = x.LoaiMonAn_ID
            }).ToListAsync();
        }

        // GET: api/MonAn/5
        [HttpGet("{id}")]
        public async Task<ActionResult<MonAn>> GetMonAn(int id)
        {
            var monAn = await _context.MonAns.Where(x => x.Id == id).Include(x => x.LoaiMonAn).AsNoTracking().FirstOrDefaultAsync();

            if (monAn == null)
            {
                return NotFound();
            }
            monAn.hinh = Models.Unit.Helper.getUrl(Request) + monAn.hinh;
            return monAn;
        }

        //tim
        [HttpGet("tim")]
        public async Task<ActionResult<IEnumerable<MonAn>>> GetTimNguyenLieu([FromQuery] string q)
        {
            return await _context.MonAns.Where(x => x.tenmon.Contains(q)).ToListAsync();
        }

        //tinh trang mon an
        [HttpPut("tinhtrang/{idMon}")]
        public async Task<IActionResult> PutTinhTrangMon (MonAn monAn, int idMon)
        {
            var a = await _context.MonAns.FindAsync(idMon);
            if (a == null)
                return NotFound();
            a.trangthai = monAn.trangthai;
            _context.MonAns.Update(a);
            await _context.SaveChangesAsync();
            return Ok(a);
        }
        // PUT: api/MonAn/5
        [HttpPut("{id}")]
        public async Task<ActionResult<BaseRespone>> PutMonAn(int id, [FromForm] MonAnRequest monAn)
        {
            //lấy dữ liệu cũ món ăn
            var monan = await _context.MonAns.FindAsync(id);
            if (monan == null)
            {
                return BadRequest();
            }
            
            if (monAn.File != null)
            {
                var uploadFilePath = Path.Combine(_hostingEnviroment.WebRootPath, "Data\\sanpham");
                if (!Directory.Exists(uploadFilePath))
                {
                    Directory.CreateDirectory(uploadFilePath);
                }
                //lấy đường dẫn file cũ
                string oldImageName = _hostingEnviroment.WebRootPath + "\\Data\\sanpham\\" + monan.hinh;
                string newFileName = id + "_" + monAn.File.FileName;
                //lấy đường dẫn file mới
                string path = _hostingEnviroment.WebRootPath + "\\Data\\sanpham\\" + newFileName;
                //xoa file cu
                if (monan.hinh != "")
                {
                    if (System.IO.File.Exists(oldImageName))
                    {
                        System.IO.File.Delete(oldImageName);
                    }
                }
                //luu file moi
                using (var stream = new FileStream(path, FileMode.Create))
                {
                    monAn.File.CopyTo(stream);
                    monan.hinh = newFileName;
                }
            }
            monan.tenmon = monAn.tenmonan;
            monan.gia = monAn.dongia;
            monan.trangthai = monAn.trangthai;
            monan.mota = monAn.mota;
            monan.LoaiMonAn_ID = monAn.loaimonan_id;
            _context.SaveChanges();
            return new BaseRespone()
            {
                ErrorCode = 0
            };
        }

        // POST: api/MonAn
        [HttpPost]
        public async Task<ActionResult<BaseRespone>> PostMonAn([FromForm] MonAn monAn)
        {
           try
            {
                var file = monAn.File;
                _context.MonAns.Add(monAn);
                await _context.SaveChangesAsync();
                if (file != null)
                {
                    string newFileName = monAn.Id + "_" + file.FileName;
                    string path = _hostingEnviroment.WebRootPath + "\\Data\\sanpham\\" + newFileName;
                    using (var stream = new FileStream(path, FileMode.Create))
                    {
                        file.CopyTo(stream);
                        monAn.hinh = newFileName;
                        _context.Entry(monAn).Property(x => x.hinh).IsModified = true;
                        _context.SaveChanges();
                    }
                }
                return new BaseRespone(CreatedAtAction("Get", new { id = monAn.Id}, monAn));
            }
            catch
            {
                return new BaseRespone { ErrorCode = 1, Message = "Lỗi" };
            }

        }

        // DELETE: api/MonAn/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<MonAn>> DeleteMonAn(int id)
        {
            var monAn = await _context.MonAns.FindAsync(id);
            if (monAn == null)
            {
                return NotFound();
            }

            _context.MonAns.Remove(monAn);
            await _context.SaveChangesAsync();

            return monAn;
        }

        private bool MonAnExists(int id)
        {
            return _context.MonAns.Any(e => e.Id == id);
        }
    }
}
