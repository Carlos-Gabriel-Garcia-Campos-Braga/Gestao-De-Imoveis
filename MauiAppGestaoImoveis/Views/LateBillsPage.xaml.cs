
using MauiAppGestaoImoveis.ViewModels;

namespace MauiAppGestaoImoveis.Views;

public partial class LateBillsPage : ContentPage
{

	public LateBillsPage()
	{
		InitializeComponent();
        BindingContext = new RenterViewModel();
	}

    protected override void OnAppearing()
    {
        base.OnAppearing();


    }
}