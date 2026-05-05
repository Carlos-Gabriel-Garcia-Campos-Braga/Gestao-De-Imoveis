using GestaoImoveisAPI.Data;
using GestaoImoveisAPI.Domain.Identity;
using GestaoImoveisAPI.Domain.Identity.Repositories;
using Microsoft.EntityFrameworkCore;

namespace GestaoImoveisAPI.Infrastructure.Persistence.Repositories
{
    public class UserRepository : IUserRepository
    {
        private readonly AppDbContext _context;

        public UserRepository(AppDbContext context)
        {
            _context = context;
        }

        public async Task<User?> GetByIdAsync(int id, CancellationToken ct = default) =>
            await _context.Users.FirstOrDefaultAsync(u => u.Id == id, ct);

        public async Task<User?> GetByEmailAsync(string email, CancellationToken ct = default) =>
            await _context.Users.FirstOrDefaultAsync(
                u => u.Email.Value == email.ToLowerInvariant(), ct);

        public async Task<bool> EmailExistsAsync(string email, CancellationToken ct = default) =>
            await _context.Users.AnyAsync(
                u => u.Email.Value == email.ToLowerInvariant(), ct);

        public async Task<IReadOnlyList<User>> GetAllAsync(CancellationToken ct = default) =>
            await _context.Users.ToListAsync(ct);

        public async Task AddAsync(User user, CancellationToken ct = default) =>
            await _context.Users.AddAsync(user, ct);

        public async Task SaveChangesAsync(CancellationToken ct = default) =>
            await _context.SaveChangesAsync(ct);
    }
}
