using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace SharedClasses.ValueObjects
{
    public class CPF
    {
        public string Value { get; }

        public CPF(string value)
        {
            if (string.IsNullOrWhiteSpace(value))
                throw new ArgumentException("CPF não pode ser vazio.");

            // Remove pontos e traço
            value = Regex.Replace(value, "[^0-9]", "");

            if (value.Length != 11)
                throw new ArgumentException("CPF deve conter 11 dígitos.");

            if (!IsValidCPF(value))
                throw new ArgumentException("CPF inválido.");

            Value = value;
        }

        public override string ToString() =>
            Convert.ToUInt64(Value).ToString(@"000\.000\.000\-00");

        // Validação oficial de CPF (com dígitos verificadores)
        private bool IsValidCPF(string cpf)
        {
            // Sequências repetidas são inválidas
            string[] invalidCpfs = {
                "00000000000", "11111111111", "22222222222", "33333333333",
                "44444444444", "55555555555", "66666666666", "77777777777",
                "88888888888", "99999999999"
            };
            if (invalidCpfs.Contains(cpf)) return false;

            int[] mult1 = { 10, 9, 8, 7, 6, 5, 4, 3, 2 };
            int[] mult2 = { 11, 10, 9, 8, 7, 6, 5, 4, 3, 2 };

            var tempCpf = cpf.Substring(0, 9);
            var sum = 0;

            for (int i = 0; i < 9; i++)
                sum += int.Parse(tempCpf[i].ToString()) * mult1[i];

            var remainder = sum % 11;
            var digit = remainder < 2 ? 0 : 11 - remainder;
            tempCpf += digit;
            sum = 0;

            for (int i = 0; i < 10; i++)
                sum += int.Parse(tempCpf[i].ToString()) * mult2[i];

            remainder = sum % 11;
            digit = remainder < 2 ? 0 : 11 - remainder;
            tempCpf += digit;

            return cpf.EndsWith(tempCpf.Substring(9, 2));
        }
    }
}
