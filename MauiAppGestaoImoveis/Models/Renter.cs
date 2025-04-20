using CommunityToolkit.Mvvm.ComponentModel;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MauiAppGestaoImoveis.Models
{
    public class Renter : ObservableObject
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
        public ObservableCollection<Bills> RenterBills { get; set; } = new();
        public Renter(string Name, string CPF, string PhoneNumber, string HouseLocation)
        {
            _CPF = CPF;
            _Name = Name;
            _PhoneNumber = PhoneNumber;
            this.HouseLocation = HouseLocation;

            RenterBills.CollectionChanged += (s, e) =>
            {
                OnPropertyChanged(nameof(BillsSummary));
            };
        }

        public void AddBills(Bills Bills)
        {
            RenterBills.Add(Bills);
        }
        public double PayBills()
        {
            return 0;
        }

        public String BillsSummary
        {
            get
            {
                if(RenterBills == null || RenterBills.Count == 0)
                {
                    return "Não há conta!";
                }

                return string.Join("\n", RenterBills.Select(b => $"{b.Type}: R$ {b.Value:F2}"));
            }
        }
    }
}
