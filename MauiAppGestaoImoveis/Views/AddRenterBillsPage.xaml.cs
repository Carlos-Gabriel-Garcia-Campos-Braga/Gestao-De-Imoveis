using MauiAppGestaoImoveis.ViewModels;
using MauiAppGestaoImoveis.Models;

namespace MauiAppGestaoImoveis.Views;

public partial class AddRenterBillsPage : ContentPage
{
	private readonly AddRenterBillViewModel _vm;
	public AddRenterBillsPage(AddRenterBillViewModel vm)
	{
		InitializeComponent();
		_vm = vm;
	}

    private async void AddRenterBtn_Clicked(object sender, EventArgs e)
    {
		try
		{
			double valueBill = double.Parse(ValueInput.Text);

			if(valueBill > 0 &&
				DateInput.Date >= DateTime.Now &&
				!string.IsNullOrEmpty(TypeInput.Text))
			{
				_vm.Type = TypeInput.Text;
				_vm.Value = valueBill;
				_vm.Validation = DateInput.Date;

				_vm.AddRenterWithBill();

				await Shell.Current.GoToAsync("renters");
			}
		}
		catch 
		{
		}
    }
}