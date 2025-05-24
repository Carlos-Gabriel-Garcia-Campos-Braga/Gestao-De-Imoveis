using GestaoImoveisAPI.Data;
using GestaoImoveisAPI.DTOs;
using GestaoImoveisAPI.OutputModels;
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
        public async Task<ActionResult<IEnumerable<RentalContractOutputModel>>> GetAll()
        {
            var list = await _context.Contract
                .Include(rc => rc.Renter)
                .Include(rc => rc.Adress)
                .Include(rc => rc.Bills)
                .ToListAsync();

            var outputList = list.Select(rc => new RentalContractOutputModel
            {
                Renter = new RenterOutputModel
                {
                    Name = rc.Renter.Name,
                    CPF = rc.Renter?.CPF?.Value,
                    PhoneNumber = rc.Renter?.PhoneNumber?.Value
                },

                Adress = new AdressOutputModel
                {
                    Street = rc.Adress.Street,
                    Complement = rc.Adress.Complement,
                    Number = rc.Adress.Number,
                    Neighborhood = rc.Adress.Neighborhood,
                    City = rc.Adress.City,
                    State = rc.Adress.State,
                    ZipCode = rc.Adress.ZipCode
                },

                Bills = rc.Bills.Select(b => new BillsOutputModel
                {
                    Type = b.Type,
                    ValidationDate = b.ValidationDate,
                    Value = b.Value.Amount
                }).ToList(),

                StartContract = rc.StartContract,
                EndContract = rc.EndContract,
                RentalValue = rc.RentalValue.Amount
            }).ToList();

            return Ok(outputList);
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

            _context.Renter.Add(renter);
            await _context.SaveChangesAsync();

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
                RenterId = renter.Id,
                Bills = bills
            };

            

            _context.Contract.Add(rentalContract);
            // Agora salva o contrato com os IDs corretos
            await _context.SaveChangesAsync();

            return CreatedAtAction(nameof(GetAll), new { id = rentalContract.Id }, rentalContract);
        }

    }
}
