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
        private double WaterBill;
        private DateTime PassWater;

        private double EletricBill;
        private DateTime PassEnergy;

        private double RentBill;
        private DateTime PassRent;

        private double IPTUBill;
        private DateTime PassIPTU;

        private double TotalBill;
        public Bills(double waterBill, double eletricBill, double rentBill, double iPTUBill)
        {
            WaterBill = waterBill;
            EletricBill = eletricBill;
            RentBill = rentBill;
            IPTUBill = iPTUBill;
            TotalBill = waterBill + eletricBill + rentBill + iPTUBill;
        }
        public double LateBills()
        {
            if (WaterBill != 0 || EletricBill != 0 || IPTUBill != 0 || RentBill != 0)
            {
                return TotalBill;
            }

            return 0;
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
    }
}
