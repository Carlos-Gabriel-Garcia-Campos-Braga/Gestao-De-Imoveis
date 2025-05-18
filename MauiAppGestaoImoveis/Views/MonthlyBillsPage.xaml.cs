

using MauiAppGestaoImoveis.ViewModels;
using System.Threading.Tasks;

namespace MauiAppGestaoImoveis.Views;

public partial class MonthlyBillsPage : ContentPage
{
    public MonthlyBillsPage()
    {
        InitializeComponent();
    }

    protected override async void OnAppearing()
    {
        base.OnAppearing();

        if(BindingContext is MonthlyBillsViewModel viewModel)
        {
            await viewModel.LoadGroupedBills();
        }

    }
}