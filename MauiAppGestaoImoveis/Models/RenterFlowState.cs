using MauiAppGestaoImoveis.InputModels;
using SharedClasses.ValueObjects;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MauiAppGestaoImoveis.Models
{
    class RenterFlowState
    {
        public static RenterInputModel Renter { get; set; }
        public static AdressInputModel Adress { get; set; }
        public static ICollection<BillsInputModel> Bills { get; set; }
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
