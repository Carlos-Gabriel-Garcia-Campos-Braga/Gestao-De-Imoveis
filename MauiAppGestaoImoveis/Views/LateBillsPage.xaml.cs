
using MauiAppGestaoImoveis.ViewModels;

namespace MauiAppGestaoImoveis.Views;

public partial class LateBillsPage : ContentPage
{

	public LateBillsPage()
	{
		InitializeComponent();
	}

    protected override async void OnAppearing()
    {
        base.OnAppearing();

        if(BindingContext is DelayedBillsViewModel vm)
        {
            await vm.LoadRenters();
        }
    }

    private async void LateBtn_Clicked(object sender, EventArgs e)
    {
        await Shell.Current.GoToAsync("payments");
    }
}