

using MauiAppGestaoImoveis.ViewModels;

namespace MauiAppGestaoImoveis.Views;

public partial class MonthlyBillsPage : ContentPage
{
    private readonly RenterViewModel _vm;
    public MonthlyBillsPage(RenterViewModel vm)
    {
        InitializeComponent();
        _vm = vm;
    }

    protected override void OnAppearing()
    {
        base.OnAppearing();

        // Recarrega os dados sempre que a tela reaparece
        BindingContext = _vm;

    }
}