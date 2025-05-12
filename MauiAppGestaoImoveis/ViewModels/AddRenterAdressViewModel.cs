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
        public void SetAdress(string street, string number, string neighborhood, string city, string state, string zipCode, string complement) 
        {
            RenterFlowState.Adress = new Adress
            {
                Street = street,
                Number = number,
                Neighborhood = neighborhood,
                City = city,
                State = state,
                ZipCode = zipCode,
                Complement = complement
            };
        }

    }
}
