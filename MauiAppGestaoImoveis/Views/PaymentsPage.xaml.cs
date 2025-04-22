

using MauiAppGestaoImoveis.ViewModels;

namespace MauiAppGestaoImoveis.Views;

public partial class PaymentsPage : ContentPage
{
	private readonly RenterViewModel _vm;
	public PaymentsPage(RenterViewModel vm)
	{
		InitializeComponent();

        _vm = vm;
	}

    protected override void OnAppearing()
	{
		base.OnAppearing();
		BindingContext = _vm;
	}
}