using MauiAppGestaoImoveis.Services;
using SharedClasses.InputDTOs;

namespace MauiAppGestaoImoveis.Views;

public partial class RegisterPage : ContentPage
{
    private bool isPasswordHidden = true;
    UserService userService = new UserService();
	public RegisterPage()
	{
		InitializeComponent();
	}

    private void OnTogglePasswordVisibility(object sender, EventArgs e)
    {
        isPasswordHidden = !isPasswordHidden;
        SenhaInput.IsPassword = isPasswordHidden;

        var button = sender as ImageButton;
        button.Source = isPasswordHidden ? "eye_open.png" : "eye_closed.png";
    }

    private async void RegisterButton_Clicked(object sender, EventArgs e)
    {
        try
        {
            if(SenhaConfirmInput.Text != SenhaInput.Text)
            {
                await DisplayAlert("Erro", "As senhas não coincidem", "Ok");
            }

            if (!string.IsNullOrEmpty(NameInput.Text) &&
            !string.IsNullOrEmpty(EmailInput.Text) &&
            !string.IsNullOrEmpty(SenhaInput.Text) &&
            !string.IsNullOrEmpty(SenhaConfirmInput.Text) &&
            SenhaConfirmInput.Text == SenhaInput.Text)
            {
                UserInputModel userInput = new UserInputModel
                {
                    Name = NameInput.Text,
                    Email = EmailInput.Text,
                    Password = SenhaInput.Text
                };

                string result = await userService.RegisterAsync(userInput);

                if (result == "Sucess")
                {
                    await DisplayAlert("Sucesso!", "Cadastrado com sucesso!", "Ok");
                    await Shell.Current.GoToAsync("login");
                }
                else
                {
                    await DisplayAlert("Erro", result, "Fechar");
                }
            }
        }
        catch (Exception ex)
        {
            await DisplayAlert("Erro", ex.Message, "Fechar");
        }
    }
}