using MauiAppGestaoImoveis.Views;

namespace MauiAppGestaoImoveis
{
    public partial class App : Application
    {
        public App()
        {
            InitializeComponent();

            MainPage = new AppShell();
        }
    }
}
