using MauiAppGestaoImoveis.Models;
using MauiAppGestaoImoveis.Services;
using MauiAppGestaoImoveis.ViewModels;

namespace MauiAppGestaoImoveis.Views;

public partial class AddRenterAdressPage : ContentPage
{
    public AddRenterAdressPage(AddRenterAdressViewModel vm)
    {
        InitializeComponent();
         BindingContext = vm;
    } 
}