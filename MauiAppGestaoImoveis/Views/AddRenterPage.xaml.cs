using MauiAppGestaoImoveis.Models;
using MauiAppGestaoImoveis.ViewModels;
using SharedClasses.ValueObjects;
using System.Text.RegularExpressions;

namespace MauiAppGestaoImoveis.Views;

public partial class AddRenterPage : ContentPage
{
    private readonly AddRenterViewModel _vm;
    public AddRenterPage(AddRenterViewModel vm)
    {
        InitializeComponent();
        _vm = vm;
    }

    private async void NextStepBtn_Clicked(object sender, EventArgs e)
    {
        try
        {
            if (!string.IsNullOrWhiteSpace(NameInput.Text) &&
                !string.IsNullOrWhiteSpace(PhoneInput.Text) &&
                !string.IsNullOrWhiteSpace(CPFInput.Text) &&
                IsValidCPF(CPFInput.Text))
            {
                string unformattedCpf = Regex.Replace(CPFInput.Text, @"\D", "");

                _vm.SetBasicInfos(NameInput.Text, unformattedCpf, PhoneInput.Text);
                await Shell.Current.GoToAsync("addAdress");
            }
            else
            {
                await DisplayAlert("Atenção", "Preencha todos os campos corretamente.", "Ok");
            }
        }
        catch (Exception ex)
        {
            await DisplayAlert("Erro!", ex.Message, "Fechar");
        }
    }

    private void NameInput_TextChanged(object sender, TextChangedEventArgs e)
    {
        var newText = e.NewTextValue;

        if (!Regex.IsMatch(newText, @"^[\p{L}\s]+$"))
        {
            ErrorLabel.Text = "Digite apenas letras";
            ((Entry)sender).Text = e.OldTextValue;
        }
        else
        {
            ErrorLabel.Text = "";
        }
    }

    bool _isFormattingCPF = false;

    private void CPFInput_TextChanged(object sender, TextChangedEventArgs e)
    {
        if (_isFormattingCPF) return;

        var entry = (Entry)sender;
        var numericOnly = Regex.Replace(e.NewTextValue ?? "", @"\D", "");
        entry.Text = numericOnly;
    }

    private void CPFInput_Unfocused(object sender, FocusEventArgs e)
    {
        var cpf = CPFInput.Text ?? "";
        cpf = Regex.Replace(cpf, @"\D", "");

        if (cpf.Length == 11)
        {
            _isFormattingCPF = true;
            CPFInput.Text = Convert.ToUInt64(cpf).ToString(@"000\.000\.000\-00");
            _isFormattingCPF = false;
            ErrorLabel.Text = "";
        }
        else
        {
            ErrorLabel.Text = "O CPF deve conter 11 dígitos.";
        }
    }



    private bool IsValidCPF(string cpf)
    {
        cpf = Regex.Replace(cpf, "[^0-9]", "");

        if (cpf.Length != 11 || cpf.Distinct().Count() == 1)
            return false;

        int[] mult1 = { 10, 9, 8, 7, 6, 5, 4, 3, 2 };
        int[] mult2 = { 11, 10, 9, 8, 7, 6, 5, 4, 3, 2 };

        var tempCpf = cpf.Substring(0, 9);
        int sum = 0;

        for (int i = 0; i < 9; i++)
            sum += int.Parse(tempCpf[i].ToString()) * mult1[i];

        int remainder = sum % 11;
        remainder = remainder < 2 ? 0 : 11 - remainder;
        var digit = remainder.ToString();

        tempCpf += digit;
        sum = 0;

        for (int i = 0; i < 10; i++)
            sum += int.Parse(tempCpf[i].ToString()) * mult2[i];

        remainder = sum % 11;
        remainder = remainder < 2 ? 0 : 11 - remainder;
        digit += remainder.ToString();

        return cpf.EndsWith(digit);
    }
}
