
using MauiAppGestaoImoveis.Models;
using MauiAppGestaoImoveis.Services;
using MauiAppGestaoImoveis.ViewModels;

namespace MauiAppGestaoImoveis.Views;

public partial class LoginPage : ContentPage
{
	private readonly UserService userService = new UserService();
	private bool isPasswordHidden = true;
	public LoginPage()
	{
		InitializeComponent();
	}
	private async void LoginButton_Clicked(object sender, EventArgs e)
	{
		try
		{
			var user = await userService.LoginAsync(EmailInput.Text, SenhaInput.Text);
			await Shell.Current.GoToAsync("main");
		}
		catch (Exception ex)
		{
			await DisplayAlert("Erro: ", ex.Message, "Ok");
		}
	}

	private void OnTogglePasswordVisibility(object sender, EventArgs e)
	{
		isPasswordHidden = !isPasswordHidden;
		SenhaInput.IsPassword = isPasswordHidden;

		var button = sender as ImageButton;
		button.Source = isPasswordHidden ? "eye_open.png" : "eye_closed.png";
	}
}