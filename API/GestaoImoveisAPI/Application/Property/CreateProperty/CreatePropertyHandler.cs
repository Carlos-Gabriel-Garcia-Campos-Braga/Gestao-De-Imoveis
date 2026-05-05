using GestaoImoveisAPI.Domain.Property;
using GestaoImoveisAPI.Domain.Property.Repositories;
using GestaoImoveisAPI.Services;
using SharedClasses.InputDTOs;
using SharedClasses.OutputsDTOs;
using SharedClasses.ValueObjects;

namespace GestaoImoveisAPI.Application.Property.CreateProperty
{
    public class CreatePropertyHandler
    {
        private readonly IPropertyRepository _repository;
        private readonly AddressService _addressService;

        public CreatePropertyHandler(IPropertyRepository repository, AddressService addressService)
        {
            _repository = repository;
            _addressService = addressService;
        }

        public async Task<PropertyOutputModel> HandleAsync(
            CreatePropertyFromCepInputModel input,
            CancellationToken ct = default)
        {
            if (!Enum.TryParse<PropertyType>(input.Type, ignoreCase: true, out var type))
                throw new ArgumentException(
                    $"Tipo de imóvel inválido: '{input.Type}'. Valores aceitos: {string.Join(", ", Enum.GetNames<PropertyType>())}");

            var viaCep = await _addressService.GetAddressByZipCode(input.ZipCode);

            if (viaCep == null || viaCep.Erro)
                throw new KeyNotFoundException($"CEP '{input.ZipCode}' não encontrado.");

            var address = new Adress(
                viaCep.Logradouro,
                input.Complement,
                input.Number,
                viaCep.Bairro,
                viaCep.Localidade,
                viaCep.Uf,
                viaCep.Cep);

            var property = Domain.Property.Property.Create(input.Description, type, address);

            await _repository.AddAsync(property, ct);
            await _repository.SaveChangesAsync(ct);

            return ToOutput(property);
        }

        public static PropertyOutputModel ToOutput(Domain.Property.Property p) =>
            new()
            {
                Id = p.Id,
                Description = p.Description,
                Type = p.Type.ToString(),
                Status = p.Status.ToString(),
                Address = new AdressOutputModel
                {
                    Street = p.Address.Street,
                    Number = p.Address.Number,
                    Complement = p.Address.Complement,
                    Neighborhood = p.Address.Neighborhood,
                    City = p.Address.City,
                    State = p.Address.State,
                    ZipCode = p.Address.ZipCode
                }
            };
    }
}
