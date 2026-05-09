using GestaoImoveisAPI.Domain.Billing;
using GestaoImoveisAPI.Domain.Billing.Repositories;
using GestaoImoveisAPI.Domain.Leasing.Repositories;

namespace GestaoImoveisAPI.Application.Reports
{
    public class AnnualReportHandler
    {
        private readonly IInvoiceRepository _invoiceRepository;
        private readonly IRentalContractRepository _contractRepository;

        public AnnualReportHandler(
            IInvoiceRepository invoiceRepository,
            IRentalContractRepository contractRepository)
        {
            _invoiceRepository = invoiceRepository;
            _contractRepository = contractRepository;
        }

        public async Task<AnnualReportData> GetAnnualDataAsync(int year, CancellationToken ct = default)
        {
            var invoices = await _invoiceRepository.GetByYearAsync(year, ct);
            var contracts = await _contractRepository.GetAllWithDetailsAsync(ct);
            var contractMap = contracts.ToDictionary(c => c.Id);

            var rows = invoices.Select(inv =>
            {
                contractMap.TryGetValue(inv.RentalContractId, out var contract);

                var address = contract is not null
                    ? $"{contract.Adress.Street}, {contract.Adress.Number} — {contract.Adress.City}/{contract.Adress.State}"
                    : "Endereço não encontrado";

                return new AnnualReportRow
                {
                    ContractAddress = address,
                    RenterName = contract?.Renter?.Name ?? "—",
                    RenterCPF = contract?.Renter?.CPF?.Value ?? "—",
                    Description = inv.Description,
                    DueDate = inv.DueDate,
                    AmountDue = inv.Amount,
                    AmountPaid = inv.Payment?.AmountPaid ?? 0m,
                    Status = StatusLabel(inv.Status)
                };
            })
            .OrderBy(r => r.DueDate)
            .ToList();

            return new AnnualReportData(year, rows);
        }

        private static string StatusLabel(InvoiceStatus status) => status switch
        {
            InvoiceStatus.Paid => "Pago",
            InvoiceStatus.Pending => "Pendente",
            InvoiceStatus.Overdue => "Atrasado",
            InvoiceStatus.Cancelled => "Cancelado",
            _ => status.ToString()
        };
    }
}
