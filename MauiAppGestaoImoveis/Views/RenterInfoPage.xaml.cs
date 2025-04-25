using MauiAppGestaoImoveis.Models;
using MauiAppGestaoImoveis.ViewModels;
using System.Text.Json;

namespace MauiAppGestaoImoveis.Views;
[QueryProperty(nameof(RenterJSON), "renter")] //Mapeia uma propriedade local (RenterJson)
											  //como rota "renter", para receber os dados ao ser acionado (nesse caso, da navegacao)
public partial class RenterInfoPage : ContentPage
{
	public string RenterJSON 
	{ 
		set
		{
			var renter = JsonSerializer.Deserialize<Renter> //Essa parte transforma a string JSON em um objeto do tipo Renter
						(Uri.UnescapeDataString(value)); //Desfaz a codificao para recuperar o JSON original
			BindingContext = new RenterInfoViewModel(renter);
		}
	}
	public RenterInfoPage()
	{
		InitializeComponent();
	}
}