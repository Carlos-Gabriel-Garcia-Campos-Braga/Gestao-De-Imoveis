using System.Text.RegularExpressions;

namespace SharedClasses.ValueObjects
{
    public class Email
    {
        public string Value { get; private set; } = string.Empty;

        private Email() { } // EF Core

        public Email(string email)
        {
            if (string.IsNullOrWhiteSpace(email))
                throw new ArgumentException("E-mail não pode ser vazio.");

            if (!IsValid(email))
                throw new ArgumentException($"Formato de e-mail inválido: '{email}'.");

            Value = email.Trim().ToLowerInvariant();
        }

        private static bool IsValid(string email)
        {
            var regex = new Regex(@"^[^@\s]+@[^@\s]+\.[^@\s]+$");
            return regex.IsMatch(email);
        }
    }
}