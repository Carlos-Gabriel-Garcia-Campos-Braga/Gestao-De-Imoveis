using GestaoImoveisAPI.Data;
using SharedClasses.InputDTOs;
using GestaoImoveisAPI.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using SharedClasses.ValueObjects;
using SharedClasses.OutputsDTOs;
using GestaoImoveisAPI.Validators;
using GestaoImoveisAPI.Interfaces;

namespace GestaoImoveisAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class RentalContractController : ControllerBase
    {
        private readonly AppDbContext _context;
        private readonly IRentalContract _rentalContract;
        private readonly RentalContractValidator _validator;

        public RentalContractController(AppDbContext context, RentalContractValidator validator, IRentalContract rentalContract)
        {
            _context = context;
            _rentalContract = rentalContract;
            _validator = validator;
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
            if (rc == null)
            {
                return BadRequest(new { Errors = new List<string> { "Dados do contrato são obrigatórios." } });
            }

            var validData = _validator.IsValidData(rc);
            if (validData.Any)
            {
                return BadRequest(new { Errors = validData.Errors });
            }

            try
            {
                var createdContract = await _rentalContract.createContract(rc);
                return CreatedAtAction(nameof(GetAll), new { id = createdContract.Id }, createdContract);
            }
            catch (Exception ex)
            {
                return BadRequest(new { Errors = new List<string> { ex.Message } });
            }
        }

    }
}
