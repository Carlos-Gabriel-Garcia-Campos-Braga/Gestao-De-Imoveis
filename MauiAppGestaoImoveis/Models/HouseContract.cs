using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MauiAppGestaoImoveis.Models
{
    public class HouseContract
    {
        private Renter Renter { get; set; }
        private Adress HouseAdress { get; set; }
        private ICollection<Bills> Bills { get; set; }

        public HouseContract(Renter renter, Adress houseAdress, ICollection<Bills> bills)
        {
            Renter = renter;
            HouseAdress = houseAdress;
            Bills = bills;
        }
    }
}
