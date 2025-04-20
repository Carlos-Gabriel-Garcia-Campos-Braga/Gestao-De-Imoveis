using MauiAppGestaoImoveis.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MauiAppGestaoImoveis.ViewModels
{
    public class AddRenterBillViewModel
    {
        private readonly AddRenterViewModel renterInfo;
        private readonly RenterViewModel _vm;
        public string Type;
        public DateTime Validation;
        public double Value;


        public AddRenterBillViewModel(AddRenterViewModel renterInfoVm, RenterViewModel vm)
        {
            renterInfo = renterInfoVm;
            _vm = vm;
        }

        public void AddRenterWithBill()
        {
            Renter r = renterInfo.Renter;
            r.AddBills(new Bills(Type, Validation, Value));
            _vm.AddRenter(r);
        }
    }
}
