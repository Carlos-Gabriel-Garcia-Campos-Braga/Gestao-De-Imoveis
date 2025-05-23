using CommunityToolkit.Mvvm.ComponentModel;
using SharedClasses.ValueObjects;
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
        public CPF CPF { get; set; }
        public PhoneNumber PhoneNumber {  get; set; }
        public ICollection<RentalContract> Contracts { get; set; } = new List<RentalContract>();

        public Renter() { }
        public Renter(string Name, CPF CPF, PhoneNumber PhoneNumber)
        {
            this.CPF = CPF;
            this.Name = Name;
            this.PhoneNumber = PhoneNumber;
        }
    }
}
