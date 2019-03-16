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
    public class PhieuXuatKhoController : ControllerBase
    {
        private readonly RestaurantContext _context;

        public PhieuXuatKhoController(RestaurantContext context)
        {
            _context = context;
        }

        // GET: api/PhieuXuatKho
        [HttpGet]
        public async Task<ActionResult<IEnumerable<PhieuXuatKho>>> GetPhieuXuatKhos()
        {
            return await _context.PhieuXuatKhos.Include(x => x.NhanVien).ToListAsync();
        }

        // GET: api/PhieuXuatKho/5
        [HttpGet("{id}")]
        public async Task<ActionResult<PhieuXuatKho>> GetPhieuXuatKho(int id)
        {
            var phieuXuatKho = await _context.PhieuXuatKhos.Where(x => x.Id == id).Include(x => x.NhanVien).FirstOrDefaultAsync();

            if (phieuXuatKho == null)
            {
                return NotFound();
            }

            return phieuXuatKho;
        }

        // PUT: api/PhieuXuatKho/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutPhieuXuatKho(int id, PhieuXuatKho phieuXuatKho)
        {
            if (id != phieuXuatKho.Id)
            {
                return BadRequest();
            }

            _context.Entry(phieuXuatKho).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!PhieuXuatKhoExists(id))
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

        // POST: api/PhieuXuatKho
        [HttpPost]
        public async Task<ActionResult<PhieuXuatKho>> PostPhieuXuatKho(PhieuXuatKho phieuXuatKho)
        {
            _context.PhieuXuatKhos.Add(phieuXuatKho);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetPhieuXuatKho", new { id = phieuXuatKho.Id }, phieuXuatKho);
        }

        // DELETE: api/PhieuXuatKho/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<PhieuXuatKho>> DeletePhieuXuatKho(int id)
        {
            var phieuXuatKho = await _context.PhieuXuatKhos.FindAsync(id);
            if (phieuXuatKho == null)
            {
                return NotFound();
            }

            _context.PhieuXuatKhos.Remove(phieuXuatKho);
            await _context.SaveChangesAsync();

            return phieuXuatKho;
        }

        private bool PhieuXuatKhoExists(int id)
        {
            return _context.PhieuXuatKhos.Any(e => e.Id == id);
        }
    }
}
