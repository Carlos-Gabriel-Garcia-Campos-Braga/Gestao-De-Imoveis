using GestaoImoveisAPI.Application.Property.AddInspectionReport;
using GestaoImoveisAPI.Application.Property.CreateProperty;
using GestaoImoveisAPI.Application.Property.UpdateProperty;
using GestaoImoveisAPI.Application.Property.UpdateStatus;
using GestaoImoveisAPI.Domain.Property;
using GestaoImoveisAPI.Domain.Property.Repositories;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using SharedClasses.InputDTOs;
using SharedClasses.OutputsDTOs;

namespace GestaoImoveisAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    [Authorize]
    public class PropertyController : ControllerBase
    {
        private readonly IPropertyRepository _repository;
        private readonly CreatePropertyHandler _createHandler;
        private readonly UpdatePropertyHandler _updateHandler;
        private readonly UpdatePropertyStatusHandler _updateStatusHandler;
        private readonly AddInspectionReportHandler _inspectionHandler;

        public PropertyController(
            IPropertyRepository repository,
            CreatePropertyHandler createHandler,
            UpdatePropertyHandler updateHandler,
            UpdatePropertyStatusHandler updateStatusHandler,
            AddInspectionReportHandler inspectionHandler)
        {
            _repository = repository;
            _createHandler = createHandler;
            _updateHandler = updateHandler;
            _updateStatusHandler = updateStatusHandler;
            _inspectionHandler = inspectionHandler;
        }

        [HttpGet]
        public async Task<IActionResult> GetAll(CancellationToken ct)
        {
            var properties = await _repository.GetAllAsync(ct);
            return Ok(properties.Select(CreatePropertyHandler.ToOutput));
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(int id, CancellationToken ct)
        {
            var property = await _repository.GetByIdAsync(id, ct);
            if (property == null) return NotFound();
            return Ok(CreatePropertyHandler.ToOutput(property));
        }

        [HttpGet("status/{status}")]
        public async Task<IActionResult> GetByStatus(string status, CancellationToken ct)
        {
            if (!Enum.TryParse<PropertyStatus>(status, ignoreCase: true, out var propertyStatus))
                return BadRequest(new { Errors = new[] { $"Status inválido: '{status}'." } });

            var properties = await _repository.GetByStatusAsync(propertyStatus, ct);
            return Ok(properties.Select(CreatePropertyHandler.ToOutput));
        }

        [HttpPost]
        public async Task<IActionResult> Create(
            [FromBody] CreatePropertyFromCepInputModel input,
            CancellationToken ct)
        {
            var output = await _createHandler.HandleAsync(input, ct);
            return CreatedAtAction(nameof(GetById), new { id = output.Id }, output);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Update(
            int id,
            [FromBody] CreatePropertyFromCepInputModel input,
            CancellationToken ct)
        {
            var output = await _updateHandler.HandleAsync(id, input, ct);
            return Ok(output);
        }

        [HttpPatch("{id}/status")]
        public async Task<IActionResult> UpdateStatus(
            int id,
            [FromBody] UpdatePropertyStatusInputModel input,
            CancellationToken ct)
        {
            var output = await _updateStatusHandler.HandleAsync(id, input.Status, ct);
            return Ok(output);
        }

        [HttpPost("{id}/inspections")]
        public async Task<IActionResult> AddInspection(
            int id,
            [FromBody] InspectionReportInputModel input,
            CancellationToken ct)
        {
            var output = await _inspectionHandler.HandleAsync(id, input, ct);
            return CreatedAtAction(nameof(GetInspections), new { id }, output);
        }

        [HttpGet("{id}/inspections")]
        public async Task<IActionResult> GetInspections(int id, CancellationToken ct)
        {
            var property = await _repository.GetByIdWithInspectionsAsync(id, ct);
            if (property == null) return NotFound();
            return Ok(property.InspectionReports.Select(AddInspectionReportHandler.ToOutput));
        }
    }
}
