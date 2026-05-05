using GestaoImoveisAPI.Data;
using GestaoImoveisAPI.Domain.Property;
using GestaoImoveisAPI.Domain.Property.Repositories;
using Microsoft.EntityFrameworkCore;

namespace GestaoImoveisAPI.Infrastructure.Persistence.Repositories
{
    public class PropertyRepository : IPropertyRepository
    {
        private readonly AppDbContext _context;

        public PropertyRepository(AppDbContext context)
        {
            _context = context;
        }

        public async Task<Domain.Property.Property?> GetByIdAsync(int id, CancellationToken ct = default) =>
            await _context.Properties.FirstOrDefaultAsync(p => p.Id == id, ct);

        public async Task<Domain.Property.Property?> GetByIdWithInspectionsAsync(int id, CancellationToken ct = default) =>
            await _context.Properties
                .Include(p => p.InspectionReports)
                .FirstOrDefaultAsync(p => p.Id == id, ct);

        public async Task<IReadOnlyList<Domain.Property.Property>> GetAllAsync(CancellationToken ct = default) =>
            await _context.Properties.ToListAsync(ct);

        public async Task<IReadOnlyList<Domain.Property.Property>> GetByStatusAsync(
            PropertyStatus status, CancellationToken ct = default) =>
            await _context.Properties.Where(p => p.Status == status).ToListAsync(ct);

        public async Task AddAsync(Domain.Property.Property property, CancellationToken ct = default) =>
            await _context.Properties.AddAsync(property, ct);

        public async Task SaveChangesAsync(CancellationToken ct = default) =>
            await _context.SaveChangesAsync(ct);
    }
}
