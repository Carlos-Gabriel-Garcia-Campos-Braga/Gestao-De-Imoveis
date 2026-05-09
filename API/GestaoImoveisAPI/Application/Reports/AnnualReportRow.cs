namespace GestaoImoveisAPI.Application.Reports
{
    public sealed class AnnualReportRow
    {
        public string ContractAddress { get; init; } = string.Empty;
        public string RenterName { get; init; } = string.Empty;
        public string RenterCPF { get; init; } = string.Empty;
        public string Description { get; init; } = string.Empty;
        public DateOnly DueDate { get; init; }
        public decimal AmountDue { get; init; }
        public decimal AmountPaid { get; init; }
        public string Status { get; init; } = string.Empty;
    }

    public sealed record AnnualReportData(int Year, IReadOnlyList<AnnualReportRow> Rows)
    {
        public decimal TotalDue => Rows.Sum(r => r.AmountDue);
        public decimal TotalPaid => Rows.Sum(r => r.AmountPaid);
        public decimal TotalPending => Rows
            .Where(r => r.Status is "Pendente" or "Atrasado")
            .Sum(r => r.AmountDue);
    }
}
