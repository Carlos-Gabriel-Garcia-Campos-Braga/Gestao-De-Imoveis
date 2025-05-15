using MauiAppGestaoImoveis.Models;
using MauiAppGestaoImoveis.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MauiAppGestaoImoveis.ViewModels
{
    public class AddRenterBillViewModel
    {
        private readonly RentalContractService _rentalContractService = new();
        public ICollection<Bills> Bills { get; set; } = new List<Bills>();
        public async Task<string> FinishForms()
        {
            RenterFlowState.Bills = Bills;

            RentalContract rentalContract = new RentalContract
                (
                RenterFlowState.Renter,
                RenterFlowState.Adress,
                RenterFlowState.StartDate,
                RenterFlowState.EndDate,
                RenterFlowState.RentalValue,
                RenterFlowState.Bills);

            //POST na API
            var sucesso = await _rentalContractService.AddRentalContractAsync(rentalContract);

            if (sucesso == "Success") { RenterFlowState.Clear(); }

            return sucesso;
        }

        public void addRentalValue(decimal value)
        {
            RenterFlowState.RentalValue = value;
        }

        public void finalDateContract(DateTime date)
        {
            RenterFlowState.EndDate = date;
        }
    }
}
