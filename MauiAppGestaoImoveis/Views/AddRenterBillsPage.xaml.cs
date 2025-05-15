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
			decimal valueBill = decimal.Parse(ValueInput.Text);

			if(valueBill > 0 &&
				DateInput.Date >= DateTime.Now &&
				!string.IsNullOrEmpty(TypeInput.Text))
			{
				_vm.Bills.Add(new Bills
				{
					Type = TypeInput.Text,
					ValidationDate = DateInput.Date,
					Value = valueBill
				});

				_vm.addRentalValue(decimal.Parse(RentalInput.Text));
				_vm.finalDateContract(DateContractInput.Date);
				await _vm.FinishForms();

				await Shell.Current.GoToAsync("renters");
			}
		}
		catch 
		{
		}
    }
}