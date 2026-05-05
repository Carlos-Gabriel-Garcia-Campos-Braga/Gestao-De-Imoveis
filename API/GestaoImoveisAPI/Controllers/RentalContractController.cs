using GestaoImoveisAPI.Application.Leasing.ApplyReadjustment;
using GestaoImoveisAPI.Application.Leasing.CreateContract;
using GestaoImoveisAPI.Domain.Leasing.Repositories;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using SharedClasses.InputDTOs;
using SharedClasses.OutputsDTOs;

namespace GestaoImoveisAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    [Authorize]
    public class RentalContractController : ControllerBase
    {
        private readonly IRentalContractRepository _repository;
        private readonly CreateContractHandler _createHandler;
        private readonly ApplyReadjustmentHandler _readjustmentHandler;

        public RentalContractController(
            IRentalContractRepository repository,
            CreateContractHandler createHandler,
            ApplyReadjustmentHandler readjustmentHandler)
        {
            _repository = repository;
            _createHandler = createHandler;
            _readjustmentHandler = readjustmentHandler;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<RentalContractOutputModel>>> GetAll(CancellationToken ct)
        {
            var contracts = await _repository.GetAllWithDetailsAsync(ct);
            return Ok(contracts.Select(ToOutput));
        }

        [HttpPost]
        public async Task<IActionResult> Create([FromBody] RentalContractInputModel input, CancellationToken ct)
        {
            var output = await _createHandler.HandleAsync(input, ct);
            return CreatedAtAction(nameof(GetAll), output);
        }

        [HttpPatch("{id}/readjustment")]
        public async Task<IActionResult> ApplyReadjustment(
            int id,
            [FromBody] ApplyReadjustmentInputModel input,
            CancellationToken ct)
        {
            var output = await _readjustmentHandler.HandleAsync(id, input, ct);
            return Ok(output);
        }

        private static RentalContractOutputModel ToOutput(Domain.Leasing.RentalContract rc) =>
            new()
            {
                Id = rc.Id,
                Renter = new RenterOutputModel
                {
                    Id = rc.Renter.Id,
                    Name = rc.Renter.Name ?? string.Empty,
                    CPF = rc.Renter.CPF?.Value ?? string.Empty,
                    PhoneNumber = rc.Renter.PhoneNumber?.Value ?? string.Empty
                },
                Adress = new AdressOutputModel
                {
                    Street = rc.Adress.Street ?? string.Empty,
                    Complement = rc.Adress.Complement,
                    Number = rc.Adress.Number ?? string.Empty,
                    Neighborhood = rc.Adress.Neighborhood ?? string.Empty,
                    City = rc.Adress.City ?? string.Empty,
                    State = rc.Adress.State ?? string.Empty,
                    ZipCode = rc.Adress.ZipCode ?? string.Empty
                },
                Bills = rc.Bills.Select(b => new BillsOutputModel
                {
                    Id = b.Id,
                    RentalContractId = b.RentalContractId,
                    Type = b.Type,
                    ValidationDate = b.ValidationDate,
                    Value = b.Value.Amount
                }).ToList(),
                StartContract = rc.StartContract,
                EndContract = rc.EndContract,
                RentalValue = rc.RentalValue.Amount,
                PreferredIndex = rc.PreferredIndex.ToString(),
                ReadjustmentHistory = rc.ReadjustmentHistory
                    .Select(ApplyReadjustmentHandler.ToOutput)
                    .ToList()
            };
    }
}
