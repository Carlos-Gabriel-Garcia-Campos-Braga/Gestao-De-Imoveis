using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SharedClasses.ValueObjects
{
    public class Money
    {
        public decimal Value { get; }

        public Money(decimal value)
        {
            if (value < 0)
                throw new ArgumentException("Valor monetário não pode ser negativo.");

            Value = Math.Round(value, 2);
        }

        public override string ToString() => Value.ToString("C");

        public override bool Equals(object obj) =>
            obj is Money other && Value == other.Value;

        public override int GetHashCode() => Value.GetHashCode();
    }
}
