using MauiAppGestaoImoveis.InputModels;
using MauiAppGestaoImoveis.Models;
using MauiAppGestaoImoveis.Services;
using SharedClasses.ValueObjects;
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
        public ICollection<BillsInputModel> Bills { get; set; } = new List<BillsInputModel>();
        public async Task<string> FinishForms()
        {
            RenterFlowState.Bills = Bills;

            RentalContractInputModel rentalContract = new RentalContractInputModel
            {
                Renter = RenterFlowState.Renter,
                Adress = RenterFlowState.Adress,
                StartContract = RenterFlowState.StartDate,
                EndContract = RenterFlowState.EndDate,
                RentalValue = RenterFlowState.RentalValue,
                Bills = RenterFlowState.Bills
            };
                
                

            //POST na API
            var sucesso = await _rentalContractService.AddRentalContractAsync(rentalContract);

            if (sucesso == "Success") 
            { 
                RenterFlowState.Clear(); 
            }

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
