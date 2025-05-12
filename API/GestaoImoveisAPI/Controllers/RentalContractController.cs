using GestaoImoveisAPI.Data;
using GestaoImoveisAPI.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace GestaoImoveisAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class RentalContractController : ControllerBase
    {
        private readonly AppDbContext _context;

        public RentalContractController(AppDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<IActionResult> GetAll()
        {
            var list = await _context.Contract
                                              .Include(r => r.Renter)
                                              .Include(b => b.Bills)
                                              .Include(a => a.Adress)
                                              .ToListAsync();
            return Ok(list);
        }

        [HttpPost]
        public async Task<IActionResult> Create(RentalContract rc)
        {
            _context.Contract.Add(rc);
            await _context.SaveChangesAsync();
            return CreatedAtAction(nameof(GetAll), new { id = rc.Id }, rc);
        }
    } 
}
