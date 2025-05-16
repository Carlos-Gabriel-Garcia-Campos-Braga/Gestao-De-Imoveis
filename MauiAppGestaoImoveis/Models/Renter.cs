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
        public int Id { get; set; }
        public string Name { get; set; }
        public string CPF { get; set; }
        public string CPFFormatado => Convert.ToUInt64(CPF).ToString(@"000\.000\.000\-00");
        public string PhoneNumber {  get; set; }
        public ICollection<RentalContract> Contracts { get; set; } = new List<RentalContract>();

        public Renter() { }
        public Renter(string Name, string CPF, string PhoneNumber)
        {
            this.CPF = CPF;
            this.Name = Name;
            this.PhoneNumber = PhoneNumber;
        }
        
        public bool IsValidName(string Name) =>
            System.Text.RegularExpressions.Regex.IsMatch(Name, @"^[\p{L}\s]+$");

        public bool IsValidCPF(string CPF) =>
            System.Text.RegularExpressions.Regex.IsMatch(CPF, @"^\d{11}$");

        public bool IsValidPhone(string Phone) =>
            System.Text.RegularExpressions.Regex.IsMatch(Phone, @"^\(?\d{2}\)?\s?\d{4,5}-?\d{4}$");

    }
}
