﻿using SharedClasses.ValueObjects;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MauiAppGestaoImoveis.Models
{
    public class RentalContract
    {
        public int Id { get; set; }
        public Renter Renter { get; set; }
        public int RenterId { get; set; }
        public Adress Adress { get; set; }
        public DateTime StartContract { get; set; }
        public DateTime EndContract { get; set; }
        public Money RentalValue { get; set; }
        public ICollection<Bills> Bills { get; set; }

        public RentalContract() { }
        public RentalContract(Renter renter, Adress houseAdress, DateTime startContract, DateTime endContract, Money rentalValue, ICollection<Bills> bills)
        {
            Renter = renter;
            Adress = houseAdress;
            StartContract = startContract;
            EndContract = endContract;
            RentalValue = rentalValue;
            Bills = bills;
        }

        
    }
}
