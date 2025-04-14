using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MauiAppGestaoImoveis.Models
{
    internal class Renter
    {
        public string Name { get; set; }
        public string CPF { get; set; }
        public string PhoneNumber { get; set; }
        public string HouseLocation { get; set; }
        public Bills RenterBills { get; set; }
        public Renter(string Name, string CPF, string PhoneNumber, string HouseLocation, Bills RenterBills)
        {
            this.CPF = CPF;
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
