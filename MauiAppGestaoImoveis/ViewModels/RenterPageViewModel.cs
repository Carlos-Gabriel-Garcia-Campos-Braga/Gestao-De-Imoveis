using MauiAppGestaoImoveis.Models;
using MauiAppGestaoImoveis.Services;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;

namespace MauiAppGestaoImoveis.ViewModels
{
    public class RenterPageViewModel : INotifyPropertyChanged
    {
        private readonly RentalContractService _rentalContractService;
        private ObservableCollection<RentalContract> _rentalContracts;

        public ObservableCollection<RentalContract> RentalContracts
        {
            get => _rentalContracts;
            set
            {
                _rentalContracts = value;
                OnPropertyChanged();
            }
        }

        public RenterPageViewModel()
        {
            _rentalContractService = new RentalContractService();
            RentalContracts = new ObservableCollection<RentalContract>();
            LoadRentalContracts();
        }

        public async void LoadRentalContracts()
        {
            var contracts = await _rentalContractService.GetAllRentalContractsAsync();

            // Atualiza a coleção toda e aciona o OnPropertyChanged corretamente
            RentalContracts = new ObservableCollection<RentalContract>(contracts);
        }

        public event PropertyChangedEventHandler PropertyChanged;

        protected void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }

}
