using CommunityToolkit.Mvvm.ComponentModel;
using MauiAppGestaoImoveis.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MauiAppGestaoImoveis.ViewModels
{
    public class AddRenterViewModel : ObservableObject
    {
        public void SetBasicInfos(string name, string cPF, string phone)
        {
            RenterFlowState.Renter = new Renter
            {
                Name = name,
                CPF = cPF,
                PhoneNumber = phone
            };
        }
    }
}
