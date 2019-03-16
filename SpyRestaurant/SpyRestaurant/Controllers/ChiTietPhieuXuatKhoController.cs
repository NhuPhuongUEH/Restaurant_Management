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
            var chiTietPhieuXuatKho = await _context.ChiTietPhieuXuatKhos.FindAsync(id);

            if (chiTietPhieuXuatKho == null)
            {
                return NotFound();
            }

            return chiTietPhieuXuatKho;
        }

        // PUT: api/ChiTietPhieuXuatKho/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutChiTietPhieuXuatKho(int id, ChiTietPhieuXuatKho chiTietPhieuXuatKho)
        {
            if (id != chiTietPhieuXuatKho.Id)
            {
                return BadRequest();
            }

            _context.Entry(chiTietPhieuXuatKho).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ChiTietPhieuXuatKhoExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/ChiTietPhieuXuatKho
        [HttpPost]
        public async Task<ActionResult<ChiTietPhieuXuatKho>> PostChiTietPhieuXuatKho(ChiTietPhieuXuatKho chiTietPhieuXuatKho)
        {
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
