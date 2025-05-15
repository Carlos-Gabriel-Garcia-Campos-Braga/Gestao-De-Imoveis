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
        public async Task<ActionResult<IEnumerable<RentalContract>>> GetAll()
        {
            var list = await _context.Contract
                .Include(rc => rc.Renter)
                .Include(rc => rc.Adress)
                .Include(rc => rc.Bills)
                .ToListAsync();

            return Ok(list);
        }

        [HttpPost]
        public async Task<IActionResult> Create([FromBody] RentalContract rc)
        {
            if (rc == null || rc.Renter == null || rc.Adress == null || rc.Bills == null)
                return BadRequest("Dados incompletos");

            Console.WriteLine("===== RECEBIDO NA API =====");
            Console.WriteLine($"Renter: {rc.Renter?.Name} - {rc.Renter?.CPF}");
            Console.WriteLine($"Adress: {rc.Adress?.Street} - {rc.Adress?.Number}");
            Console.WriteLine($"Bills count: {rc.Bills?.Count}");
            Console.WriteLine($"Start: {rc.StartContract}, End: {rc.EndContract}, Value: {rc.RentalValue}");

            // Primeiro salvamos o Renter e o Adress
            _context.Renter.Add(rc.Renter);
            _context.Adress.Add(rc.Adress);
            await _context.SaveChangesAsync();

            // Atribuímos os IDs salvos
            rc.RenterId = rc.Renter.Id;
            rc.AdressId = rc.Adress.Id;

            // Salva as bills e associa ao contrato
            foreach (var bill in rc.Bills)
            {
                _context.Bills.Add(bill);
            }

            // Agora salva o contrato com os IDs corretos
            _context.Contract.Add(rc);
            await _context.SaveChangesAsync();

            return CreatedAtAction(nameof(GetAll), new { id = rc.Id }, rc);
        }

    }
}
