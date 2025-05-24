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
        public ICollection<BillsInputModel> Bills { get; set; }
        public DateTime StartContract { get; set; }
        public DateTime EndContract { get; set; }
        public decimal RentalValue { get; set; }
    }
}
