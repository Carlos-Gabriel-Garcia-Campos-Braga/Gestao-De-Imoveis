using GestaoImoveisAPI.Data;
using GestaoImoveisAPI.DTOs;
using GestaoImoveisAPI.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using SharedClasses.ValueObjects;

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
        public async Task<IActionResult> Create([FromBody] RentalContractInputModel rc)
        {
            if (rc == null || rc.Renter == null || rc.Adress == null || rc.Bills == null)
                return BadRequest("Dados incompletos");

            Console.WriteLine("===== RECEBIDO NA API =====");
            Console.WriteLine($"Renter: {rc.Renter?.Name} - {rc.Renter?.CPF}");
            Console.WriteLine($"Adress: {rc.Adress?.Street} - {rc.Adress?.Number}");
            Console.WriteLine($"Bills count: {rc.Bills?.Count}");
            Console.WriteLine($"Start: {rc.StartContract}, End: {rc.EndContract}, Value: {rc.RentalValue}");

            // Primeiro salvamos o Renter e o Adress
            var renter = new Renter
            {
                Name = rc.Renter.Name,
                CPF = new CPF(rc.Renter.CPF),
                PhoneNumber = new PhoneNumber(rc.Renter.PhoneNumber)
            };

            var adress = new Adress(
                    rc.Adress.Street,
                    rc.Adress.Complement,
                    rc.Adress.Number,
                    rc.Adress.City,
                    rc.Adress.State,
                    rc.Adress.ZipCode);

            var bills = rc.Bills.Select(b => new Bills
            {
                Type = b.Type,
                ValidationDate = b.ValidationDate,
                Value = new Money(b.Value)
            }).
              ToList();

            var rentalContract = new RentalContract
            {
                StartContract = rc.StartContract,
                EndContract = rc.EndContract,
                RentalValue = new Money(rc.RentalValue),
                Adress = adress,
                Renter = renter,
                Bills = bills,
            };

            
            _context.Renter.Add(renter);
            await _context.SaveChangesAsync();

            renter.Id = rentalContract.RenterId;
            _context.Contract.Add(rentalContract);

            await _context.SaveChangesAsync();

            // Agora salva o contrato com os IDs corretos
            await _context.SaveChangesAsync();

            return CreatedAtAction(nameof(GetAll), new { id = rentalContract.Id }, rentalContract);
        }

    }
}
