
using MauiAppGestaoImoveis.Models;
using MauiAppGestaoImoveis.Services;
using MauiAppGestaoImoveis.ViewModels;

namespace MauiAppGestaoImoveis.Views;

public partial class LoginPage : ContentPage
{
	private readonly UserService userService = new UserService();
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
}