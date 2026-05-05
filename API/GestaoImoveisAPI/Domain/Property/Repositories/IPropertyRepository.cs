namespace GestaoImoveisAPI.Domain.Property.Repositories
{
    public interface IPropertyRepository
    {
        Task<Property?> GetByIdAsync(int id, CancellationToken ct = default);
        Task<Property?> GetByIdWithInspectionsAsync(int id, CancellationToken ct = default);
        Task<IReadOnlyList<Property>> GetAllAsync(CancellationToken ct = default);
        Task<IReadOnlyList<Property>> GetByStatusAsync(PropertyStatus status, CancellationToken ct = default);
        Task AddAsync(Property property, CancellationToken ct = default);
        Task SaveChangesAsync(CancellationToken ct = default);
    }
}
