using MauiAppGestaoImoveis.Models.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MauiAppGestaoImoveis.Models
{
    internal class Bills : IBillsPayment
    {
        public double WaterBill { get; set; }
        public DateTime PassWater;

        public double EletricBill { get; set; }
        public DateTime PassEnergy;

        public double RentBill { get; set; }
        public DateTime PassRent;

        public double IPTUBill { get; set; }
        private DateTime PassIPTU;

        private double TotalBill;
        public Bills(double waterBill, double eletricBill, double rentBill, double iPTUBill)
        {
            WaterBill = waterBill;
            EletricBill = eletricBill;
            RentBill = rentBill;
            IPTUBill = iPTUBill;
            PassWater = DateTime.Today;
            PassRent = new DateTime(2024, 4, 1);
            PassEnergy = new DateTime(2024, 4, 10);
            TotalBill = waterBill + eletricBill + rentBill + iPTUBill;
        }
        public double LateWater
        {
            get
            {
                return PassWater <= DateTime.Today ? WaterBill : 0;
            }
        }

        public double LateEnergy
        {
            get
            {
                return PassEnergy <= DateTime.Today ? EletricBill : 0;
            }
        }

        public double MonthPayment(double Amount)
        {
            return Amount -= (WaterBill + EletricBill + RentBill + IPTUBill);
        }

        public double getWaterBill()
        {
            return WaterBill;
        }
        
        public double getEletricBill()
        {
            return EletricBill;
        }

        public double getRentBill()
        {
            return RentBill;
        }

        public double getIPUBill()
        {
            return IPTUBill;
        }

        public double LateBills()
        {
            throw new NotImplementedException();
        }
    }
}
