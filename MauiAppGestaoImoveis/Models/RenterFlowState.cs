using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MauiAppGestaoImoveis.Models
{
    class RenterFlowState
    {
        public static Renter Renter { get; set; }
        public static Adress Adress { get; set; }
        public static ICollection<Bills> Bills { get; set; }
        public static DateTime StartDate { get; set; } = DateTime.Now;
        public static DateTime EndDate { get; set; }
        public static decimal RentalValue { get; set; }

        public static void Clear()
        {
            Renter = null;
            Adress = null;
            Bills = null;
            StartDate = DateTime.MinValue;
            EndDate = DateTime.MinValue;
            RentalValue = 0;
        }
    }
}
