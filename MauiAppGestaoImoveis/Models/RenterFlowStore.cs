using MauiAppGestaoImoveis.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MauiAppGestaoImoveis.Models
{
    public class RenterFlowStore
    {
        public static AddRenterViewModel CurrentRenter {  get; set; }
    }
}
