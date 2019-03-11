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
    public class NhaCungCapController : ControllerBase
    {
        private readonly RestaurantContext _context;

        public NhaCungCapController(RestaurantContext context)
        {
            _context = context;
        }

        // GET: api/NhaCungCap
        [HttpGet]
        public async Task<ActionResult<IEnumerable<NhaCungCap>>> GetNhaCungCaps()
        {
            return await _context.NhaCungCaps.ToListAsync();
        }

        // GET: api/NhaCungCap/5
        [HttpGet("{id}")]
        public async Task<ActionResult<NhaCungCap>> GetNhaCungCap(int id)
        {
            var nhaCungCap = await _context.NhaCungCaps.FindAsync(id);

            if (nhaCungCap == null)
            {
                return NotFound();
            }

            return nhaCungCap;
        }

        // PUT: api/NhaCungCap/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutNhaCungCap(int id, NhaCungCap nhaCungCap)
        {
            var ncc = await _context.NhaCungCaps.FindAsync(id);
            if (ncc == null)
                return NotFound();
            ncc.ten = nhaCungCap.ten;
            ncc.diachi = nhaCungCap.diachi;
            ncc.sodienthoai = nhaCungCap.sodienthoai;
            _context.NhaCungCaps.Update(ncc);
            await _context.SaveChangesAsync();
            return Ok(ncc);
        }

        // POST: api/NhaCungCap
        [HttpPost]
        public async Task<ActionResult<NhaCungCap>> PostNhaCungCap(NhaCungCap nhaCungCap)
        {
            _context.NhaCungCaps.Add(nhaCungCap);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetNhaCungCap", new { id = nhaCungCap.Id }, nhaCungCap);
        }

        // DELETE: api/NhaCungCap/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<NhaCungCap>> DeleteNhaCungCap(int id)
        {
            var nhaCungCap = await _context.NhaCungCaps.FindAsync(id);
            if (nhaCungCap == null)
            {
                return NotFound();
            }

            _context.NhaCungCaps.Remove(nhaCungCap);
            await _context.SaveChangesAsync();

            return nhaCungCap;
        }

        private bool NhaCungCapExists(int id)
        {
            return _context.NhaCungCaps.Any(e => e.Id == id);
        }
    }
}
