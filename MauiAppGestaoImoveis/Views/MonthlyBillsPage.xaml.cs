using MauiAppGestaoImoveis.Services;

namespace MauiAppGestaoImoveis.Views;

public partial class MonthlyBillsPage : ContentPage
{
	public MonthlyBillsPage()
	{
		InitializeComponent();

        RenterList.ItemsSource = NewRenters.Instance.Renters;
	}

    protected override void OnAppearing()
    {
        base.OnAppearing();

        // Recarrega os dados sempre que a tela reaparece
        RenterList.ItemsSource = null;
        RenterList.ItemsSource = NewRenters.Instance.Renters;
    }
}