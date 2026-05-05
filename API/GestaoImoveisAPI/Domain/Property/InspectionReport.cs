using GestaoImoveisAPI.Domain.Shared;

namespace GestaoImoveisAPI.Domain.Property
{
    public sealed class InspectionReport : Entity
    {
        public int PropertyId { get; private set; }
        public InspectionType Type { get; private set; }
        public string Inspector { get; private set; } = string.Empty;
        public string? Notes { get; private set; }
        public DateTime InspectedAt { get; private set; }

        private InspectionReport() { } // EF Core

        internal static InspectionReport Create(
            int propertyId,
            InspectionType type,
            string inspector,
            string? notes)
        {
            if (string.IsNullOrWhiteSpace(inspector))
                throw new ArgumentException("Nome do vistoriador não pode ser vazio.");

            return new InspectionReport
            {
                PropertyId = propertyId,
                Type = type,
                Inspector = inspector.Trim(),
                Notes = notes?.Trim(),
                InspectedAt = DateTime.UtcNow
            };
        }
    }
}
