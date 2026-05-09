using GestaoImoveisAPI.Domain.Shared;
using SharedClasses.ValueObjects;
using System.Text.Json.Serialization;

namespace GestaoImoveisAPI.Domain.Leasing
{
    public sealed class Renter : Entity
    {
        public string Name { get; private set; } = string.Empty;
        public CPF CPF { get; private set; } = null!;
        public PhoneNumber PhoneNumber { get; private set; } = null!;
        public DateTime? ArchivedAt { get; private set; }
        public bool IsArchived => ArchivedAt.HasValue;

        [JsonIgnore]
        public IReadOnlyList<RentalContract> Contracts => _contracts.AsReadOnly();
        private readonly List<RentalContract> _contracts = [];

        private Renter() { } // EF Core

        public static Renter Create(string name, CPF cpf, PhoneNumber phoneNumber)
        {
            if (string.IsNullOrWhiteSpace(name))
                throw new ArgumentException("Nome do inquilino não pode ser vazio.");

            return new Renter { Name = name, CPF = cpf, PhoneNumber = phoneNumber };
        }

        public void Archive()
        {
            if (IsArchived)
                throw new InvalidOperationException("Inquilino já está arquivado.");
            ArchivedAt = DateTime.UtcNow;
        }

        public void Unarchive()
        {
            if (!IsArchived)
                throw new InvalidOperationException("Inquilino não está arquivado.");
            ArchivedAt = null;
        }
    }
}
