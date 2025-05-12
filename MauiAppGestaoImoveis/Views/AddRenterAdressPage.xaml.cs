using MauiAppGestaoImoveis.Models;
using MauiAppGestaoImoveis.ViewModels;

namespace MauiAppGestaoImoveis.Views;

public partial class AddRenterAdressPage : ContentPage
{
    private readonly AddRenterAdressViewModel _vm;
    public AddRenterAdressPage(AddRenterAdressViewModel vm)
    {
        InitializeComponent();
        _vm = vm;
    }

    private async void NextStep_Btn_Clicked(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(StreetInput.Text) &&
           !string.IsNullOrEmpty(NumberInput.Text) &&
           !string.IsNullOrEmpty(NeighborhoodInput.Text) &&
           !string.IsNullOrEmpty(CityInput.Text) &&
           !string.IsNullOrEmpty(StateInput.Text) &&
           !string.IsNullOrEmpty(ZipCodeInput.Text) &&
           !string.IsNullOrEmpty(ComplementInput.Text))
        {
            _vm.SetAdress(StreetInput.Text, NumberInput.Text, NeighborhoodInput.Text, CityInput.Text, StateInput.Text, ZipCodeInput.Text, ComplementInput.Text);
            await Shell.Current.GoToAsync("addBills");
        }
    }

}