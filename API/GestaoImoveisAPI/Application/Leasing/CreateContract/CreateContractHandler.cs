using GestaoImoveisAPI.Domain.Leasing;
using GestaoImoveisAPI.Domain.Leasing.Repositories;
using GestaoImoveisAPI.Domain.Property;
using GestaoImoveisAPI.Domain.Property.Repositories;
using SharedClasses.InputDTOs;
using SharedClasses.OutputsDTOs;
using SharedClasses.ValueObjects;

namespace GestaoImoveisAPI.Application.Leasing.CreateContract
{
    public class CreateContractHandler
    {
        private readonly IRentalContractRepository _contractRepository;
        private readonly IRenterRepository _renterRepository;
        private readonly IPropertyRepository _propertyRepository;

        public CreateContractHandler(
            IRentalContractRepository contractRepository,
            IRenterRepository renterRepository,
            IPropertyRepository propertyRepository)
        {
            _contractRepository = contractRepository;
            _renterRepository = renterRepository;
            _propertyRepository = propertyRepository;
        }

        public async Task<RentalContractOutputModel> HandleAsync(
            RentalContractInputModel input,
            CancellationToken ct = default)
        {
            var property = await _propertyRepository.GetByIdAsync(input.PropertyId, ct)
                ?? throw new KeyNotFoundException($"Imóvel {input.PropertyId} não encontrado.");

            if (property.Status != PropertyStatus.Vacant)
                throw new InvalidOperationException("Imóvel não está disponível para locação.");

            if (await _contractRepository.HasActiveContractForCpfAsync(input.Renter.CPF, ct))
                throw new InvalidOperationException("Já existe um contrato ativo com esse CPF.");

            var cpf = new CPF(input.Renter.CPF);
            var phoneNumber = new PhoneNumber(input.Renter.PhoneNumber);

            var renter = await _renterRepository.GetByCpfAsync(cpf.Value, ct)
                         ?? await CreateRenterAsync(input.Renter.Name, cpf, phoneNumber, ct);

            // Copia o endereço do imóvel — denormalizado no contrato para preservar histórico
            var address = new Adress(
                property.Address.Street,
                property.Address.Complement,
                property.Address.Number,
                property.Address.Neighborhood,
                property.Address.City,
                property.Address.State,
                property.Address.ZipCode);

            if (!Enum.TryParse<EconomicIndex>(input.PreferredIndex, ignoreCase: true, out var preferredIndex))
                throw new ArgumentException(
                    $"Índice preferido inválido: '{input.PreferredIndex}'. Valores aceitos: {string.Join(", ", Enum.GetNames<EconomicIndex>())}");

            var contract = RentalContract.Create(
                renter.Id,
                property.Id,
                address,
                input.StartContract,
                input.EndContract,
                new Money(input.RentalValue),
                preferredIndex);

            foreach (var b in input.Bills)
                contract.AddBill(b.Type, b.ValidationDate, new Money(b.Value));

            property.MarkAsOccupied();

            await _contractRepository.AddAsync(contract, ct);
            await _contractRepository.SaveChangesAsync(ct); // salva contrato + status do imóvel (mesmo DbContext)

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
                PropertyId = contract.PropertyId ?? 0,
                Renter = new RenterOutputModel
                {
                    Name = renter.Name,
                    CPF = renter.CPF.Value,
                    PhoneNumber = renter.PhoneNumber.Value
                },
                Adress = new AdressOutputModel
                {
                    Street = contract.Adress.Street ?? string.Empty,
                    Complement = contract.Adress.Complement,
                    Number = contract.Adress.Number ?? string.Empty,
                    Neighborhood = contract.Adress.Neighborhood ?? string.Empty,
                    City = contract.Adress.City ?? string.Empty,
                    State = contract.Adress.State ?? string.Empty,
                    ZipCode = contract.Adress.ZipCode ?? string.Empty
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
