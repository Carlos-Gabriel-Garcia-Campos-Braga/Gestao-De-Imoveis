namespace GestaoImoveisAPI.Domain.Billing
{
    // Value Object — imutável, sem identidade própria
    public sealed class LateFeeCalculation
    {
        public int DaysOverdue { get; private set; }

        // Multa fixa: 2% (máximo legal — Lei 8.245/91)
        public decimal LateFeeAmount { get; private set; }

        // Juros de mora: 1%/mês pro-rata die
        public decimal InterestAmount { get; private set; }

        // Original + multa + juros
        public decimal TotalAmount { get; private set; }

        private LateFeeCalculation() { } // EF Core

        internal static LateFeeCalculation Calculate(decimal principalAmount, int daysOverdue)
        {
            if (daysOverdue <= 0)
                throw new ArgumentException("Dias em atraso deve ser positivo.");

            var lateFee = Math.Round(principalAmount * 0.02m, 2);
            var interest = Math.Round(principalAmount * (0.01m / 30m) * daysOverdue, 2);
            var total = Math.Round(principalAmount + lateFee + interest, 2);

            return new LateFeeCalculation
            {
                DaysOverdue = daysOverdue,
                LateFeeAmount = lateFee,
                InterestAmount = interest,
                TotalAmount = total
            };
        }
    }
}
