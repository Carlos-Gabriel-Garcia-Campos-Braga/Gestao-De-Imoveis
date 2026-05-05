using GestaoImoveisAPI.Application.Billing.AttachPixCharge;
using GestaoImoveisAPI.Application.Billing.CreateInvoice;
using GestaoImoveisAPI.Application.Billing.MarkOverdue;
using GestaoImoveisAPI.Application.Billing.RegisterPayment;
using GestaoImoveisAPI.Domain.Billing.Repositories;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using SharedClasses.InputDTOs;

namespace GestaoImoveisAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    [Authorize]
    public class InvoiceController : ControllerBase
    {
        private readonly IInvoiceRepository _repository;
        private readonly CreateInvoiceHandler _createHandler;
        private readonly RegisterPaymentHandler _paymentHandler;
        private readonly AttachPixChargeHandler _pixHandler;
        private readonly MarkOverdueHandler _overdueHandler;

        public InvoiceController(
            IInvoiceRepository repository,
            CreateInvoiceHandler createHandler,
            RegisterPaymentHandler paymentHandler,
            AttachPixChargeHandler pixHandler,
            MarkOverdueHandler overdueHandler)
        {
            _repository = repository;
            _createHandler = createHandler;
            _paymentHandler = paymentHandler;
            _pixHandler = pixHandler;
            _overdueHandler = overdueHandler;
        }

        [HttpGet]
        public async Task<IActionResult> GetAll(CancellationToken ct)
        {
            var invoices = await _repository.GetAllAsync(ct);
            return Ok(invoices.Select(CreateInvoiceHandler.ToOutput));
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(int id, CancellationToken ct)
        {
            var invoice = await _repository.GetByIdWithDetailsAsync(id, ct);
            if (invoice is null) return NotFound();
            return Ok(CreateInvoiceHandler.ToOutput(invoice));
        }

        [HttpGet("contract/{contractId}")]
        public async Task<IActionResult> GetByContract(int contractId, CancellationToken ct)
        {
            var invoices = await _repository.GetByContractAsync(contractId, ct);
            return Ok(invoices.Select(CreateInvoiceHandler.ToOutput));
        }

        [HttpGet("overdue")]
        public async Task<IActionResult> GetOverdue(CancellationToken ct)
        {
            var invoices = await _repository.GetOverdueAsync(ct);
            return Ok(invoices.Select(CreateInvoiceHandler.ToOutput));
        }

        /// <summary>
        /// Régua de cobrança — retorna faturas pendentes com vencimento nos próximos N dias.
        /// Usar com daysAhead = 5 para D-5, 0 para D0.
        /// </summary>
        [HttpGet("due-soon")]
        public async Task<IActionResult> GetDueSoon([FromQuery] int daysAhead = 5, CancellationToken ct = default)
        {
            if (daysAhead < 0 || daysAhead > 30)
                return BadRequest(new { Errors = new[] { "daysAhead deve estar entre 0 e 30." } });

            var invoices = await _repository.GetDueSoonAsync(daysAhead, ct);
            return Ok(invoices.Select(CreateInvoiceHandler.ToOutput));
        }

        [HttpPost]
        public async Task<IActionResult> Create([FromBody] CreateInvoiceInputModel input, CancellationToken ct)
        {
            var output = await _createHandler.HandleAsync(input, ct);
            return CreatedAtAction(nameof(GetById), new { id = output.Id }, output);
        }

        [HttpPatch("{id}/payment")]
        public async Task<IActionResult> RegisterPayment(
            int id,
            [FromBody] RegisterPaymentInputModel input,
            CancellationToken ct)
        {
            var output = await _paymentHandler.HandleAsync(id, input, ct);
            return Ok(output);
        }

        [HttpPost("{id}/pix")]
        public async Task<IActionResult> AttachPix(int id, CancellationToken ct)
        {
            var output = await _pixHandler.HandleAsync(id, ct);
            return Ok(output);
        }

        [HttpPatch("{id}/overdue")]
        public async Task<IActionResult> MarkAsOverdue(int id, CancellationToken ct)
        {
            var output = await _overdueHandler.HandleAsync(id, ct);
            return Ok(output);
        }
    }
}
