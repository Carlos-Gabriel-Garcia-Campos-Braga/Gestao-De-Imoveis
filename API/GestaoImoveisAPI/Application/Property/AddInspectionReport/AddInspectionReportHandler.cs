using GestaoImoveisAPI.Domain.Property;
using GestaoImoveisAPI.Domain.Property.Repositories;
using SharedClasses.InputDTOs;
using SharedClasses.OutputsDTOs;

namespace GestaoImoveisAPI.Application.Property.AddInspectionReport
{
    public class AddInspectionReportHandler
    {
        private readonly IPropertyRepository _repository;

        public AddInspectionReportHandler(IPropertyRepository repository)
        {
            _repository = repository;
        }

        public async Task<InspectionReportOutputModel> HandleAsync(
            int propertyId,
            InspectionReportInputModel input,
            CancellationToken ct = default)
        {
            if (!Enum.TryParse<InspectionType>(input.Type, ignoreCase: true, out var type))
                throw new ArgumentException(
                    $"Tipo de vistoria inválido: '{input.Type}'. Valores aceitos: {string.Join(", ", Enum.GetNames<InspectionType>())}");

            var property = await _repository.GetByIdWithInspectionsAsync(propertyId, ct)
                ?? throw new KeyNotFoundException($"Imóvel {propertyId} não encontrado.");

            var report = property.AddInspectionReport(type, input.Inspector, input.Notes);

            await _repository.SaveChangesAsync(ct);

            return ToOutput(report);
        }

        public static InspectionReportOutputModel ToOutput(Domain.Property.InspectionReport r) =>
            new()
            {
                Id = r.Id,
                PropertyId = r.PropertyId,
                Type = r.Type.ToString(),
                Inspector = r.Inspector,
                Notes = r.Notes,
                InspectedAt = r.InspectedAt
            };
    }
}
