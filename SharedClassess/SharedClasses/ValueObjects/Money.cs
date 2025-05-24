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

        public override string ToString() => Amount.ToString("C");

        public override bool Equals(object obj) =>
            obj is Money other && Amount == other.Amount;

        public override int GetHashCode() => Amount.GetHashCode();
    }
}
