using GestaoImoveisAPI.Application.Property.CreateProperty;
using GestaoImoveisAPI.Domain.Property;
using GestaoImoveisAPI.Domain.Property.Repositories;
using SharedClasses.OutputsDTOs;

namespace GestaoImoveisAPI.Application.Property.UpdateStatus
{
    public class UpdatePropertyStatusHandler
    {
        private readonly IPropertyRepository _repository;

        public UpdatePropertyStatusHandler(IPropertyRepository repository)
        {
            _repository = repository;
        }

        public async Task<PropertyOutputModel> HandleAsync(
            int propertyId,
            string newStatus,
            CancellationToken ct = default)
        {
            var property = await _repository.GetByIdAsync(propertyId, ct)
                ?? throw new KeyNotFoundException("Imóvel não encontrado.");

            if (!Enum.TryParse<PropertyStatus>(newStatus, ignoreCase: true, out var status))
                throw new ArgumentException(
                    $"Status inválido: '{newStatus}'. Valores aceitos: {string.Join(", ", Enum.GetNames<PropertyStatus>())}");

            switch (status)
            {
                case PropertyStatus.Occupied:
                    property.MarkAsOccupied();
                    break;
                case PropertyStatus.Vacant:
                    property.MarkAsVacant();
                    break;
                case PropertyStatus.Maintenance:
                    property.SendToMaintenance();
                    break;
            }

            await _repository.SaveChangesAsync(ct);

            return CreatePropertyHandler.ToOutput(property);
        }
    }
}
