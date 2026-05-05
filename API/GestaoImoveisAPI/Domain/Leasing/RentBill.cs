using GestaoImoveisAPI.Domain.Shared;
using SharedClasses.ValueObjects;

namespace GestaoImoveisAPI.Domain.Leasing
{
    public sealed class RentBill : Entity
    {
        public string Type { get; private set; } = string.Empty;
        public DateTime ValidationDate { get; private set; }
        public Money Value { get; private set; } = null!;
        public int? RentalContractId { get; private set; }

        private RentBill() { } // EF Core

        // internal: apenas RentalContract.AddBill() pode criar bills — invariante do aggregate
        internal static RentBill Create(string type, DateTime validationDate, Money value)
        {
            if (string.IsNullOrWhiteSpace(type))
                throw new ArgumentException("Tipo da conta não pode ser vazio.");

            return new RentBill
            {
                Type = type,
                ValidationDate = validationDate,
                Value = value
            };
        }
    }
}
