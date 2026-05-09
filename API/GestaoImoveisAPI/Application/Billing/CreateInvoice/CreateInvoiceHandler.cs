using GestaoImoveisAPI.Domain.Billing;
using GestaoImoveisAPI.Domain.Billing.Repositories;
using GestaoImoveisAPI.Domain.Leasing.Repositories;
using SharedClasses.InputDTOs;
using SharedClasses.OutputsDTOs;

namespace GestaoImoveisAPI.Application.Billing.CreateInvoice
{
    public class CreateInvoiceHandler
    {
        private readonly IInvoiceRepository _invoiceRepository;
        private readonly IRentalContractRepository _contractRepository;

        public CreateInvoiceHandler(
            IInvoiceRepository invoiceRepository,
            IRentalContractRepository contractRepository)
        {
            _invoiceRepository = invoiceRepository;
            _contractRepository = contractRepository;
        }

        public async Task<InvoiceOutputModel> HandleAsync(
            CreateInvoiceInputModel input,
            CancellationToken ct = default)
        {
            var contract = await _contractRepository.GetByIdAsync(input.RentalContractId, ct)
                ?? throw new KeyNotFoundException($"Contrato {input.RentalContractId} não encontrado.");

            if (input.DueDate < DateOnly.FromDateTime(contract.StartContract) ||
                input.DueDate > DateOnly.FromDateTime(contract.EndContract))
            {
                throw new ArgumentException(
                    $"Vencimento {input.DueDate:dd/MM/yyyy} está fora do período do contrato.");
            }

            var invoice = Invoice.Create(
                input.RentalContractId,
                input.Description,
                input.DueDate,
                input.Amount);

            await _invoiceRepository.AddAsync(invoice, ct);
            await _invoiceRepository.SaveChangesAsync(ct);

            return ToOutput(invoice);
        }

        public static InvoiceOutputModel ToOutput(Invoice invoice) =>
            new()
            {
                Id = invoice.Id,
                RentalContractId = invoice.RentalContractId,
                Description = invoice.Description,
                DueDate = invoice.DueDate.ToString("yyyy-MM-dd"),
                Amount = invoice.Amount,
                Status = invoice.Status.ToString(),
                PixCharge = invoice.PixCharge is null ? null : new PixChargeOutputModel
                {
                    QrCode = invoice.PixCharge.QrCode,
                    ExpiresAt = invoice.PixCharge.ExpiresAt,
                    Status = invoice.PixCharge.Status.ToString()
                },
                LateFee = invoice.LateFee is null ? null : new LateFeeOutputModel
                {
                    DaysOverdue = invoice.LateFee.DaysOverdue,
                    LateFeeAmount = invoice.LateFee.LateFeeAmount,
                    InterestAmount = invoice.LateFee.InterestAmount,
                    TotalAmount = invoice.LateFee.TotalAmount
                },
                Payment = invoice.Payment is null ? null : new PaymentRecordOutputModel
                {
                    PaidAt = invoice.Payment.PaidAt,
                    AmountPaid = invoice.Payment.AmountPaid,
                    PaymentMethod = invoice.Payment.PaymentMethod
                }
            };
    }
}
