using GestaoImoveisAPI.Application.Leasing.AddBillToContract;
using GestaoImoveisAPI.Data;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using SharedClasses.InputDTOs;
using SharedClasses.OutputsDTOs;

namespace GestaoImoveisAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    [Authorize]
    public class BillsController : ControllerBase
    {
        private readonly AppDbContext _context;
        private readonly AddBillToContractHandler _addBillHandler;

        public BillsController(AppDbContext context, AddBillToContractHandler addBillHandler)
        {
            _context = context;
            _addBillHandler = addBillHandler;
        }

        [HttpGet]
        public async Task<IActionResult> GetAll(CancellationToken ct)
        {
            var list = await _context.Bills
                .Select(b => new BillsOutputModel
                {
                    Id = b.Id,
                    RentalContractId = b.RentalContractId,
                    Type = b.Type,
                    ValidationDate = b.ValidationDate,
                    Value = b.Value.Amount
                })
                .ToListAsync(ct);

            return Ok(list);
        }

        [HttpPost]
        public async Task<IActionResult> Create([FromBody] BillsInputModel input, CancellationToken ct)
        {
            var output = await _addBillHandler.HandleAsync(input, ct);
            return CreatedAtAction(nameof(GetAll), new { id = output.Id }, output);
        }
    }
}
