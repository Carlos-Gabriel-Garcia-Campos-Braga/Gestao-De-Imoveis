using System;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections.ObjectModel;
using MauiAppGestaoImoveis.Models;

namespace MauiAppGestaoImoveis.ViewModels
{
    public partial class RenterViewModel : ObservableObject
    {
        [ObservableProperty] //Isso ira mostrar os atributos, mesmo private, pois ele cria um public e um private automatico
        private ObservableCollection<Renter> renters = new(); //so pode ser em minusculo

        public RenterViewModel()
        {
            LoadInitialData();
        }

        private void LoadInitialData()
        {
            Renter r1 = new Renter("Carlos",
                "03024430105",
                "(62)99259-1792");

            r1.AddBills(new Bills("Água", new DateTime(2025, 04, 24), 71.90));
            r1.AddAdress(new Adress("Rua 1", "475", "Ali", "Goiania", "GO", "74375500"));

            Renter r2 = new Renter("Maria",
                "12345678901",
                "(62)99999-9999");

            r2.AddBills(new Bills("Energia", new DateTime(2025, 04, 21), 105.90));
            r2.AddBills(new Bills("Água", new DateTime(2025, 04, 26), 60.13));
            r2.AddAdress(new Adress("Rua 4", "412", "La", "Goiania", "GO", "7668000"));

            Renters.Add(r1);
            Renters.Add(r2);
        }

        public void AddRenter(Renter r)
        {
            Renters.Add(r);
        }
        private void RemoveRenter(Renter r)
        {
            if (Renters.Contains(r))
            {
                Renters.Remove(r);
            }
        }
    }
}
