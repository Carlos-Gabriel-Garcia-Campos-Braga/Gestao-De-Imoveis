using GestaoImoveisAPI.Domain.Shared;

namespace GestaoImoveisAPI.Domain.Billing
{
    public sealed class Invoice : AggregateRoot
    {
        private PixCharge? _pixCharge;

        public int RentalContractId { get; private set; }
        public string Description { get; private set; } = string.Empty;
        public DateOnly DueDate { get; private set; }
        public decimal Amount { get; private set; }
        public InvoiceStatus Status { get; private set; }

        public PixCharge? PixCharge => _pixCharge;
        public LateFeeCalculation? LateFee { get; private set; }
        public PaymentRecord? Payment { get; private set; }

        private Invoice() { } // EF Core

        public static Invoice Create(
            int rentalContractId,
            string description,
            DateOnly dueDate,
            decimal amount)
        {
            if (string.IsNullOrWhiteSpace(description))
                throw new ArgumentException("Descrição da fatura não pode ser vazia.");

            if (amount <= 0)
                throw new ArgumentException("Valor da fatura deve ser maior que zero.");

            return new Invoice
            {
                RentalContractId = rentalContractId,
                Description = description,
                DueDate = dueDate,
                Amount = Math.Round(amount, 2),
                Status = InvoiceStatus.Pending
            };
        }

        public void MarkAsOverdue()
        {
            if (Status != InvoiceStatus.Pending)
                throw new InvalidOperationException(
                    $"Fatura não pode ser marcada como atrasada — status atual: {Status}.");

            if (DateOnly.FromDateTime(DateTime.UtcNow) <= DueDate)
                throw new InvalidOperationException(
                    "Fatura não pode ser marcada como atrasada antes do vencimento.");

            Status = InvoiceStatus.Overdue;
        }

        public LateFeeCalculation CalculateAndApplyLateFee(DateOnly today)
        {
            if (Status != InvoiceStatus.Overdue)
                throw new InvalidOperationException(
                    "Multa por atraso só pode ser calculada para faturas em atraso.");

            var daysOverdue = today.DayNumber - DueDate.DayNumber;
            LateFee = LateFeeCalculation.Calculate(Amount, daysOverdue);
            return LateFee;
        }

        public PixCharge AttachPixCharge(DateTime expiresAt)
        {
            if (Status == InvoiceStatus.Paid)
                throw new InvalidOperationException("Fatura já paga não aceita novo QR Code PIX.");

            if (Status == InvoiceStatus.Cancelled)
                throw new InvalidOperationException("Fatura cancelada não aceita QR Code PIX.");

            // Expira o charge anterior se existir
            _pixCharge?.MarkAsExpiredIfStale();

            // Gera payload mock — será substituído por Asaas/EFI na integração futura
            var qrCode = GenerateMockPixPayload(Id, Amount, expiresAt);
            _pixCharge = PixCharge.Create(Id, qrCode, expiresAt);
            return _pixCharge;
        }

        public void RegisterPayment(decimal amountPaid, string paymentMethod)
        {
            if (Status == InvoiceStatus.Paid)
                throw new InvalidOperationException("Fatura já está paga.");

            if (Status == InvoiceStatus.Cancelled)
                throw new InvalidOperationException("Fatura cancelada não pode receber pagamento.");

            Payment = PaymentRecord.Create(amountPaid, paymentMethod);
            _pixCharge?.MarkAsPaid();
            Status = InvoiceStatus.Paid;
        }

        public void Cancel()
        {
            if (Status == InvoiceStatus.Paid)
                throw new InvalidOperationException("Fatura já paga não pode ser cancelada.");

            if (Status == InvoiceStatus.Cancelled)
                throw new InvalidOperationException("Fatura já está cancelada.");

            Status = InvoiceStatus.Cancelled;
        }

        // Gera payload PIX mock único por fatura — substituir por gateway real (Asaas/EFI)
        private static string GenerateMockPixPayload(int invoiceId, decimal amount, DateTime expiresAt)
        {
            var uniqueKey = Guid.NewGuid().ToString("N")[..20].ToUpper();
            return $"PIX-INV{invoiceId:D6}-{uniqueKey}-R${amount:F2}-EXP{expiresAt:yyyyMMddHHmm}";
        }
    }
}
