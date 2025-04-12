using MauiAppGestaoImoveis.Services;

namespace MauiAppGestaoImoveis.Views;

public partial class RenterPage : ContentPage
{
	public RenterPage()
	{
		InitializeComponent();

        RenterList.ItemsSource = NewRenters.Instance.Renters;
	}

    private async void AddRenter_Clicked(object sender, EventArgs e)
    {
        await Shell.Current.GoToAsync("newRenter");
    }

    protected override void OnAppearing()
    {
        base.OnAppearing();

        // Recarrega os dados sempre que a tela reaparece
        RenterList.ItemsSource = null;
        RenterList.ItemsSource = NewRenters.Instance.Renters;
    }
}