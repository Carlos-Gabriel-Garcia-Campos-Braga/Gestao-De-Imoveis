using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MauiAppGestaoImoveis.Models
{
    internal class Renter
    {
        private string Name;
        public string _name
        {
            get
            {
                return Name;
            }
            set
            {
                if(System.Text.RegularExpressions.Regex.IsMatch(value, @"^[\p{L}\s]+$"))
                {
                    Name = value;
                }
                else
                {
                    throw new ArgumentException("O nome só pode conter letras!");
                }
            }
        }

        private string CPF;
        public string _cpf
        {
            get
            {
                return CPF;
            }
            set
            {
                if(System.Text.RegularExpressions.Regex.IsMatch(value, @"^\d{11}$"))
                {
                    CPF = value;
                }
                else
                {
                    throw new ArgumentException("O CPF só pode conter números!");
                }
            }
        }
        private string PhoneNumber;
        public string _phoneNumber
        {
            get
            {
                return PhoneNumber;
            }
            set
            {
                if(System.Text.RegularExpressions.Regex.IsMatch(value, @"^\(?\d{2}\)?\s?\d{4,5}-?\d{4}$"))
                {
                    PhoneNumber = value;
                }
                else
                {
                    throw new ArgumentException("O telefone não é válido!");
                }
            }
        }
        public string HouseLocation { get; set; }
        public Bills RenterBills { get; set; }
        public Renter(string Name, string CPF, string PhoneNumber, string HouseLocation, Bills RenterBills)
        {
            _cpf = CPF;
            this.Name = Name;
            this.PhoneNumber = PhoneNumber;
            this.HouseLocation = HouseLocation;
            this.RenterBills = RenterBills;
        }

        public double PayBills()
        {
            return 0;
        }
    }
}
