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
        public Renter Renter{ get; set; }
        public List<Bills> Bills{ get; set; }

        public RenterBillsGroup(Renter Renter, List<Bills> Bills)
        {
            this.Renter = Renter;
            this.Bills = Bills ?? new List<Bills>();
        }

        public RenterBillsGroup() 
        {
            Bills = new List<Bills>();
        }   
        

    }
}
