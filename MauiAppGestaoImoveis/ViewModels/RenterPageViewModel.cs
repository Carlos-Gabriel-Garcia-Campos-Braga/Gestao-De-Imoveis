using MauiAppGestaoImoveis.Models;
using SharedClasses.OutputsDTOs;
using MauiAppGestaoImoveis.Services;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Runtime.CompilerServices;

namespace MauiAppGestaoImoveis.ViewModels
{
    public class RenterPageViewModel : INotifyPropertyChanged
    {
        private readonly RentalContractService _rentalContractService;
        private ObservableCollection<RentalContractOutputModel> _rentalContracts;
        private ObservableCollection<Bills> _bills;

        public ObservableCollection<RentalContractOutputModel> RentalContracts
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
            RentalContracts = new ObservableCollection<RentalContractOutputModel>();
            LoadRentalContracts();
        }

        public async Task LoadRentalContracts()
        {
            var contracts = await _rentalContractService.GetAllRentalContractsAsync();

            Console.WriteLine($"Contratos: {contracts.Count}");
            
            var formattedContracts = contracts.Select(c => new RentalContractOutputModel
            {
                Renter = new RenterOutputModel
                {
                    Name = c.Renter.Name,
                    CPF = c.Renter.FormattedCPF,
                    PhoneNumber = c.Renter.FormattedPhoneNumber
                },
                Adress = new AdressOutputModel
                {
                    Street = c.Adress.Street,
                    Complement = c.Adress.Complement,
                    Number = c.Adress.Number,
                    Neighborhood = c.Adress.Neighborhood,
                    City = c.Adress.City,
                    State = c.Adress.State,
                    ZipCode = c.Adress.ZipCode
                },
                Bills = c.Bills.Select(b => new BillsOutputModel
                {
                    Type = b.Type,
                    ValidationDate = b.ValidationDate,
                    Value = b.Value
                }).ToList(),
                StartContract = c.StartContract,
                EndContract = c.EndContract,
                RentalValue = c.RentalValue
            }).ToList();

            // Atualiza a coleção toda e aciona o OnPropertyChanged corretamente
            RentalContracts = new ObservableCollection<RentalContractOutputModel>(formattedContracts);
        }


        public event PropertyChangedEventHandler PropertyChanged;

        protected void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }

}
