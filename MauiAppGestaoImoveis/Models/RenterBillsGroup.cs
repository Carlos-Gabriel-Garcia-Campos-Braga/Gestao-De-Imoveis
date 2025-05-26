using MauiAppGestaoImoveis.OutputModels;
using System;
using System.Collections.Generic;
using System.Diagnostics.Contracts;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MauiAppGestaoImoveis.Models
{
    public class RenterBillsGroup
    {
        public RenterOutputModel Renter{ get; set; }
        public List<BillsOutputModel> Bills{ get; set; }

        public RenterBillsGroup(RenterOutputModel Renter, List<BillsOutputModel> Bills)
        {
            this.Renter = Renter;
            this.Bills = Bills ?? new List<BillsOutputModel>();
        }

        public RenterBillsGroup() 
        {
            Bills = new List<BillsOutputModel>();
        }   
        

    }
}
