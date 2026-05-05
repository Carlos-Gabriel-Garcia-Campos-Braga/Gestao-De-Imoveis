namespace GestaoImoveisAPI.Domain.Billing.Repositories
{
    public interface IInvoiceRepository
    {
        Task<Invoice?> GetByIdAsync(int id, CancellationToken ct = default);
        Task<Invoice?> GetByIdWithDetailsAsync(int id, CancellationToken ct = default);
        Task<IReadOnlyList<Invoice>> GetAllAsync(CancellationToken ct = default);
        Task<IReadOnlyList<Invoice>> GetByContractAsync(int contractId, CancellationToken ct = default);
        Task<IReadOnlyList<Invoice>> GetOverdueAsync(CancellationToken ct = default);
        Task<IReadOnlyList<Invoice>> GetDueSoonAsync(int daysAhead, CancellationToken ct = default);
        Task AddAsync(Invoice invoice, CancellationToken ct = default);
        Task SaveChangesAsync(CancellationToken ct = default);
    }
}
