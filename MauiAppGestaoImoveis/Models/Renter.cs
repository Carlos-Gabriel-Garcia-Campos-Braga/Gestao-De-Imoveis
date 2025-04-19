using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MauiAppGestaoImoveis.Models
{
    public class Renter
    {
        private string _Name;
        public string Name
        {
            get
            {
                return _Name;
            }
            set
            {
                if(System.Text.RegularExpressions.Regex.IsMatch(value, @"^[\p{L}\s]+$"))
                {
                    _Name = value;
                }
                else
                {
                    throw new ArgumentException("O nome só pode conter letras!");
                }
            }
        }

        private string _CPF;
        public string CPF
        {
            get
            {
                return _CPF;
            }
            set
            {
                if(System.Text.RegularExpressions.Regex.IsMatch(value, @"^\d{11}$"))
                {
                    _CPF = value;
                }
                else
                {
                    throw new ArgumentException("O CPF só pode conter números!");
                }
            }
        }
        private string _PhoneNumber;
        public string PhoneNumber
        {
            get
            {
                return _PhoneNumber;
            }
            set
            {
                if(System.Text.RegularExpressions.Regex.IsMatch(value, @"^\(?\d{2}\)?\s?\d{4,5}-?\d{4}$"))
                {
                    _PhoneNumber = value;
                }
                else
                {
                    throw new ArgumentException("O telefone não é válido!");
                }
            }
        }
        public string HouseLocation { get; set; }
        public List<Bills> RenterBills = new List<Bills>();
        public Renter(string Name, string CPF, string PhoneNumber, string HouseLocation, List<Bills> Bills)
        {
            _CPF = CPF;
            _Name = Name;
            _PhoneNumber = PhoneNumber;
            this.HouseLocation = HouseLocation;
            RenterBills = Bills;
        }

        public double PayBills()
        {
            return 0;
        }
    }
}
