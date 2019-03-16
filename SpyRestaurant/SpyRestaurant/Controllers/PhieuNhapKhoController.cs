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
    public class PhieuNhapKhoController : ControllerBase
    {
        private readonly RestaurantContext _context;

        public PhieuNhapKhoController(RestaurantContext context)
        {
            _context = context;
        }

        // GET: api/PhieuNhapKho
        [HttpGet]
        public async Task<ActionResult<IEnumerable<PhieuNhapKho>>> GetPhieuNhapKhos()
        {
            return await _context.PhieuNhapKhos.Include(x => x.NhaCungCap).Include(x => x.NhanVien).ToListAsync();
        }

        // GET: api/PhieuNhapKho/5
        [HttpGet("{id}")]
        public async Task<ActionResult<PhieuNhapKho>> GetPhieuNhapKho(int id)
        {
            var phieuNhapKho = await _context.PhieuNhapKhos.Where(x => x.Id == id).Include(x => x.NhaCungCap).Include(x => x.NhanVien).FirstOrDefaultAsync();

            if (phieuNhapKho == null)
            {
                return NotFound();
            }

            return phieuNhapKho;
        }

        // PUT: api/PhieuNhapKho/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutPhieuNhapKho(int id, PhieuNhapKho phieuNhapKho)
        {
            if (id != phieuNhapKho.Id)
            {
                return BadRequest();
            }

            _context.Entry(phieuNhapKho).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!PhieuNhapKhoExists(id))
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

        // POST: api/PhieuNhapKho
        [HttpPost]
        public async Task<ActionResult<PhieuNhapKho>> PostPhieuNhapKho(PhieuNhapKho phieuNhapKho)
        {
            _context.PhieuNhapKhos.Add(phieuNhapKho);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetPhieuNhapKho", new { id = phieuNhapKho.Id }, phieuNhapKho);
        }

        // DELETE: api/PhieuNhapKho/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<PhieuNhapKho>> DeletePhieuNhapKho(int id)
        {
            var phieuNhapKho = await _context.PhieuNhapKhos.FindAsync(id);
            if (phieuNhapKho == null)
            {
                return NotFound();
            }

            _context.PhieuNhapKhos.Remove(phieuNhapKho);
            await _context.SaveChangesAsync();

            return phieuNhapKho;
        }

        private bool PhieuNhapKhoExists(int id)
        {
            return _context.PhieuNhapKhos.Any(e => e.Id == id);
        }
    }
}
