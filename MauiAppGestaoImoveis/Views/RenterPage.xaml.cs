using MauiAppGestaoImoveis.ViewModels;
using System.Threading.Tasks;
namespace MauiAppGestaoImoveis.Views;

public partial class RenterPage : ContentPage
{
    private RenterPageViewModel viewModel;
	public RenterPage()
	{
        InitializeComponent();
        viewModel = new RenterPageViewModel();
        BindingContext = viewModel;
    }

    private async void AddRenter_Clicked(object sender, EventArgs e)
    {
        var vm = new AddRenterViewModel();
        await Shell.Current.GoToAsync("newRenter");
    }

    protected override async void OnAppearing()
    {
        base.OnAppearing();
        if (BindingContext is RenterPageViewModel vm)
        {
            await vm.LoadRentalContracts();

            Console.WriteLine($"Qtd itens: {Contracts.ItemsSource.Cast<object>().Count()}");
        }
        
        
    }
}
