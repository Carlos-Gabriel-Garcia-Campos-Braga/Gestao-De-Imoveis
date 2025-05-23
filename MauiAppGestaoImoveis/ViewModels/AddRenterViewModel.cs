using CommunityToolkit.Mvvm.ComponentModel;
using MauiAppGestaoImoveis.Models;
using SharedClasses.ValueObjects;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MauiAppGestaoImoveis.ViewModels
{
    public class AddRenterViewModel : ObservableObject
    {
        public void SetBasicInfos(string name, CPF Cpf, PhoneNumber phone)
        {
            RenterFlowState.Renter = new Renter
            {
                Name = name,
                CPF = Cpf,
                PhoneNumber = phone
            };
        }
    }
}
