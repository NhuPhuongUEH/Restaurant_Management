using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using SpyRestaurant.Models;

namespace SpyRestaurant.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class HoaDonController : ControllerBase
    {
        private readonly RestaurantContext _context;

        public HoaDonController(RestaurantContext context)
        {
            _context = context;
        }

        // GET: api/HoaDon
        [HttpGet]
        public async Task<ActionResult<IEnumerable<HoaDon>>> GetHoaDons()
        {
            //return await _context.HoaDons.ToListAsync();
            return await _context.HoaDons.Select(x => new HoaDon
            {
                Id = x.Id,
                ngay = x.ngay,
                trangthai = x.trangthai,
                ghichu = x.ghichu,
                Ban_ID = x.Ban_ID,
                NhanVien_ID = x.NhanVien_ID,
                KhachHang_ID = x.KhachHang_ID,
                Ban = x.Ban,
                NhanVien = x.NhanVien,
                KhachHang = x.KhachHang,
                tongtien = _context.ChiTietHoaDons.Where(t => t.HoaDon_ID == x.Id).Sum(t => t.soluong * t.dongia)
            }).ToListAsync();
        }

        // GET: api/HoaDon/5
        [HttpGet("{id}")]
        public async Task<ActionResult<HoaDon>> GetHoaDon(int id)
        {
            var hoaDon = await _context.HoaDons.Where(x => x.Id == id).Include(x => x.KhachHang).Include(x => x.NhanVien).FirstOrDefaultAsync();

            if (hoaDon == null)
            {
                return new HoaDon { Id = 0 };
            }

            return hoaDon;
        }

        //Get tong tien
        [HttpGet("tongtien/{idHD}")]
        public async Task<ActionResult<double>> GetTongTien(int idHD)
        {
            var hoaDon = await _context.HoaDons.FindAsync(idHD);
            return _context.ChiTietHoaDons.Where(x => x.HoaDon_ID == idHD).Sum(x => x.soluong * x.dongia);
        }

        // PUT: api/HoaDon/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutHoaDon(int id, HoaDon hoaDon)
        {
            var hd = await _context.HoaDons.FindAsync(id);
            if (hd == null)
                return NotFound();
            hd.ghichu = hoaDon.ghichu;
            hd.NhanVien_ID = hoaDon.NhanVien_ID;
            hd.trangthai = hoaDon.trangthai;
            _context.HoaDons.Update(hd);
            await _context.SaveChangesAsync();
            return Ok(hd);
        }
        // PUT: api/HoaDon/tinhtrang/5
        [HttpPut("tinhtrang/{id}")]
        public async Task<IActionResult> PutTinhTrangHoaDon(int id, HoaDon hoaDon)
        {
            var hd = await _context.HoaDons.FindAsync(id);
            if (hd == null)
                return NotFound();
            hd.trangthai = hoaDon.trangthai;
            _context.HoaDons.Update(hd);
            await _context.SaveChangesAsync();
            return Ok(hd);
        }

        // POST: api/HoaDon
        [HttpPost]
        public async Task<ActionResult<HoaDon>> PostHoaDon(HoaDon hoaDon)
        {
            _context.HoaDons.Add(hoaDon);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetHoaDon", new { id = hoaDon.Id }, hoaDon);
        }

        // DELETE: api/HoaDon/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<HoaDon>> DeleteHoaDon(int id)
        {
            var hoaDon = await _context.HoaDons.FindAsync(id);
            if (hoaDon == null)
            {
                return NotFound();
            }

            _context.HoaDons.Remove(hoaDon);
            await _context.SaveChangesAsync();

            return hoaDon;
        }

        private bool HoaDonExists(int id)
        {
            return _context.HoaDons.Any(e => e.Id == id);
        }
    }
}
