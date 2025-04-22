using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MauiAppGestaoImoveis.Models.Enum
{
    public enum PaymentStatus : int
    {
        Pending = 1,
        Payed = 2,
        Late = 3
    }
}
