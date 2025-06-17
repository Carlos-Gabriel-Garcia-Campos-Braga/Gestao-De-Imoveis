namespace SharedClasses.OutputsDTOs
{
    public class RenterOutputModel
    {
        public string Name { get; set; }
        public string CPF { get; set; }
        public string FormattedCPF => FormatCPF(CPF);
        public string PhoneNumber { get; set; }
        public string FormattedPhoneNumber => FormatPhone(PhoneNumber);

        private string FormatCPF(string Cpf)
        {
            return $"{Cpf.Substring(0, 3)}.{Cpf.Substring(3, 3)}.{Cpf.Substring(6, 3)}-{Cpf.Substring(9, 2)}";
        }

        private string FormatPhone(string phoneNumber)
        {
            if (string.IsNullOrWhiteSpace(phoneNumber))
            {
                return string.Empty;
            }

            phoneNumber = new string(phoneNumber.Where(char.IsDigit).ToArray());

            if (phoneNumber.Length == 11)
            {
                return $"({phoneNumber.Substring(0, 2)}) {phoneNumber.Substring(2, 5)}-{phoneNumber.Substring(7, 4)}";
            }
            else if (phoneNumber.Length == 10)
            {
                return $"({phoneNumber.Substring(0, 2)}) {phoneNumber.Substring(2, 4)}-{phoneNumber.Substring(6, 4)}";
            }
            else
            {
                return phoneNumber;
            }
        }
    }
}
