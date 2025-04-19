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
            Renters.Add(new Renter("Carlos", 
                "03024430105", 
                "(62)99259-1792", 
                "Rua A", 
                new List<Bills>()));
            Renters.Add(new Renter("Maria",
                "12345678901",
                "(62)99999-9999",
                "Rua B",
                new List<Bills>()));
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
