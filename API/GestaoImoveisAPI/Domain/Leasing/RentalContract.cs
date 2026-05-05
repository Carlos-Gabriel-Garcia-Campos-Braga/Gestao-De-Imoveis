using GestaoImoveisAPI.Domain.Shared;
using SharedClasses.ValueObjects;

namespace GestaoImoveisAPI.Domain.Leasing
{
    public sealed class RentalContract : AggregateRoot
    {
        private readonly List<RentBill> _bills = [];
        private readonly List<ReadjustmentRecord> _readjustments = [];

        public int RenterId { get; private set; }

        // Navigation property para EF Core — lógica de domínio usa RenterId
        public Renter Renter { get; private set; } = null!;

        public Adress Adress { get; private set; } = null!;
        public DateTime StartContract { get; private set; }
        public DateTime EndContract { get; private set; }
        public Money RentalValue { get; private set; } = null!;
        public EconomicIndex PreferredIndex { get; private set; }
        public IReadOnlyList<RentBill> Bills => _bills.AsReadOnly();
        public IReadOnlyList<ReadjustmentRecord> ReadjustmentHistory => _readjustments.AsReadOnly();

        private RentalContract() { } // EF Core

        public static RentalContract Create(
            int renterId,
            Adress address,
            DateTime startContract,
            DateTime endContract,
            Money rentalValue,
            EconomicIndex preferredIndex = EconomicIndex.IPCA)
        {
            if (startContract >= endContract)
                throw new ArgumentException("Data de início deve ser anterior à data de fim do contrato.");

            return new RentalContract
            {
                RenterId = renterId,
                Adress = address,
                StartContract = startContract,
                EndContract = endContract,
                RentalValue = rentalValue,
                PreferredIndex = preferredIndex
            };
        }

        public RentBill AddBill(string type, DateTime validationDate, Money value)
        {
            if (validationDate < StartContract || validationDate > EndContract)
                throw new ArgumentException(
                    $"Data de vencimento {validationDate:dd/MM/yyyy} está fora do período do contrato.");

            var bill = RentBill.Create(type, validationDate, value);
            _bills.Add(bill);
            return bill;
        }

        public ReadjustmentRecord ApplyAnnualReadjustment(EconomicIndex index, decimal rate)
        {
            if (rate < 0)
                throw new ArgumentException("Taxa de reajuste não pode ser negativa.");

            if (rate > 50)
                throw new ArgumentException("Taxa de reajuste superior a 50% requer confirmação explícita.");

            var lastReadjustment = _readjustments
                .OrderByDescending(r => r.AppliedAt)
                .FirstOrDefault();

            if (lastReadjustment != null &&
                (DateTime.UtcNow - lastReadjustment.AppliedAt).TotalDays < 330)
            {
                throw new InvalidOperationException(
                    "Reajuste só pode ser aplicado após 11 meses do último reajuste (Lei 8.245/91).");
            }

            var oldValue = RentalValue.Amount;
            RentalValue = RentalValue.ApplyReadjustment(rate);

            var record = ReadjustmentRecord.Create(Id, index, rate, oldValue, RentalValue.Amount);
            _readjustments.Add(record);
            return record;
        }
    }
}
