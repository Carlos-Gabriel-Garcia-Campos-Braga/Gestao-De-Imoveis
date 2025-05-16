using MauiAppGestaoImoveis.ViewModels;
using System.Threading.Tasks;
namespace MauiAppGestaoImoveis.Views;

public partial class RenterPage : ContentPage
{
	public RenterPage(RenterPageViewModel vm)
	{
        InitializeComponent();
        BindingContext = vm;
    }

    private async void AddRenter_Clicked(object sender, EventArgs e)
    {
        var vm = new AddRenterViewModel();
        await Shell.Current.GoToAsync("newRenter");
    }

    protected override void OnAppearing()
    {
        base.OnAppearing();
        if(BindingContext is RenterPageViewModel vm)
        {
            vm.LoadRentalContracts();
        }
    }
}
