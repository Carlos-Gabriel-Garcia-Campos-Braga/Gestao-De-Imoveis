using GestaoImoveisAPI.Domain.Billing.Repositories;
using SharedClasses.InputDTOs;
using SharedClasses.OutputsDTOs;

namespace GestaoImoveisAPI.Application.Billing.RegisterPayment
{
    public class RegisterPaymentHandler
    {
        private readonly IInvoiceRepository _repository;

        public RegisterPaymentHandler(IInvoiceRepository repository)
        {
            _repository = repository;
        }

        public async Task<InvoiceOutputModel> HandleAsync(
            int invoiceId,
            RegisterPaymentInputModel input,
            CancellationToken ct = default)
        {
            var invoice = await _repository.GetByIdWithDetailsAsync(invoiceId, ct)
                ?? throw new KeyNotFoundException($"Fatura {invoiceId} não encontrada.");

            invoice.RegisterPayment(input.AmountPaid, input.PaymentMethod);
            await _repository.SaveChangesAsync(ct);

            return CreateInvoice.CreateInvoiceHandler.ToOutput(invoice);
        }
    }
}
