namespace GestaoImoveisAPI.Domain.Leasing.Repositories
{
    public interface IRentalContractRepository
    {
        Task<RentalContract?> GetByIdAsync(int id, CancellationToken ct = default);
        Task<RentalContract?> GetByIdWithReadjustmentsAsync(int id, CancellationToken ct = default);
        Task<IReadOnlyList<RentalContract>> GetAllWithDetailsAsync(CancellationToken ct = default);
        Task<bool> HasActiveContractForCpfAsync(string cpf, CancellationToken ct = default);
        Task AddAsync(RentalContract contract, CancellationToken ct = default);
        Task SaveChangesAsync(CancellationToken ct = default);
    }
}
