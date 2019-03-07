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
    public class ThanhPhanMonAnController : ControllerBase
    {
        private readonly RestaurantContext _context;

        public ThanhPhanMonAnController(RestaurantContext context)
        {
            _context = context;
        }

        // GET: api/ThanhPhanMonAn
        [HttpGet]
        public async Task<ActionResult<IEnumerable<ThanhPhanMonAn>>> GetThanhPhanMonAns()
        {
            return await _context.ThanhPhanMonAns.ToListAsync();
        }

        [HttpGet("monan/{idMonan}")]
        public async Task<ActionResult<IEnumerable<ThanhPhanMonAn>>> GetThanhPhan(int idMonan)
        {
            return await _context.ThanhPhanMonAns.Where(x => x.MonAn_ID == idMonan).Include(x => x.NguyenLieu).ToListAsync();
        }
        // GET: api/ThanhPhanMonAn/5
        [HttpGet("{id}")]
        public async Task<ActionResult<ThanhPhanMonAn>> GetThanhPhanMonAn(int id)
        {
            var thanhPhanMonAn = await _context.ThanhPhanMonAns.FindAsync(id);

            if (thanhPhanMonAn == null)
            {
                return NotFound();
            }

            return thanhPhanMonAn;
        }

        // PUT: api/ThanhPhanMonAn/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutThanhPhanMonAn(int id, ThanhPhanMonAn thanhPhanMonAn)
        {
            if (id != thanhPhanMonAn.Id)
            {
                return BadRequest();
            }

            _context.Entry(thanhPhanMonAn).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ThanhPhanMonAnExists(id))
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

        // POST: api/ThanhPhanMonAn
        [HttpPost]
        public async Task<ActionResult<ThanhPhanMonAn>> PostThanhPhanMonAn(ThanhPhanMonAn thanhPhanMonAn)
        {
            var tp = await _context.ThanhPhanMonAns.Where(x => x.MonAn_ID == thanhPhanMonAn.MonAn_ID && x.NguyenLieu_ID == thanhPhanMonAn.NguyenLieu_ID).FirstOrDefaultAsync();
            if (tp == null)
            {
                _context.ThanhPhanMonAns.Add(thanhPhanMonAn);
            }
            else
            {
                tp.soluong = thanhPhanMonAn.soluong;
                _context.ThanhPhanMonAns.Update(tp);
            }
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetThanhPhanMonAn", new { id = thanhPhanMonAn.Id }, thanhPhanMonAn);
        }

        // DELETE: api/ThanhPhanMonAn/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<ThanhPhanMonAn>> DeleteThanhPhanMonAn(int id)
        {
            var thanhPhanMonAn = await _context.ThanhPhanMonAns.FindAsync(id);
            if (thanhPhanMonAn == null)
            {
                return NotFound();
            }

            _context.ThanhPhanMonAns.Remove(thanhPhanMonAn);
            await _context.SaveChangesAsync();

            return thanhPhanMonAn;
        }

        private bool ThanhPhanMonAnExists(int id)
        {
            return _context.ThanhPhanMonAns.Any(e => e.Id == id);
        }
    }
}
