using GestaoImoveisAPI.Data;
using GestaoImoveisAPI.Domain.Leasing;
using GestaoImoveisAPI.Domain.Leasing.Repositories;
using Microsoft.EntityFrameworkCore;

namespace GestaoImoveisAPI.Infrastructure.Persistence.Repositories
{
    public class RenterRepository : IRenterRepository
    {
        private readonly AppDbContext _context;

        public RenterRepository(AppDbContext context)
        {
            _context = context;
        }

        public async Task<Renter?> GetByIdAsync(int id, CancellationToken ct = default) =>
            await _context.Renters.FirstOrDefaultAsync(r => r.Id == id, ct);

        public async Task<IReadOnlyList<Renter>> GetAllAsync(CancellationToken ct = default) =>
            await _context.Renters.Where(r => r.ArchivedAt == null).ToListAsync(ct);

        public async Task<Renter?> GetByCpfAsync(string cpf, CancellationToken ct = default) =>
            await _context.Renters.FirstOrDefaultAsync(r => r.CPF.Value == cpf, ct);

        public async Task<IReadOnlyList<Renter>> GetArchivedAsync(CancellationToken ct = default) =>
            await _context.Renters.Where(r => r.ArchivedAt != null).ToListAsync(ct);

        public async Task<Renter?> GetArchivedByIdAsync(int id, CancellationToken ct = default) =>
            await _context.Renters.FirstOrDefaultAsync(r => r.Id == id && r.ArchivedAt != null, ct);

        public async Task AddAsync(Renter renter, CancellationToken ct = default) =>
            await _context.Renters.AddAsync(renter, ct);

        public async Task SaveChangesAsync(CancellationToken ct = default) =>
            await _context.SaveChangesAsync(ct);
    }
}
