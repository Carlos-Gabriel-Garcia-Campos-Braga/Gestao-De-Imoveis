using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MauiAppGestaoImoveis.Models
{
    public class Bills
    {
        public string Type { get; set; }
        public DateTime ValidationDate { get; set; }
        public double Value { get; set; }
        
        public Bills(string Type, DateTime ValidationDate, double Value) 
        {
            this.Type = Type;
            this.ValidationDate = ValidationDate;
            this.Value = Value;
        }
    }
}
