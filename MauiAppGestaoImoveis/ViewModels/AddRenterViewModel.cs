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
        public Renter Renter { get; private set; }

        public void SetBasicInfos(string name, string cPF, string phone)
        {
            Renter = new Renter(name, cPF, phone);
        }
    }
}
