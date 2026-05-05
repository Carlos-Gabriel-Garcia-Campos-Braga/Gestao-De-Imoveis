using GestaoImoveisAPI.Domain.Shared;

namespace GestaoImoveisAPI.Domain.Billing
{
    public sealed class PixCharge : Entity
    {
        public int InvoiceId { get; private set; }
        public string QrCode { get; private set; } = string.Empty;
        public DateTime ExpiresAt { get; private set; }
        public PixStatus Status { get; private set; }

        private PixCharge() { } // EF Core

        internal static PixCharge Create(int invoiceId, string qrCode, DateTime expiresAt)
        {
            if (string.IsNullOrWhiteSpace(qrCode))
                throw new ArgumentException("QR Code PIX não pode ser vazio.");

            if (expiresAt <= DateTime.UtcNow)
                throw new ArgumentException("Data de expiração deve ser futura.");

            return new PixCharge
            {
                InvoiceId = invoiceId,
                QrCode = qrCode,
                ExpiresAt = expiresAt,
                Status = PixStatus.Active
            };
        }

        internal void MarkAsPaid() => Status = PixStatus.Paid;

        internal void MarkAsExpiredIfStale()
        {
            if (Status == PixStatus.Active && DateTime.UtcNow > ExpiresAt)
                Status = PixStatus.Expired;
        }
    }
}
