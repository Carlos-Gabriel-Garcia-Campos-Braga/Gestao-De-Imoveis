

namespace MauiAppGestaoImoveis.Views;

public partial class MonthlyBillsPage : ContentPage
{
    public MonthlyBillsPage()
    {
        InitializeComponent();

    }

    protected override void OnAppearing()
    {
        base.OnAppearing();

        // Recarrega os dados sempre que a tela reaparece
        RenterList.ItemsSource = null;

    }
}