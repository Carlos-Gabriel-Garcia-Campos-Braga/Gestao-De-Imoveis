using MauiAppGestaoImoveis.Models;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MauiAppGestaoImoveis.ViewModels
{
    public class RenterInfoViewModel
    {
        public string Name => SelectedRenter.Name;
        public string CPF => SelectedRenter.CPFFormatado;
        public string Phone => SelectedRenter.PhoneNumber;
        public Adress Adress => SelectedRenter.Adress;
        public ObservableCollection<Bills> Bills => SelectedRenter.RenterBills;

        public Renter SelectedRenter { get; }

        public RenterInfoViewModel(Renter renter)
        {
            SelectedRenter = renter;
        }
    }

}
