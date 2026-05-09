using GestaoImoveisAPI.Application.Reports;
using GestaoImoveisAPI.Domain.Leasing.Repositories;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using QuestPDF.Fluent;

namespace GestaoImoveisAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    [Authorize]
    public class ReportController : ControllerBase
    {
        private readonly AnnualReportHandler _handler;
        private readonly IRentalContractRepository _contractRepository;

        public ReportController(
            AnnualReportHandler handler,
            IRentalContractRepository contractRepository)
        {
            _handler = handler;
            _contractRepository = contractRepository;
        }

        [HttpGet("annual/{year:int}/pdf")]
        public async Task<IActionResult> GetAnnualPdf(int year, CancellationToken ct)
        {
            if (year < 2000 || year > DateTime.UtcNow.Year + 1)
                return BadRequest("Ano inválido.");

            var data = await _handler.GetAnnualDataAsync(year, ct);
            var bytes = new PdfReportDocument(data).GeneratePdf();
            return File(bytes, "application/pdf", $"relatorio-receitas-{year}.pdf");
        }

        [HttpGet("contract/{id:int}/pdf")]
        public async Task<IActionResult> GetContractPdf(int id, CancellationToken ct)
        {
            var contract = await _contractRepository.GetByIdWithReadjustmentsAsync(id, ct);
            if (contract is null) return NotFound();

            var bytes = new ContractPdfDocument(contract).GeneratePdf();
            return File(bytes, "application/pdf", $"contrato-{id:D6}.pdf");
        }

        [HttpGet("annual/{year:int}/xlsx")]
        public async Task<IActionResult> GetAnnualXlsx(int year, CancellationToken ct)
        {
            if (year < 2000 || year > DateTime.UtcNow.Year + 1)
                return BadRequest("Ano inválido.");

            var data = await _handler.GetAnnualDataAsync(year, ct);
            var bytes = ExcelReportBuilder.Build(data);
            return File(
                bytes,
                "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
                $"relatorio-receitas-{year}.xlsx");
        }
    }
}
