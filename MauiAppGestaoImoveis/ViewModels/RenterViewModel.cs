using System;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections.ObjectModel;
using MauiAppGestaoImoveis.Models;
using MauiAppGestaoImoveis.Views;
using System.Text.Json;
using MauiAppGestaoImoveis.Services;

namespace MauiAppGestaoImoveis.ViewModels
{
    public partial class RenterViewModel : ObservableObject
    {
        private readonly RenterService _renterService;
        [ObservableProperty] //Isso ira mostrar os atributos, mesmo private, pois ele cria um public e um private automatico
        private ObservableCollection<Renter> renters = new(); //so pode ser em minusculo
        public RenterViewModel()
        {
            _renterService = new RenterService();
        }

        [RelayCommand]
        public async Task LoadRenters()
        {
            var rentersFromAPI = await _renterService.GetAllRentersAsync();
            Renters.Clear();

            foreach (Renter r in rentersFromAPI)
            {
                Renters.Add(r);
            }
        }

        [RelayCommand]
        private async Task NavigateToRenterInfo(Renter renter)
        {
            string renterJSON = Uri.EscapeDataString(JsonSerializer.Serialize(renter)); //codifica o objeto para JSON para que ele possa
                                                                                        //ser passado de forma segura pela URL.
            await Shell.Current.GoToAsync($"renterInfo?renter={renterJSON}");
        }
    }
}
