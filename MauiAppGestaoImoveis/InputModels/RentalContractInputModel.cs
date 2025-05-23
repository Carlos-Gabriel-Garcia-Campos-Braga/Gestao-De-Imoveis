using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MauiAppGestaoImoveis.InputModels
{
    public class RentalContractInputModel
    {
        public RenterInputModel Renter { get; set; } = new();
        public AdressInputModel Adress { get; set; } = new();
        public List<BillsInputModel> Bills { get; set; } = new();
        public DateTime StartContract { get; set; }
        public DateTime EndContract { get; set; }
        public decimal RentalValue { get; set; }
    }
}
