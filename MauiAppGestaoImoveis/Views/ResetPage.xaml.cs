using MauiAppGestaoImoveis.Services;
using SharedClasses.InputDTOs;

namespace MauiAppGestaoImoveis.Views
{
    public partial class ResetPage : ContentPage
    {
        private readonly UserService userService = new UserService();

        public ResetPage()
        {
            InitializeComponent();
        }

        private async void ResetButton_Clicked(object sender, EventArgs e)
        {
            try
            {
                var user = new UserInputModel
                {
                    Email = EmailInput.Text,
                    Password = SenhaInput.Text
                };

                var result = await userService.ResetPassword(user);

                await DisplayAlert("Sucesso", result, "Ok");
                await Shell.Current.GoToAsync("main");
            }
            catch (Exception ex)
            {
                await DisplayAlert("Erro: ", ex.Message, "Ok");
            }
        }
    }
}
