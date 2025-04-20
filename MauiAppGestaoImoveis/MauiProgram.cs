using MauiAppGestaoImoveis.Models;
using MauiAppGestaoImoveis.ViewModels;
using MauiAppGestaoImoveis.Views;
using Microsoft.Extensions.Logging;

namespace MauiAppGestaoImoveis
{
    public static class MauiProgram
    {
        public static MauiApp CreateMauiApp()
        {
            var builder = MauiApp.CreateBuilder();
            builder
                .UseMauiApp<App>()
                .ConfigureFonts(fonts =>
                {
                    fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
                    fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");
                });

            builder.Services.AddSingleton<RenterViewModel>(); //Cria uma unica instancia do RenterViewModel
            builder.Services.AddSingleton<AddRenterViewModel>();//Cria uma unica instancia do AddRenterViewModel
            builder.Services.AddTransient<AddRenterPage>(); //Cria uma nova instancia da pagina assim que chamada   
            builder.Services.AddTransient<RenterPage>();
            builder.Services.AddTransient<AddRenterBillsPage>();
            builder.Services.AddTransient<MonthlyBillsPage>();  
            builder.Services.AddTransient<AddRenterBillViewModel>(sp => 
                                         new AddRenterBillViewModel(
                                             sp.GetRequiredService<AddRenterViewModel>(),
                                             sp.GetRequiredService<RenterViewModel>()));




#if DEBUG
    		builder.Logging.AddDebug();
#endif

            return builder.Build();
        }
    }
}
