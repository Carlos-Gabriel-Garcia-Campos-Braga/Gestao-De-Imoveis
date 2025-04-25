

using MauiAppGestaoImoveis.ViewModels;
using System.Threading.Tasks;

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

    private async void LateBtn_Clicked(object sender, EventArgs e)
    {
		await Shell.Current.GoToAsync("late_bills");
    }
}