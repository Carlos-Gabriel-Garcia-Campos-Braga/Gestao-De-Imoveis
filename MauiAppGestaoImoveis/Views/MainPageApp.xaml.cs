using System.Threading.Tasks;

namespace MauiAppGestaoImoveis.Views;

public partial class MainPageApp : ContentPage
{
	public MainPageApp()
	{
		InitializeComponent();
	}

    private async void GoRenterPage_Clicked(object sender, EventArgs e)
    {
        await Shell.Current.GoToAsync("renters");
    }

    private async void GoMonthlyBills_Clicked(object sender, EventArgs e)
    {
        await Shell.Current.GoToAsync("monthly_bills");
    }

    private async void LateBillsBtn_Clicked(object sender, EventArgs e)
    {
        await Shell.Current.GoToAsync("late_bills");
    }

    private async void PaymentsBtn_Clicked(object sender, EventArgs e)
    {
        await Shell.Current.GoToAsync("payments");
    }
}