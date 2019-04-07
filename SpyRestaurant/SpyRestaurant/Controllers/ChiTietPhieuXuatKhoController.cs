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
    public class ChiTietPhieuXuatKhoController : ControllerBase
    {
        private readonly RestaurantContext _context;

        public ChiTietPhieuXuatKhoController(RestaurantContext context)
        {
            _context = context;
        }

        // GET: api/ChiTietPhieuXuatKho
        [HttpGet]
        public async Task<ActionResult<IEnumerable<ChiTietPhieuXuatKho>>> GetChiTietPhieuXuatKhos()
        {
            return await _context.ChiTietPhieuXuatKhos.Include(x => x.NguyenLieu).Include(x => x.PhieuXuatKho).ToListAsync();
        }

        // GET: api/ChiTietPhieuXuatKho/5
        [HttpGet("{id}")]
        public async Task<ActionResult<ChiTietPhieuXuatKho>> GetChiTietPhieuXuatKho(int id)
        {
            var chiTietPhieuXuatKho = await _context.ChiTietPhieuXuatKhos.Where(x => x.Id == id).Include(x => x.PhieuXuatKho).Include(x => x.NguyenLieu).FirstOrDefaultAsync();

            if (chiTietPhieuXuatKho == null)
            {
                return NotFound();
            }

            return chiTietPhieuXuatKho;
        }

        [HttpGet("phieuxuatkho/{idphieu}")]
        public async Task<ActionResult<IEnumerable<ChiTietPhieuXuatKho>>> Get(int idphieu)
        {
            return await _context.ChiTietPhieuXuatKhos.Where(x => x.PhieuXuatKho_ID == idphieu).Include(x => x.NguyenLieu).Include(x => x.PhieuXuatKho).ToListAsync();
        }

        // PUT: api/ChiTietPhieuXuatKho/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutChiTietPhieuXuatKho(int id, ChiTietPhieuXuatKho chiTietPhieuXuatKho)
        {
            var a = await _context.ChiTietPhieuXuatKhos.FindAsync(id);
            if (a == null)
                return NotFound();
            a.soluong = chiTietPhieuXuatKho.soluong;
            //a.gia = chiTietPhieuXuatKho.gia;
            a.donvi = chiTietPhieuXuatKho.donvi;
            a.NguyenLieu_ID = chiTietPhieuXuatKho.NguyenLieu_ID;
            a.PhieuXuatKho_ID = chiTietPhieuXuatKho.PhieuXuatKho_ID;
            _context.ChiTietPhieuXuatKhos.Update(a);
            await _context.SaveChangesAsync();
            return Ok(a);
        }

        // POST: api/ChiTietPhieuXuatKho
        [HttpPost]
        public async Task<ActionResult<ChiTietPhieuXuatKho>> PostChiTietPhieuXuatKho(ChiTietPhieuXuatKho chiTietPhieuXuatKho)
        {
            NguyenLieu nl = await _context.NguyenLieus.SingleAsync(x => x.Id == chiTietPhieuXuatKho.NguyenLieu_ID);
            nl.soluong -= chiTietPhieuXuatKho.soluong;
            _context.ChiTietPhieuXuatKhos.Add(chiTietPhieuXuatKho);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetChiTietPhieuXuatKho", new { id = chiTietPhieuXuatKho.Id }, chiTietPhieuXuatKho);
        }

        // DELETE: api/ChiTietPhieuXuatKho/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<ChiTietPhieuXuatKho>> DeleteChiTietPhieuXuatKho(int id)
        {
            var chiTietPhieuXuatKho = await _context.ChiTietPhieuXuatKhos.FindAsync(id);
            if (chiTietPhieuXuatKho == null)
            {
                return NotFound();
            }
            NguyenLieu nl = await _context.NguyenLieus.SingleAsync(x => x.Id == chiTietPhieuXuatKho.NguyenLieu_ID);
            nl.soluong += chiTietPhieuXuatKho.soluong;
            _context.ChiTietPhieuXuatKhos.Remove(chiTietPhieuXuatKho);
            await _context.SaveChangesAsync();

            return chiTietPhieuXuatKho;
        }

        private bool ChiTietPhieuXuatKhoExists(int id)
        {
            return _context.ChiTietPhieuXuatKhos.Any(e => e.Id == id);
        }
    }
}
