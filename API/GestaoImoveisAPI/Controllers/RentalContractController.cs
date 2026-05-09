using GestaoImoveisAPI.Application.Leasing.ApplyReadjustment;
using GestaoImoveisAPI.Application.Leasing.CreateContract;
using GestaoImoveisAPI.Domain.Leasing.Repositories;
using GestaoImoveisAPI.Domain.Property;
using GestaoImoveisAPI.Domain.Property.Repositories;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using SharedClasses.InputDTOs;
using SharedClasses.OutputsDTOs;

namespace GestaoImoveisAPI.Controllers
{
    public record TerminateContractRequest(string TerminatedBy, DateTime? TerminatedAt);

    [ApiController]
    [Route("api/[controller]")]
    [Authorize]
    public class RentalContractController : ControllerBase
    {
        private readonly IRentalContractRepository _repository;
        private readonly IPropertyRepository _propertyRepository;
        private readonly CreateContractHandler _createHandler;
        private readonly ApplyReadjustmentHandler _readjustmentHandler;

        public RentalContractController(
            IRentalContractRepository repository,
            IPropertyRepository propertyRepository,
            CreateContractHandler createHandler,
            ApplyReadjustmentHandler readjustmentHandler)
        {
            _repository = repository;
            _propertyRepository = propertyRepository;
            _createHandler = createHandler;
            _readjustmentHandler = readjustmentHandler;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<RentalContractOutputModel>>> GetAll(CancellationToken ct)
        {
            var contracts = await _repository.GetAllWithDetailsAsync(ct);
            return Ok(contracts.Select(ToOutput));
        }

        [HttpGet("archived")]
        public async Task<ActionResult<IEnumerable<RentalContractOutputModel>>> GetArchived(CancellationToken ct)
        {
            var contracts = await _repository.GetArchivedWithDetailsAsync(ct);
            return Ok(contracts.Select(ToOutput));
        }

        [HttpPatch("{id}/archive")]
        public async Task<IActionResult> Archive(int id, CancellationToken ct)
        {
            var contract = await _repository.GetByIdAsync(id, ct);
            if (contract == null) return NotFound();
            contract.Archive();
            await _repository.SaveChangesAsync(ct);
            return Ok(ToOutput(contract));
        }

        [HttpPatch("{id}/unarchive")]
        public async Task<IActionResult> Unarchive(int id, CancellationToken ct)
        {
            var contract = await _repository.GetArchivedByIdAsync(id, ct);
            if (contract == null) return NotFound();
            contract.Unarchive();
            await _repository.SaveChangesAsync(ct);
            return Ok(ToOutput(contract));
        }

        [HttpPatch("{id}/terminate")]
        public async Task<IActionResult> Terminate(int id, [FromBody] TerminateContractRequest request, CancellationToken ct)
        {
            var contract = await _repository.GetByIdAsync(id, ct);
            if (contract == null) return NotFound();

            contract.Terminate(request.TerminatedBy, request.TerminatedAt);

            if (contract.PropertyId.HasValue)
            {
                var property = await _propertyRepository.GetByIdAsync(contract.PropertyId.Value, ct);
                if (property != null && property.Status != PropertyStatus.Vacant)
                    property.MarkAsVacant();
            }

            await _repository.SaveChangesAsync(ct);
            return Ok(ToOutput(contract));
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
                PropertyId = rc.PropertyId ?? 0,
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
                    .ToList(),
                ArchivedAt = rc.ArchivedAt,
                TerminatedAt = rc.TerminatedAt,
                TerminatedBy = rc.TerminatedBy
            };
    }
}
