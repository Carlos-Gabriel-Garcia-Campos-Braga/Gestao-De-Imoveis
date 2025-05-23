using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace SharedClasses.ValueObjects
{
    public class PhoneNumber
    {
        public string Value { get; private set; }

        public PhoneNumber() { }
        public PhoneNumber(string value)
        {
            if (string.IsNullOrWhiteSpace(value))
            {
                throw new ArgumentException("Número de telefone não pode ser vazio.");
            }
            if (!IsValidPhoneNumber(value))
            {
                throw new ArgumentException("Número de telefone inválido.");
            }


            Value = value;
        }

        private bool IsValidPhoneNumber(string number)
        {
            return Regex.IsMatch(number, @"^\(?\d{2}\)?[\s-]?\d{4,5}-?\d{4}$");
        }

        public override string ToString() => Value;

        public override bool Equals(object obj) =>
            obj is PhoneNumber other && Value == other.Value;

        public override int GetHashCode() => Value.GetHashCode();
    }
}
