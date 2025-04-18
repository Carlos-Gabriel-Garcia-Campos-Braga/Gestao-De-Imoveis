using MauiAppGestaoImoveis.Services;

namespace MauiAppGestaoImoveis.Views;

public partial class PaymentsPage : ContentPage
{
	public PaymentsPage()
	{
		InitializeComponent();

        MonthlyBills.ItemsSource = NewRenters.Instance.Renters;
	}
}