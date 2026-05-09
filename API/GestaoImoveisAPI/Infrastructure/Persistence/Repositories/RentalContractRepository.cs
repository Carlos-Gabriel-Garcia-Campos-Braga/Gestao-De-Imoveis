using GestaoImoveisAPI.Data;
using GestaoImoveisAPI.Domain.Leasing;
using GestaoImoveisAPI.Domain.Leasing.Repositories;
using Microsoft.EntityFrameworkCore;

namespace GestaoImoveisAPI.Infrastructure.Persistence.Repositories
{
    public class RentalContractRepository : IRentalContractRepository
    {
        private readonly AppDbContext _context;

        public RentalContractRepository(AppDbContext context)
        {
            _context = context;
        }

        public async Task<RentalContract?> GetByIdAsync(int id, CancellationToken ct = default) =>
            await _context.Contract
                .Include(c => c.Renter)
                .FirstOrDefaultAsync(c => c.Id == id, ct);

        public async Task<RentalContract?> GetByIdWithReadjustmentsAsync(int id, CancellationToken ct = default) =>
            await _context.Contract
                .Include(c => c.Renter)
                .Include(c => c.ReadjustmentHistory)
                .FirstOrDefaultAsync(c => c.Id == id, ct);

        public async Task<IReadOnlyList<RentalContract>> GetAllWithDetailsAsync(CancellationToken ct = default) =>
            await _context.Contract
                .Where(c => c.ArchivedAt == null)
                .Include(c => c.Renter)
                .Include(c => c.ReadjustmentHistory)
                .ToListAsync(ct);

        public async Task<IReadOnlyList<RentalContract>> GetArchivedWithDetailsAsync(CancellationToken ct = default) =>
            await _context.Contract
                .Where(c => c.ArchivedAt != null)
                .Include(c => c.Renter)
                .Include(c => c.ReadjustmentHistory)
                .ToListAsync(ct);

        public async Task<RentalContract?> GetArchivedByIdAsync(int id, CancellationToken ct = default) =>
            await _context.Contract
                .Include(c => c.Renter)
                .FirstOrDefaultAsync(c => c.Id == id && c.ArchivedAt != null, ct);

        public async Task<bool> HasActiveContractForCpfAsync(string cpf, CancellationToken ct = default) =>
            await _context.Contract
                .Include(c => c.Renter)
                .AnyAsync(c => c.Renter.CPF.Value == cpf
                    && c.TerminatedAt == null
                    && c.ArchivedAt == null, ct);

        public async Task AddAsync(RentalContract contract, CancellationToken ct = default) =>
            await _context.Contract.AddAsync(contract, ct);

        public async Task SaveChangesAsync(CancellationToken ct = default) =>
            await _context.SaveChangesAsync(ct);
    }
}
