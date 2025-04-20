using MauiAppGestaoImoveis.ViewModels;
namespace MauiAppGestaoImoveis.Views;

public partial class RenterPage : ContentPage
{
	public RenterPage(RenterViewModel vm)
	{
        InitializeComponent();
        BindingContext = vm;
    }

    private async void AddRenter_Clicked(object sender, EventArgs e)
    {
        await Shell.Current.GoToAsync("newRenter");
    }

    protected override void OnAppearing()
    {
        base.OnAppearing();
         //Isso conecta a ViewModel com minha pagina XAML
        //Dizendo assim: Precisa de algo? Pesquisa neste lugar aqui
    }
}