using MauiAppGestaoImoveis.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MauiAppGestaoImoveis.ViewModels
{
    public class AddRenterAdressViewModel
    {
        public AddRenterViewModel renterInfo { get; set; }
        public AddRenterAdressViewModel(AddRenterViewModel vm)
        {
            renterInfo = vm;
        }

        public void SetRenterAdress(string street, string number, string neighborhood, string city, string state, string zipCode, string complement)
        {
            Renter r = renterInfo.Renter;
            r.AddAdress(new Adress(street, number, neighborhood, city, state, zipCode, complement));
        }

    }
}
