
namespace MauiAppGestaoImoveis.Views;

public partial class LateBillsPage : ContentPage
{
	public LateBillsPage()
	{
		InitializeComponent();

	}

    private void LoadRenters()
    {
        ;// var Renters = NewRenters.Instance.Renters;

        // Verificando o cálculo de contas atrasadas

        /*var LateRenters = Renters.Where(b =>
                            b.RenterBills > 0 ||
                            ).ToList();

        LateBills.ItemsSource = LateRenters;*/
    }

    protected override void OnAppearing()
    {
        base.OnAppearing();

		LoadRenters();
    }
}