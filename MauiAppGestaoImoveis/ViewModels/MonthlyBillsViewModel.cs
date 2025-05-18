
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
    public class MonthlyBillsViewModel : INotifyPropertyChanged
    {
        private readonly RentalContractService _rentalContractService;
        private ObservableCollection<RenterBillsGroup> _billsGrouped;

        public ObservableCollection<RenterBillsGroup> BillsGrouped
        {
            get
            {
                return _billsGrouped;
            }
            set
            {
                _billsGrouped = value;
                OnPropertyChanged();
            }
        }

        public MonthlyBillsViewModel()
        {
            _rentalContractService = new RentalContractService();
            BillsGrouped = new ObservableCollection<RenterBillsGroup>();
        }

        public async Task LoadGroupedBills()
        {
            var groupedBills = await _rentalContractService.GetAllRentalContractsBillsAsync();
            BillsGrouped = new ObservableCollection<RenterBillsGroup>(groupedBills);
        }


        public event PropertyChangedEventHandler PropertyChanged;
        protected void OnPropertyChanged([CallerMemberName] string name = null) =>
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(name));
    }
}
