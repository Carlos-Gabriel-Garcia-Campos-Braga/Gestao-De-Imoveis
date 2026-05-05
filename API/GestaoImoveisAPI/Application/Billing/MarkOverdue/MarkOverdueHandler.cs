using GestaoImoveisAPI.Domain.Billing.Repositories;
using SharedClasses.OutputsDTOs;

namespace GestaoImoveisAPI.Application.Billing.MarkOverdue
{
    public class MarkOverdueHandler
    {
        private readonly IInvoiceRepository _repository;

        public MarkOverdueHandler(IInvoiceRepository repository)
        {
            _repository = repository;
        }

        public async Task<InvoiceOutputModel> HandleAsync(int invoiceId, CancellationToken ct = default)
        {
            var invoice = await _repository.GetByIdWithDetailsAsync(invoiceId, ct)
                ?? throw new KeyNotFoundException($"Fatura {invoiceId} não encontrada.");

            var today = DateOnly.FromDateTime(DateTime.UtcNow);
            invoice.MarkAsOverdue();
            invoice.CalculateAndApplyLateFee(today);
            await _repository.SaveChangesAsync(ct);

            return CreateInvoice.CreateInvoiceHandler.ToOutput(invoice);
        }
    }
}
