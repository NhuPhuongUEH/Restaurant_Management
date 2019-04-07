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
    public class ChiTietPhieuNhapKhoController : ControllerBase
    {
        private readonly RestaurantContext _context;

        public ChiTietPhieuNhapKhoController(RestaurantContext context)
        {
            _context = context;
        }

        // GET: api/ChiTietPhieuNhapKho
        [HttpGet]
        public async Task<ActionResult<IEnumerable<ChiTietPhieuNhapKho>>> GetChiTietPhieuNhapKhos()
        {
            return await _context.ChiTietPhieuNhapKhos.Include(x => x.NguyenLieu).Include(x => x.PhieuNhapKho).ToListAsync();
        }

        // GET: api/ChiTietPhieuNhapKho/5
        [HttpGet("{id}")]
        public async Task<ActionResult<ChiTietPhieuNhapKho>> GetChiTietPhieuNhapKho(int id)
        {
            var chiTietPhieuNhapKho = await _context.ChiTietPhieuNhapKhos.Where(x => x.Id == id).Include(x => x.NguyenLieu).Include(x => x.PhieuNhapKho).FirstOrDefaultAsync();

            if (chiTietPhieuNhapKho == null)
            {
                return NotFound();
            }

            return chiTietPhieuNhapKho;
        }

        [HttpGet("phieunhapkho/{idphieu}")]
        public async Task<ActionResult<IEnumerable<ChiTietPhieuNhapKho>>> Get(int idphieu)
        {
            return await _context.ChiTietPhieuNhapKhos.Where(x => x.PhieuNhapKho_ID == idphieu).Include(x => x.NguyenLieu).Include(x => x.PhieuNhapKho).ToListAsync();
        }

        // PUT: api/ChiTietPhieuNhapKho/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutChiTietPhieuNhapKho(int id, ChiTietPhieuNhapKho chiTietPhieuNhapKho)
        {
            var a = await _context.ChiTietPhieuNhapKhos.FindAsync(id);
            if (a == null)
                return NotFound();
            a.soluong = chiTietPhieuNhapKho.soluong;
            a.gia = chiTietPhieuNhapKho.gia;
            a.donvi = chiTietPhieuNhapKho.donvi;
            a.NguyenLieu_ID = chiTietPhieuNhapKho.NguyenLieu_ID;
            a.PhieuNhapKho_ID = chiTietPhieuNhapKho.PhieuNhapKho_ID;
            _context.ChiTietPhieuNhapKhos.Update(a);
            await _context.SaveChangesAsync();
            return Ok(a);
        }


        // POST: api/ChiTietPhieuNhapKho
        [HttpPost]
        public async Task<ActionResult<ChiTietPhieuNhapKho>> PostChiTietPhieuNhapKho(ChiTietPhieuNhapKho chiTietPhieuNhapKho)
        {
            NguyenLieu nl = await _context.NguyenLieus.SingleAsync(x => x.Id == chiTietPhieuNhapKho.NguyenLieu_ID);
            nl.soluong += chiTietPhieuNhapKho.soluong;
            _context.ChiTietPhieuNhapKhos.Add(chiTietPhieuNhapKho);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetChiTietPhieuNhapKho", new { id = chiTietPhieuNhapKho.Id }, chiTietPhieuNhapKho);
        }

        // DELETE: api/ChiTietPhieuNhapKho/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<ChiTietPhieuNhapKho>> DeleteChiTietPhieuNhapKho(int id)
        {
            var chiTietPhieuNhapKho = await _context.ChiTietPhieuNhapKhos.FindAsync(id);
            if (chiTietPhieuNhapKho == null)
            {
                return NotFound();
            }
            NguyenLieu nl = await _context.NguyenLieus.SingleAsync(x => x.Id == chiTietPhieuNhapKho.NguyenLieu_ID);
            nl.soluong -= chiTietPhieuNhapKho.soluong;
            _context.ChiTietPhieuNhapKhos.Remove(chiTietPhieuNhapKho);
            await _context.SaveChangesAsync();

            return chiTietPhieuNhapKho;
        }

        private bool ChiTietPhieuNhapKhoExists(int id)
        {
            return _context.ChiTietPhieuNhapKhos.Any(e => e.Id == id);
        }
    }
}
