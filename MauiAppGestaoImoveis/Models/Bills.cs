using MauiAppGestaoImoveis.Models.Enum;
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
        public decimal Value { get; set; }
        public int RentalContractId { get; set; }
        public RentalContract RentalContract { get; set; }

        public Bills() { }
        public Bills(string Type, DateTime ValidationDate, decimal Value) 
        {
            this.Type = Type;
            this.ValidationDate = ValidationDate;
            this.Value = Value;
        }
    }
}
