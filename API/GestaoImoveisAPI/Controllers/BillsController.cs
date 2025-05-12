using GestaoImoveisAPI.Data;
using GestaoImoveisAPI.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace GestaoImoveisAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class BillsController : ControllerBase
    {
        private readonly AppDbContext _context;

        public BillsController(AppDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<IActionResult> GetAll()
        {
            var list = await _context.Bills
                                              .Include(b => b.RentalContract)
                                              .ThenInclude(rc => rc.Renter)
                                              .Include(b => b.RentalContract)
                                              .ThenInclude(rc => rc.Adress)
                                              .ToListAsync();
            return Ok(list);
        }

        [HttpPost]
        public async Task<IActionResult> Create(Bills b)
        {
            _context.Bills.Add(b);
            await _context.SaveChangesAsync();
            return CreatedAtAction(nameof(GetAll), new { id = b.Id }, b);
        }
    }
}
