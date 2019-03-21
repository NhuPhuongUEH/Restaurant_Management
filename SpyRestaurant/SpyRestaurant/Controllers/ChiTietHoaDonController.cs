using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
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
    public class ChiTietHoaDonController : ControllerBase
    {
        private readonly RestaurantContext _context;

        public ChiTietHoaDonController(RestaurantContext context)
        {
            _context = context;
        }

        // GET: api/ChiTietHoaDon
        [HttpGet]
        public async Task<ActionResult<IEnumerable<ChiTietHoaDon>>> GetChiTietHoaDons()
        {
            return await _context.ChiTietHoaDons.Include(x => x.MonAn).Include(x => x.HoaDon).ToListAsync();
        }

        [HttpPost("thongkesoluong")]
        public async Task<ActionResult<BaseRespone>> GetSoluongBan(DoanhthuResquest resquest)
        {
            await _context.Database.ExecuteSqlCommandAsync("exec thong_ke_so_luong_ban @from,@to", new SqlParameter("@from", resquest.dateFrom.ToShortDateString()), new SqlParameter("@to", resquest.dateTo.ToShortDateString()));
            var data = await _context.ThongKeSoLuongs.GroupBy(x => x.ten_mon).Select(x => new ThongKeSoLuong
            {
                ten_mon = x.Key,
                so_luong = x.Sum(t => t.so_luong)
            }).ToListAsync();
            return new BaseRespone(data);
        }

        //kiem tra mon da goi mon do chua
        [HttpPost("kiemtra")]
        public async Task<ActionResult<bool>> GetKiemTraMonAn(ChitietRequest chitiet)
        {
            var check = _context.ChiTietHoaDons.Where(x => x.HoaDon_ID == chitiet.idHoaDon && x.MonAn_ID == chitiet.idMonAn).FirstOrDefault();
            if (check == null)
                return true;
            return false;
        }

        [HttpGet("HoaDon/{idHoaDon}")]
        public async Task<ActionResult<IEnumerable<ChiTietHoaDon>>> Get(int idHoaDon)
        {
            return await _context.ChiTietHoaDons.Where(x => x.HoaDon_ID == idHoaDon).Include(x => x.MonAn).Include(x => x.HoaDon).ToListAsync();
        }
        // GET: api/ChiTietHoaDon/5
        [HttpGet("{id}")]
        public async Task<ActionResult<ChiTietHoaDon>> GetChiTietHoaDon(int id)
        {
            var chiTietHoaDon = await _context.ChiTietHoaDons.FindAsync(id);

            if (chiTietHoaDon == null)
            {
                return NotFound();
            }

            return chiTietHoaDon;
        }

        // PUT: api/ChiTietHoaDon/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutChiTietHoaDonMoi(int id, ChiTietHoaDon chiTietHoaDon)
        {
            /*if (id != chiTietHoaDon.Id)
            {
                return BadRequest();
            }

            _context.Entry(chiTietHoaDon).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ChiTietHoaDonExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();*/
            var ct = await _context.ChiTietHoaDons.FindAsync(id);
            if (ct == null)
                return NotFound();
            ct.soluong = chiTietHoaDon.soluong;
            _context.ChiTietHoaDons.Update(ct);
            await _context.SaveChangesAsync();
            return Ok(ct);
        }

        [HttpPut("daco")]
        public async Task<IActionResult> PutChiTietHoaDonDaCo(ChiTietHoaDon chiTiet)
        {
            var ct = await _context.ChiTietHoaDons.Where(x => x.HoaDon_ID == chiTiet.HoaDon_ID && x.MonAn_ID == chiTiet.MonAn_ID).FirstOrDefaultAsync();
            if (ct == null)
                return NotFound();
            ct.soluong++;
            _context.ChiTietHoaDons.Update(ct);
            await _context.SaveChangesAsync();
            return Ok(ct);
        }

        // POST: api/ChiTietHoaDon
        [HttpPost]
        public async Task<ActionResult<ChiTietHoaDon>> PostChiTietHoaDon(ChiTietHoaDon chiTietHoaDon)
        {
            _context.ChiTietHoaDons.Add(chiTietHoaDon);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetChiTietHoaDon", new { id = chiTietHoaDon.Id }, chiTietHoaDon);
        }

        // DELETE: api/ChiTietHoaDon/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<ChiTietHoaDon>> DeleteChiTietHoaDon(int id)
        {
            var chiTietHoaDon = await _context.ChiTietHoaDons.FindAsync(id);
            if (chiTietHoaDon == null)
            {
                return NotFound();
            }

            _context.ChiTietHoaDons.Remove(chiTietHoaDon);
            await _context.SaveChangesAsync();

            return chiTietHoaDon;
        }

        private bool ChiTietHoaDonExists(int id)
        {
            return _context.ChiTietHoaDons.Any(e => e.Id == id);
        }
    }
}
