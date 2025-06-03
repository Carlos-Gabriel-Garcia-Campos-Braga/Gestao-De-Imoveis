using System.Text.RegularExpressions;

namespace SharedClasses.ValueObjects
{
    public class Email
    {
        public string email { get; set; }

        public Email(string email)
        {
            if (string.IsNullOrWhiteSpace(email))
            {
                throw new ArgumentException("O e-mail nao pode estar vazio!");
            }

            if (!isValidEmail(email))
            {
                throw new ArgumentException("Formato de e-mail invalido!");
            }
            this.email = email;
        }

        public bool isValidEmail(string email)
        {
            var regex = new Regex(@"^[^@\s]+@[^@\s]+\.[^@\s]+$");
            return regex.IsMatch(email);
        }
    }
}