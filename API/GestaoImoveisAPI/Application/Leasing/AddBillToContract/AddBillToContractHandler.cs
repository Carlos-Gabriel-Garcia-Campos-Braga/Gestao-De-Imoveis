using GestaoImoveisAPI.Domain.Leasing;
using GestaoImoveisAPI.Domain.Leasing.Repositories;
using SharedClasses.InputDTOs;
using SharedClasses.OutputsDTOs;
using SharedClasses.ValueObjects;

namespace GestaoImoveisAPI.Application.Leasing.AddBillToContract
{
    public class AddBillToContractHandler
    {
        private readonly IRentalContractRepository _repository;

        public AddBillToContractHandler(IRentalContractRepository repository)
        {
            _repository = repository;
        }

        public async Task<BillsOutputModel> HandleAsync(
            BillsInputModel input,
            CancellationToken ct = default)
        {
            var contract = await _repository.GetByIdAsync(input.RentalContractId, ct)
                ?? throw new KeyNotFoundException("Contrato não encontrado.");

            Money value;
            try { value = new Money(input.Value); }
            catch (ArgumentException ex) { throw new ArgumentException(ex.Message); }

            var bill = contract.AddBill(input.Type, input.ValidationDate, value);
            await _repository.SaveChangesAsync(ct);

            return new BillsOutputModel
            {
                Id = bill.Id,
                RentalContractId = bill.RentalContractId,
                Type = bill.Type,
                ValidationDate = bill.ValidationDate,
                Value = bill.Value.Amount
            };
        }
    }
}
