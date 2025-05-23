using MauiAppGestaoImoveis.ViewModels;
using MauiAppGestaoImoveis.Models;
using SharedClasses.ValueObjects;

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
            decimal valueRental = decimal.Parse(RentalInput.Text);

            if (valueBill > 0 &&
				DateInput.Date >= DateTime.Now &&
				!string.IsNullOrEmpty(TypeInput.Text))
			{
				_vm.Bills.Add(new Bills
				{
					Type = TypeInput.Text,
					ValidationDate = DateInput.Date,
					Value = new Money(valueBill)
				});

				_vm.addRentalValue(new Money(valueRental));
				_vm.finalDateContract(DateContractInput.Date);

				var result = await _vm.FinishForms();

				if (result == "Success")
				{
					await DisplayAlert("Sucesso", "Contrato criado!", "OK");
					await Shell.Current.GoToAsync("renters");
				}
				else
				{
					await DisplayAlert("ERRO", result, "OK");
				}

			}
		}
		catch (Exception ex)
		{
			{
				await DisplayAlert("ERRO", ex.Message, "OK");
			}
		}
	}
}