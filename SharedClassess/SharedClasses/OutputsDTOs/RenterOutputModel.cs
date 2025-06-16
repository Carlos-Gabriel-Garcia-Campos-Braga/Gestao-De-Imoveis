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
            if (string.IsNullOrEmpty(phoneNumber) || phoneNumber.Length < 10)
                return phoneNumber;

            return $"({phoneNumber.Substring(0, 2)}) {phoneNumber.Substring(2, 5)}-{phoneNumber.Substring(7, 4)}";
        }
    }
}
