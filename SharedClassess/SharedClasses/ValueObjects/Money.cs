using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SharedClasses.ValueObjects
{
    public class Money
    {
        public decimal Amount { get; private set; }

        public Money() { }
        public Money(decimal value)
        {
            if (value < 0)
            { 
                throw new ArgumentException("Valor monetário não pode ser negativo."); 
            }

            Amount = Math.Round(value, 2);
        }

        public Money ApplyReadjustment(decimal indexRate) =>
            new(Amount * (1 + indexRate / 100));

        // Multa por atraso: máximo 2% (Lei 8.245/91)
        public Money CalculateLateFee() => new(Amount * 0.02m);

        // Juros de mora: máximo 1%/mês, pro-rata die
        public Money CalculateDailyInterest(int daysOverdue) =>
            new(Amount * (0.01m / 30m) * daysOverdue);

        public override string ToString() => Amount.ToString("C");

        public override bool Equals(object obj) =>
            obj is Money other && Amount == other.Amount;

        public override int GetHashCode() => Amount.GetHashCode();
    }
}
