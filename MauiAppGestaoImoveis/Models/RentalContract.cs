using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MauiAppGestaoImoveis.Models
{
    public class RentalContract
    {
        public Renter Renter { get; set; }
        public Adress HouseAdress { get; set; }
        public DateTime StartContract { get; set; }
        public DateTime EndContract { get; set; }
        public double RentalValue { get; set; }
        public ICollection<Bills> Bills { get; set; }

        public RentalContract(Renter renter, Adress houseAdress, DateTime startContract, DateTime endContract, double rentalValue, ICollection<Bills> bills)
        {
            Renter = renter;
            HouseAdress = houseAdress;
            StartContract = startContract;
            EndContract = endContract;
            RentalValue = rentalValue;
            Bills = bills;
        }
    }
}
