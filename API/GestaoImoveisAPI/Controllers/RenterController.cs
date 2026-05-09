using GestaoImoveisAPI.Domain.Leasing;
using GestaoImoveisAPI.Domain.Leasing.Repositories;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using SharedClasses.InputDTOs;
using SharedClasses.OutputsDTOs;
using SharedClasses.ValueObjects;

namespace GestaoImoveisAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    [Authorize]
    public class RenterController : ControllerBase
    {
        private readonly IRenterRepository _repository;

        public RenterController(IRenterRepository repository)
        {
            _repository = repository;
        }

        [HttpGet]
        public async Task<IActionResult> GetAll(CancellationToken ct)
        {
            var list = await _repository.GetAllAsync(ct);
            return Ok(list.Select(ToOutput));
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(int id, CancellationToken ct)
        {
            var renter = await _repository.GetByIdAsync(id, ct);
            if (renter == null) return NotFound();
            return Ok(ToOutput(renter));
        }

        [HttpGet("archived")]
        public async Task<IActionResult> GetArchived(CancellationToken ct)
        {
            var list = await _repository.GetArchivedAsync(ct);
            return Ok(list.Select(ToOutput));
        }

        [HttpPatch("{id}/archive")]
        public async Task<IActionResult> Archive(int id, CancellationToken ct)
        {
            var renter = await _repository.GetByIdAsync(id, ct);
            if (renter == null) return NotFound();
            renter.Archive();
            await _repository.SaveChangesAsync(ct);
            return Ok(ToOutput(renter));
        }

        [HttpPatch("{id}/unarchive")]
        public async Task<IActionResult> Unarchive(int id, CancellationToken ct)
        {
            var renter = await _repository.GetArchivedByIdAsync(id, ct);
            if (renter == null) return NotFound();
            renter.Unarchive();
            await _repository.SaveChangesAsync(ct);
            return Ok(ToOutput(renter));
        }

        [HttpGet("verifycpf/{cpf}")]
        public async Task<IActionResult> VerifyCPFExists(string cpf, CancellationToken ct)
        {
            var exists = await _repository.GetByCpfAsync(cpf, ct) != null;
            return Ok(exists);
        }

        [HttpPost]
        public async Task<IActionResult> Create([FromBody] RenterInputModel input, CancellationToken ct)
        {
            var cpf = new CPF(input.CPF);
            var phoneNumber = new PhoneNumber(input.PhoneNumber);

            if (await _repository.GetByCpfAsync(cpf.Value, ct) != null)
                throw new InvalidOperationException("CPF já cadastrado.");

            var renter = Renter.Create(input.Name, cpf, phoneNumber);
            await _repository.AddAsync(renter, ct);
            await _repository.SaveChangesAsync(ct);

            return CreatedAtAction(nameof(GetById), new { id = renter.Id }, ToOutput(renter));
        }

        private static RenterOutputModel ToOutput(Renter r) =>
            new() { Id = r.Id, Name = r.Name ?? string.Empty, CPF = r.CPF?.Value ?? string.Empty, PhoneNumber = r.PhoneNumber?.Value ?? string.Empty, ArchivedAt = r.ArchivedAt };
    }
}
