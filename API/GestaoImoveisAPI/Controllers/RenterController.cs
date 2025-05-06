using GestaoImoveisAPI.Data;
using GestaoImoveisAPI.Models;
using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace GestaoImoveisAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class RenterController : ControllerBase
    {
        private readonly AppDbContext _context;

        public RenterController(AppDbContext context)
        {
            _context = context;
        }

        //GET api/renters
        [HttpGet]
        public async Task<IActionResult> GetAll()
        {
            var list = await _context.Renter.
                                            Include(r => r.Contracts)
                                            .ThenInclude(c => c.Bills)
                                            .ToListAsync();

            return Ok(list);
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            var renter = await _context.Renter
                                              .Include(r => r.Contracts)
                                              .ThenInclude(c => c.Bills)
                                              .FirstOrDefaultAsync(r => r.Id == id);
            if (renter == null)
                return NotFound();

            return Ok(renter);
        }

        //POST api/renters
        [HttpPost]
        public async Task<IActionResult> Create(Renter r)
        {
            _context.Renter.Add(r);
            await _context.SaveChangesAsync();
            return CreatedAtAction(nameof(GetById), new {id = r.Id}, r);
        }
    }
}
