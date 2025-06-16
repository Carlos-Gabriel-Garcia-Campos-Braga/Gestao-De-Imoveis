using SharedClasses.InputDTOs;
using GestaoImoveisAPI.Data;
using Microsoft.EntityFrameworkCore;

namespace GestaoImoveisAPI.Validators
{
    public class RentalContractValidator
    {
        private readonly AppDbContext _context;
        public RentalContractValidator(AppDbContext context)
        {
            _context = context;
        }
        public ValidationResult IsValidData(RentalContractInputModel rc)
        {
            var result = new ValidationResult();

            if (rc == null)
            {
                result.Errors.Add("Dados do contrato ausentes.");
                return result;
            }

            if (rc.Renter == null)
                result.Errors.Add("Dados do inquilino ausentes.");

            if (rc.Adress == null)
                result.Errors.Add("Endereço ausente.");

            if (rc.Bills == null || !rc.Bills.Any())
                result.Errors.Add("Contas ausentes.");

            if (rc.Renter != null && _context.Contract
                    .Include(c => c.Renter)
                    .Any(c => c.Renter.CPF.Value == rc.Renter.CPF))
                result.Errors.Add("Já existe um contrato com esse CPF.");

            if (rc.RentalValue <= 0)
                result.Errors.Add("Valor do aluguel deve ser maior que zero.");

            if (rc.Bills != null && rc.Bills.Any(b => b.Value <= 0))
                result.Errors.Add("Há contas com valor inválido.");

            if (rc.Bills != null && rc.Bills.Any(b => b.ValidationDate < rc.StartContract || b.ValidationDate > rc.EndContract))
                result.Errors.Add("Algumas datas de vencimento estão fora do período do contrato.");

            return result;
        }

    }
}