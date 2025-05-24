using MauiAppGestaoImoveis.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SharedClasses.ValueObjects;
using MauiAppGestaoImoveis.InputModels;

namespace MauiAppGestaoImoveis.ViewModels
{
    public class AddRenterAdressViewModel
    {
        public void SetAdress(string street, string number, string neighborhood, string city, string state, string zipCode, string complement) 
        {
            if(!string.IsNullOrEmpty(complement))
            {
                RenterFlowState.Adress = new AdressInputModel
                {
                     Street = street,
                    Complement = string.IsNullOrWhiteSpace(complement) ? "Sem complemento!" : complement,
                    Number = number, 
                     Neighborhood = neighborhood,
                     City = city, 
                     State = state,
                     ZipCode = zipCode 
                };
            }

            
        }

    }
}
