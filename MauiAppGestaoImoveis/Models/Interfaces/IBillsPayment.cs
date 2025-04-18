using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MauiAppGestaoImoveis.Models.Interfaces
{
    internal interface IBillsPayment
    {
        public double MonthPayment();
        public double LateBills();
    }
}
