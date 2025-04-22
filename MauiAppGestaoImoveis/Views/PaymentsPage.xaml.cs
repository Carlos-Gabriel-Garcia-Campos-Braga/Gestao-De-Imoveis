

using MauiAppGestaoImoveis.ViewModels;

namespace MauiAppGestaoImoveis.Views;

public partial class PaymentsPage : ContentPage
{
	public PaymentsPage()
	{
		InitializeComponent();

        BindingContext = new RenterViewModel();
	}
}