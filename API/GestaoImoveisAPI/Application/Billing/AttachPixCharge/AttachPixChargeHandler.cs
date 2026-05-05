using GestaoImoveisAPI.Domain.Billing.Repositories;
using SharedClasses.OutputsDTOs;

namespace GestaoImoveisAPI.Application.Billing.AttachPixCharge
{
    public class AttachPixChargeHandler
    {
        private readonly IInvoiceRepository _repository;

        public AttachPixChargeHandler(IInvoiceRepository repository)
        {
            _repository = repository;
        }

        public async Task<InvoiceOutputModel> HandleAsync(
            int invoiceId,
            CancellationToken ct = default)
        {
            var invoice = await _repository.GetByIdWithDetailsAsync(invoiceId, ct)
                ?? throw new KeyNotFoundException($"Fatura {invoiceId} não encontrada.");

            // Expira em 24 horas — padrão PIX (QR Code único por cobrança)
            var expiresAt = DateTime.UtcNow.AddHours(24);
            invoice.AttachPixCharge(expiresAt);
            await _repository.SaveChangesAsync(ct);

            return CreateInvoice.CreateInvoiceHandler.ToOutput(invoice);
        }
    }
}
