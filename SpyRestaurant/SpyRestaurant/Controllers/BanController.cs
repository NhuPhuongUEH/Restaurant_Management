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
    public class BanController : ControllerBase
    {
        private readonly RestaurantContext _context;

        public BanController(RestaurantContext context)
        {
            _context = context;
        }

        // GET: api/Ban
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Ban>>> GetBans()
        {
            return await _context.Bans.ToListAsync();
        }

        // GET: api/Ban/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Ban>> GetBan(int id)
        {
            var ban = await _context.Bans.FindAsync(id);

            if (ban == null)
            {
                return NotFound();
            }

            return ban;
        }

        //Get lay hoa don cua ban
        [HttpGet("hoadon/{idban}")]
        public async Task<ActionResult<int>> GetHoaDon(int idban)
        {
            try
            {
                var ban = await _context.Bans.FindAsync(idban);
                if (ban.hoadondangphucvu == null)
                {
                    return _context.HoaDons.Max(x => x.Id) + 1;
                }
                return ban.hoadondangphucvu;
            }
            catch
            {
                return 1;
            }
        }
        // PUT: api/Ban/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutBan(int id, Ban ban)
        {
            var b = await _context.Bans.FindAsync(id);
            if (b == null)
                return NotFound();
            b.trangthai = ban.trangthai;
            b.hoadondangphucvu = ban.hoadondangphucvu;
            _context.Bans.Update(b);
            await _context.SaveChangesAsync();
            return Ok(b);
        }

        // POST: api/Ban
        [HttpPost]
        public async Task<ActionResult<Ban>> PostBan(Ban ban)
        {
            _context.Bans.Add(ban);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetBan", new { id = ban.Id }, ban);
        }

        // DELETE: api/Ban/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<Ban>> DeleteBan(int id)
        {
            var ban = await _context.Bans.FindAsync(id);
            if (ban == null)
            {
                return NotFound();
            }

            _context.Bans.Remove(ban);
            await _context.SaveChangesAsync();

            return ban;
        }

        private bool BanExists(int id)
        {
            return _context.Bans.Any(e => e.Id == id);
        }
    }
}
