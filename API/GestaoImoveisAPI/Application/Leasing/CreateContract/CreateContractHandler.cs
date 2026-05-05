using GestaoImoveisAPI.Domain.Leasing;
using GestaoImoveisAPI.Domain.Leasing.Repositories;
using SharedClasses.InputDTOs;
using SharedClasses.OutputsDTOs;
using SharedClasses.ValueObjects;

namespace GestaoImoveisAPI.Application.Leasing.CreateContract
{
    public class CreateContractHandler
    {
        private readonly IRentalContractRepository _contractRepository;
        private readonly IRenterRepository _renterRepository;

        public CreateContractHandler(
            IRentalContractRepository contractRepository,
            IRenterRepository renterRepository)
        {
            _contractRepository = contractRepository;
            _renterRepository = renterRepository;
        }

        public async Task<RentalContractOutputModel> HandleAsync(
            RentalContractInputModel input,
            CancellationToken ct = default)
        {
            if (await _contractRepository.HasActiveContractForCpfAsync(input.Renter.CPF, ct))
                throw new InvalidOperationException("Já existe um contrato ativo com esse CPF.");

            var cpf = new CPF(input.Renter.CPF);
            var phoneNumber = new PhoneNumber(input.Renter.PhoneNumber);

            var renter = await _renterRepository.GetByCpfAsync(cpf.Value, ct)
                         ?? await CreateRenterAsync(input.Renter.Name, cpf, phoneNumber, ct);

            var address = new Adress(
                input.Adress.Street,
                input.Adress.Complement,
                input.Adress.Number,
                input.Adress.Neighborhood,
                input.Adress.City,
                input.Adress.State,
                input.Adress.ZipCode);

            if (!Enum.TryParse<EconomicIndex>(input.PreferredIndex, ignoreCase: true, out var preferredIndex))
                throw new ArgumentException(
                    $"Índice preferido inválido: '{input.PreferredIndex}'. Valores aceitos: {string.Join(", ", Enum.GetNames<EconomicIndex>())}");

            var contract = RentalContract.Create(
                renter.Id,
                address,
                input.StartContract,
                input.EndContract,
                new Money(input.RentalValue),
                preferredIndex);

            foreach (var b in input.Bills)
                contract.AddBill(b.Type, b.ValidationDate, new Money(b.Value));

            await _contractRepository.AddAsync(contract, ct);
            await _contractRepository.SaveChangesAsync(ct);

            return ToOutputModel(contract, renter);
        }

        private async Task<Renter> CreateRenterAsync(
            string name, CPF cpf, PhoneNumber phoneNumber, CancellationToken ct)
        {
            var renter = Renter.Create(name, cpf, phoneNumber);
            await _renterRepository.AddAsync(renter, ct);
            await _renterRepository.SaveChangesAsync(ct);
            return renter;
        }

        private static RentalContractOutputModel ToOutputModel(RentalContract contract, Renter renter) =>
            new()
            {
                Id = contract.Id,
                Renter = new RenterOutputModel
                {
                    Name = renter.Name,
                    CPF = renter.CPF.Value,
                    PhoneNumber = renter.PhoneNumber.Value
                },
                Adress = new AdressOutputModel
                {
                    Street = contract.Adress.Street,
                    Complement = contract.Adress.Complement,
                    Number = contract.Adress.Number,
                    Neighborhood = contract.Adress.Neighborhood,
                    City = contract.Adress.City,
                    State = contract.Adress.State,
                    ZipCode = contract.Adress.ZipCode
                },
                Bills = contract.Bills.Select(b => new BillsOutputModel
                {
                    Id = b.Id,
                    RentalContractId = b.RentalContractId,
                    Type = b.Type,
                    ValidationDate = b.ValidationDate,
                    Value = b.Value.Amount
                }).ToList(),
                StartContract = contract.StartContract,
                EndContract = contract.EndContract,
                RentalValue = contract.RentalValue.Amount,
                PreferredIndex = contract.PreferredIndex.ToString()
            };
    }
}
