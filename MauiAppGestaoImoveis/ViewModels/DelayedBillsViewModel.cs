using MauiAppGestaoImoveis.Models;
using MauiAppGestaoImoveis.Services;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Net.Http.Headers;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;

namespace MauiAppGestaoImoveis.ViewModels
{
    public class DelayedBillsViewModel : INotifyPropertyChanged
    {
        private readonly RentalContractService _rentalContract;
        private ObservableCollection<DelayedBillsRenter> delayedBillsRenters;

        public ObservableCollection<DelayedBillsRenter> DelayedBillsRenters
        {
            get => delayedBillsRenters;

            set
            {
                delayedBillsRenters = value;
                OnPropertyChanged();
            }
        }

        public async Task LoadRenters()
        {
            var contracts = await _rentalContract.GetAllRentalContractsDelayedBillsAsync();
            DelayedBillsRenters = new ObservableCollection<DelayedBillsRenter>(contracts);
        }

        public DelayedBillsViewModel()
        {
            _rentalContract = new RentalContractService();
            DelayedBillsRenters = new ObservableCollection<DelayedBillsRenter>();
        }

        public event PropertyChangedEventHandler PropertyChanged;

        protected void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }

    }
}
