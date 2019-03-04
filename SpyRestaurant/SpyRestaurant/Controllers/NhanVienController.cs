using System;
using System.Collections.Generic;
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
    public class NhanVienController : ControllerBase
    {
        private readonly RestaurantContext _context;

        public NhanVienController(RestaurantContext context)
        {
            _context = context;
        }

        [HttpPost("login")]
        public async Task<ActionResult<BaseRespone>> GetInfoLogin(LoginRequest lgin)
        {
            NhanVien nv = await _context.NhanViens.FirstOrDefaultAsync(x => x.matkhau.Equals(lgin.matkhau) && x.email.Equals(lgin.email));
            LoginRespone loginRespone = new LoginRespone();
            if (nv != null)
            {
                loginRespone.id = nv.Id;
                loginRespone.ho = nv.honhanvien;
                loginRespone.ten = nv.tennhanvien;
                loginRespone.trangthai = nv.trangthai;
                loginRespone.token = "";
                return new BaseRespone(loginRespone);
            }
            return new BaseRespone
            {
                ErrorCode = 1,
                Message = "Sai tên đăng nhập hoặc mật khẩu"
            };
        }
        // GET: api/NhanVien
        [HttpGet]
        public async Task<ActionResult<IEnumerable<NhanVien>>> GetNhanViens()
        {
            return await _context.NhanViens.ToListAsync();
        }

        // GET: api/NhanVien/5
        [HttpGet("{id}")]
        public async Task<ActionResult<NhanVien>> GetNhanVien(int id)
        {
            var nhanVien = await _context.NhanViens.FindAsync(id);

            if (nhanVien == null)
            {
                return NotFound();
            }

            return nhanVien;
        }

        // PUT: api/NhanVien/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutNhanVien(int id, NhanVien nhanVien)
        {
            if (id != nhanVien.Id)
            {
                return BadRequest();
            }

            _context.Entry(nhanVien).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!NhanVienExists(id))
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

        // POST: api/NhanVien
        [HttpPost]
        public async Task<ActionResult<NhanVien>> PostNhanVien(NhanVien nhanVien)
        {
            _context.NhanViens.Add(nhanVien);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetNhanVien", new { id = nhanVien.Id }, nhanVien);
        }

        // DELETE: api/NhanVien/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<NhanVien>> DeleteNhanVien(int id)
        {
            var nhanVien = await _context.NhanViens.FindAsync(id);
            if (nhanVien == null)
            {
                return NotFound();
            }

            _context.NhanViens.Remove(nhanVien);
            await _context.SaveChangesAsync();

            return nhanVien;
        }

        private bool NhanVienExists(int id)
        {
            return _context.NhanViens.Any(e => e.Id == id);
        }
    }
}
