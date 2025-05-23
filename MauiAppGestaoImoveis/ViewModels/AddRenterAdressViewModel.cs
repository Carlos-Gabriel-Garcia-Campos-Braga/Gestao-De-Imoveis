using MauiAppGestaoImoveis.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SharedClasses.ValueObjects;

namespace MauiAppGestaoImoveis.ViewModels
{
    public class AddRenterAdressViewModel
    {
        public void SetAdress(string street, string number, string neighborhood, string city, string state, string zipCode, string complement) 
        {
            if(!string.IsNullOrEmpty(complement))
            {
                RenterFlowState.Adress = new Adress(street, complement, number, neighborhood, city, state, zipCode);
            }

            RenterFlowState.Adress = new Adress(street, number, neighborhood, city, state, zipCode);
        }

    }
}
