using MauiAppGestaoImoveis.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MauiAppGestaoImoveis.Services
{
    class NewRenters
    {
        //Isso se chama singleton, algo de unica instancia
        private static NewRenters _instance;
        public static NewRenters Instance
        {
            get
            {
                if(_instance == null)
                {
                    _instance = new NewRenters();
                }

                return _instance;
            }
        }
        public List<Renter> Renters { get; private set; }

        public NewRenters()
        {
            Renters = new List<Renter>();
        }

        public void AddRenter(Renter NewRenter)
        {
            Renters.Add(NewRenter);
        }

        public void RemoveRenter(Renter RenterRemoved)
        {
            Renters.Remove(RenterRemoved);
        }


    }
}
