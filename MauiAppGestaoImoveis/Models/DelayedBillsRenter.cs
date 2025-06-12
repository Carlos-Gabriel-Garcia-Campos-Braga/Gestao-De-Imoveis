using SharedClasses.OutputsDTOs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MauiAppGestaoImoveis.Models
{
    public class DelayedBillsRenter
    {
        public RenterOutputModel Renter { get; set; }
        public List<BillsOutputModel> DelayedBills { get; set; }

        public DelayedBillsRenter(RenterOutputModel renter, List<BillsOutputModel> bills)
        {
            this.Renter = renter;
            this.DelayedBills = bills ?? new List<BillsOutputModel>();
        }

        public DelayedBillsRenter()
        {
            DelayedBills = new List<BillsOutputModel>();
        }
    }
}
