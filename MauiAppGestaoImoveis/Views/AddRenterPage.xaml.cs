using MauiAppGestaoImoveis.Models;
using MauiAppGestaoImoveis.Services;

namespace MauiAppGestaoImoveis.Views;

public partial class AddRenterPage : ContentPage
{
	public AddRenterPage()
	{
		InitializeComponent();
	}

    private async void AddRenterButton_Clicked(object sender, EventArgs e)
    {
        try
        {
            Bills BillsTest = new Bills(141.90, 78.70, 900.00, 300.00);
            if (!string.IsNullOrWhiteSpace(NameInput.Text) &&
                !string.IsNullOrWhiteSpace(PhoneInput.Text) &&
                !string.IsNullOrWhiteSpace(CPFInput.Text) && CPFInput.Text.Length == 11 &&
                !string.IsNullOrWhiteSpace(AdressInput.Text))
            {
                NewRenters.Instance.AddRenter(new Renter(NameInput.Text,
                                                         CPFInput.Text,
                                                         PhoneInput.Text,
                                                         AdressInput.Text,
                                                         BillsTest)
                                              );
                await Shell.Current.GoToAsync("renters");
            }
            else
            {
                await DisplayAlert("Atenção", "Preencha todos os campos corretamente.", "Ok");
            }
        }
        catch (Exception ex)
        {
            await DisplayAlert("Erro!", ex.Message, "Fechar");
        }
    }

}