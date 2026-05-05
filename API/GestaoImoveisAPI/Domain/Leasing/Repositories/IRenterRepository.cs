namespace GestaoImoveisAPI.Domain.Leasing.Repositories
{
    public interface IRenterRepository
    {
        Task<Renter?> GetByIdAsync(int id, CancellationToken ct = default);
        Task<IReadOnlyList<Renter>> GetAllAsync(CancellationToken ct = default);
        Task<Renter?> GetByCpfAsync(string cpf, CancellationToken ct = default);
        Task AddAsync(Renter renter, CancellationToken ct = default);
        Task SaveChangesAsync(CancellationToken ct = default);
    }
}
