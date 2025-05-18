using MauiAppGestaoImoveis.Models;
using MauiAppGestaoImoveis.Services;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Runtime.CompilerServices;

namespace MauiAppGestaoImoveis.ViewModels
{
    public class RenterPageViewModel : INotifyPropertyChanged
    {
        private readonly RentalContractService _rentalContractService;
        private ObservableCollection<RentalContract> _rentalContracts;
        private ObservableCollection<Bills> _bills;

        public ObservableCollection<RentalContract> RentalContracts
        {
            get => _rentalContracts;
            set
            {
                _rentalContracts = value;
                OnPropertyChanged();
            }
        }

        public ObservableCollection<Bills> Bills
        {
            get => _bills;
            set
            {
                _bills = value;
                OnPropertyChanged();
            }
        }

        public RenterPageViewModel()
        {
            _rentalContractService = new RentalContractService();
            RentalContracts = new ObservableCollection<RentalContract>();
            LoadRentalContracts();
        }

        public async Task LoadRentalContracts()
        {
            var contracts = await _rentalContractService.GetAllRentalContractsAsync();

            Console.WriteLine($"Contratos: {contracts.Count}");
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
