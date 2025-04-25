
using MauiAppGestaoImoveis.ViewModels;

namespace MauiAppGestaoImoveis.Views;

public partial class LateBillsPage : ContentPage
{
    private readonly RenterViewModel _vm;

	public LateBillsPage(RenterViewModel vm)
	{
		InitializeComponent();
        _vm = vm;
	}

    protected override void OnAppearing()
    {
        base.OnAppearing();

        BindingContext = _vm;
    }

    private async void LateBtn_Clicked(object sender, EventArgs e)
    {
        await Shell.Current.GoToAsync("payments");
    }
}