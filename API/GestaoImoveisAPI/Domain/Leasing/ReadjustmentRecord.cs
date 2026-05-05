using GestaoImoveisAPI.Domain.Shared;

namespace GestaoImoveisAPI.Domain.Leasing
{
    public sealed class ReadjustmentRecord : Entity
    {
        public int ContractId { get; private set; }
        public EconomicIndex Index { get; private set; }
        public decimal Rate { get; private set; }
        public decimal OldValue { get; private set; }
        public decimal NewValue { get; private set; }
        public DateTime AppliedAt { get; private set; }

        private ReadjustmentRecord() { } // EF Core

        internal static ReadjustmentRecord Create(
            int contractId,
            EconomicIndex index,
            decimal rate,
            decimal oldValue,
            decimal newValue)
        {
            return new ReadjustmentRecord
            {
                ContractId = contractId,
                Index = index,
                Rate = rate,
                OldValue = oldValue,
                NewValue = newValue,
                AppliedAt = DateTime.UtcNow
            };
        }
    }
}
