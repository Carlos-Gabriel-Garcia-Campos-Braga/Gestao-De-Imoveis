using GestaoImoveisAPI.Data;
using GestaoImoveisAPI.Domain.Billing;
using GestaoImoveisAPI.Domain.Billing.Repositories;
using Microsoft.EntityFrameworkCore;

namespace GestaoImoveisAPI.Infrastructure.Persistence.Repositories
{
    public class InvoiceRepository : IInvoiceRepository
    {
        private readonly AppDbContext _context;

        public InvoiceRepository(AppDbContext context)
        {
            _context = context;
        }

        public async Task<Invoice?> GetByIdAsync(int id, CancellationToken ct = default) =>
            await _context.Invoices.FirstOrDefaultAsync(i => i.Id == id, ct);

        public async Task<Invoice?> GetByIdWithDetailsAsync(int id, CancellationToken ct = default) =>
            await _context.Invoices
                .Include(i => i.PixCharge)
                .FirstOrDefaultAsync(i => i.Id == id, ct);

        public async Task<IReadOnlyList<Invoice>> GetAllAsync(CancellationToken ct = default) =>
            await _context.Invoices
                .Include(i => i.PixCharge)
                .OrderByDescending(i => i.DueDate)
                .ToListAsync(ct);

        public async Task<IReadOnlyList<Invoice>> GetByContractAsync(int contractId, CancellationToken ct = default) =>
            await _context.Invoices
                .Include(i => i.PixCharge)
                .Where(i => i.RentalContractId == contractId)
                .OrderByDescending(i => i.DueDate)
                .ToListAsync(ct);

        public async Task<IReadOnlyList<Invoice>> GetOverdueAsync(CancellationToken ct = default) =>
            await _context.Invoices
                .Include(i => i.PixCharge)
                .Where(i => i.Status == InvoiceStatus.Overdue)
                .OrderBy(i => i.DueDate)
                .ToListAsync(ct);

        public async Task<IReadOnlyList<Invoice>> GetDueSoonAsync(int daysAhead, CancellationToken ct = default)
        {
            var today = DateOnly.FromDateTime(DateTime.UtcNow);
            var limit = today.AddDays(daysAhead);

            return await _context.Invoices
                .Where(i => i.Status == InvoiceStatus.Pending &&
                            i.DueDate >= today &&
                            i.DueDate <= limit)
                .OrderBy(i => i.DueDate)
                .ToListAsync(ct);
        }

        public async Task AddAsync(Invoice invoice, CancellationToken ct = default) =>
            await _context.Invoices.AddAsync(invoice, ct);

        public async Task SaveChangesAsync(CancellationToken ct = default) =>
            await _context.SaveChangesAsync(ct);
    }
}
