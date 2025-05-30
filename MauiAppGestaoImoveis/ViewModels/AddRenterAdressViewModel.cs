using MauiAppGestaoImoveis.InputModels;
using MauiAppGestaoImoveis.Models;
using MauiAppGestaoImoveis.Services;
using SharedClasses.Models;
using SharedClasses.ValueObjects;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace MauiAppGestaoImoveis.ViewModels
{
    public class AddRenterAdressViewModel : INotifyPropertyChanged
    {
        private readonly AddressService _addressService;

        private string _cep;
        public string Cep
        {
            get => _cep;
            set
            {
                if (SetProperty(ref _cep, value) && value.Length == 8)
                {
                    _ = LoadAddressAsync(value);
                }
            }
        }

        private string _logradouro;
        public string Logradouro
        {
            get => _logradouro;
            set => SetProperty(ref _logradouro, value);
        }

        private string _bairro;
        public string Bairro
        {
            get => _bairro;
            set => SetProperty(ref _bairro, value);
        }

        private string _cidade;
        public string Cidade
        {
            get => _cidade;
            set => SetProperty(ref _cidade, value);
        }

        private string _estado;
        public string Estado
        {
            get => _estado;
            set => SetProperty(ref _estado, value);
        }

        private string _complemento;
        public string Complemento
        {
            get => _complemento;
            set => SetProperty(ref _complemento, value);
        }

        private string _numero;
        public string Numero
        {
            get => _numero;
            set => SetProperty(ref _numero, value);
        }

        private bool CamposValidos()
        {
            return !string.IsNullOrWhiteSpace(Logradouro) &&
                   !string.IsNullOrWhiteSpace(Numero) &&
                   !string.IsNullOrWhiteSpace(Bairro) &&
                   !string.IsNullOrWhiteSpace(Cidade) &&
                   !string.IsNullOrWhiteSpace(Estado) &&
                   !string.IsNullOrWhiteSpace(Cep) &&
                   !string.IsNullOrWhiteSpace(Complemento);
        }

        public ICommand NextStepCommand { get; }

        public AddRenterAdressViewModel(AddressService addressService)
        {
            _addressService = addressService;
            NextStepCommand = new Command(OnNextStep);
        }

        public async Task<ViaCepResponse> LoadAddressAsync(string zipCode)
        {
            var address = await _addressService.GetAddressByZipCode(zipCode);
            if (address != null)
            {
                Logradouro = address.Logradouro;
                Bairro = address.Bairro;
                Cidade = address.Localidade;
                Estado = address.Uf;

                OnPropertyChanged(nameof(Logradouro));
                OnPropertyChanged(nameof(Bairro));
                OnPropertyChanged(nameof(Cidade));
                OnPropertyChanged(nameof(Estado));
            }
            return address;
        }
    


        public event PropertyChangedEventHandler PropertyChanged;

        protected void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }

        protected bool SetProperty<T>(ref T backingStore, T value, [CallerMemberName] string propertyName = null)
        {
            if (EqualityComparer<T>.Default.Equals(backingStore, value))
                return false;

            backingStore = value;
            OnPropertyChanged(propertyName);
            return true;
        }

        private async void OnNextStep()
        {
            if (CamposValidos())
            {
                RenterFlowState.Adress = new AdressInputModel
                {
                    Street = Logradouro,
                    Complement = string.IsNullOrWhiteSpace(Complemento) ? "Sem complemento!" : Complemento,
                    Number = Numero,
                    Neighborhood = Bairro,
                    City = Cidade,
                    State = Estado,
                    ZipCode = Cep
                };

                await Shell.Current.GoToAsync("addBills");
            }
            else
            {
                await Shell.Current.DisplayAlert("Erro", "Por favor, preencha todos os campos.", "OK");
            }
        }
    }
}

