using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MauiAppGestaoImoveis.InputModels
{
    public class BillsInputModel
    {
        public string Type { get; set; } = string.Empty;
        public decimal Value { get; set; }
        public DateTime ValidationDate { get; set; }
    }
}
