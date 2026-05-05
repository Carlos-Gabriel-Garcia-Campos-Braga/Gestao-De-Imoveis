namespace GestaoImoveisAPI.Domain.Billing
{
    // Value Object — imutável, sem identidade própria
    public sealed class PaymentRecord
    {
        public DateTime PaidAt { get; private set; }
        public decimal AmountPaid { get; private set; }
        public string PaymentMethod { get; private set; } = string.Empty;

        private PaymentRecord() { } // EF Core

        internal static PaymentRecord Create(decimal amountPaid, string paymentMethod)
        {
            if (amountPaid <= 0)
                throw new ArgumentException("Valor pago deve ser maior que zero.");

            if (string.IsNullOrWhiteSpace(paymentMethod))
                throw new ArgumentException("Meio de pagamento não pode ser vazio.");

            return new PaymentRecord
            {
                PaidAt = DateTime.UtcNow,
                AmountPaid = Math.Round(amountPaid, 2),
                PaymentMethod = paymentMethod.Trim()
            };
        }
    }
}
