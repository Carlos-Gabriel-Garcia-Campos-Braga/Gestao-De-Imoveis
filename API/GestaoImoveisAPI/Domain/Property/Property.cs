using GestaoImoveisAPI.Domain.Shared;
using SharedClasses.ValueObjects;

namespace GestaoImoveisAPI.Domain.Property
{
    public sealed class Property : AggregateRoot
    {
        private readonly List<InspectionReport> _inspectionReports = [];

        public string Description { get; private set; } = string.Empty;
        public PropertyType Type { get; private set; }
        public PropertyStatus Status { get; private set; }
        public Adress Address { get; private set; } = null!;
        public IReadOnlyList<InspectionReport> InspectionReports => _inspectionReports.AsReadOnly();

        private Property() { } // EF Core

        public static Property Create(
            string description,
            PropertyType type,
            Adress address)
        {
            if (string.IsNullOrWhiteSpace(description))
                throw new ArgumentException("Descrição do imóvel não pode ser vazia.");

            return new Property
            {
                Description = description,
                Type = type,
                Status = PropertyStatus.Vacant,
                Address = address
            };
        }

        public void MarkAsOccupied()
        {
            if (Status == PropertyStatus.Occupied)
                throw new InvalidOperationException("Imóvel já está ocupado.");
            Status = PropertyStatus.Occupied;
        }

        public void MarkAsVacant()
        {
            if (Status == PropertyStatus.Vacant)
                throw new InvalidOperationException("Imóvel já está vago.");
            Status = PropertyStatus.Vacant;
        }

        public void SendToMaintenance()
        {
            if (Status == PropertyStatus.Maintenance)
                throw new InvalidOperationException("Imóvel já está em manutenção.");
            Status = PropertyStatus.Maintenance;
        }

        public void UpdateDetails(string description, PropertyType type, Adress newAddress)
        {
            if (string.IsNullOrWhiteSpace(description))
                throw new ArgumentException("Descrição do imóvel não pode ser vazia.");
            Description = description;
            Type = type;
            Address = newAddress;
        }

        public void UpdateAddress(Adress newAddress) =>
            Address = newAddress;

        public InspectionReport AddInspectionReport(
            InspectionType type,
            string inspector,
            string? notes)
        {
            // Impede duas vistorias do mesmo tipo sem uma do tipo oposto entre elas
            var lastOfSameType = _inspectionReports
                .Where(r => r.Type == type)
                .OrderByDescending(r => r.InspectedAt)
                .FirstOrDefault();

            var lastOfOppositeType = _inspectionReports
                .Where(r => r.Type != type)
                .OrderByDescending(r => r.InspectedAt)
                .FirstOrDefault();

            if (lastOfSameType != null &&
                (lastOfOppositeType == null || lastOfSameType.InspectedAt > lastOfOppositeType.InspectedAt))
            {
                throw new InvalidOperationException(
                    $"Já existe uma vistoria de {type} mais recente que a última vistoria do tipo oposto.");
            }

            var report = InspectionReport.Create(Id, type, inspector, notes);
            _inspectionReports.Add(report);
            return report;
        }
    }
}
