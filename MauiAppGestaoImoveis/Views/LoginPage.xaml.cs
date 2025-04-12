using MauiAppGestaoImoveis.Models;

namespace MauiAppGestaoImoveis.Views;

public partial class LoginPage : ContentPage
{
	public LoginPage()
	{
		InitializeComponent();
	}

	User U1 = new User("Carlos");
	private async void LoginButton_Clicked(object sender, EventArgs e)
	{
		if (EmailInput.Text == U1.getEmail() && SenhaInput.Text == U1.getPassword()) 
		{
			//Navegacao pelo Shell, esse é o padrao
			await Shell.Current.GoToAsync("main");
		}
	}
}