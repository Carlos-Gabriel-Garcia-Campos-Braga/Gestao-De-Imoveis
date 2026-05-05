using GestaoImoveisAPI.Domain.Property.Repositories;
using GestaoImoveisAPI.Services;
using SharedClasses.InputDTOs;
using SharedClasses.OutputsDTOs;
using SharedClasses.ValueObjects;

namespace GestaoImoveisAPI.Application.Property.UpdateProperty
{
    public class UpdatePropertyHandler
    {
        private readonly IPropertyRepository _repository;
        private readonly AddressService _addressService;

        public UpdatePropertyHandler(IPropertyRepository repository, AddressService addressService)
        {
            _repository = repository;
            _addressService = addressService;
        }

        public async Task<PropertyOutputModel> HandleAsync(
            int id,
            CreatePropertyFromCepInputModel input,
            CancellationToken ct = default)
        {
            var property = await _repository.GetByIdAsync(id, ct)
                ?? throw new KeyNotFoundException($"Imóvel com id '{id}' não encontrado.");

            if (!Enum.TryParse<Domain.Property.PropertyType>(input.Type, ignoreCase: true, out var type))
                throw new ArgumentException(
                    $"Tipo de imóvel inválido: '{input.Type}'. Valores aceitos: {string.Join(", ", Enum.GetNames<Domain.Property.PropertyType>())}");

            var viaCep = await _addressService.GetAddressByZipCode(input.ZipCode);

            if (viaCep == null || viaCep.Erro)
                throw new KeyNotFoundException($"CEP '{input.ZipCode}' não encontrado.");

            var newAddress = new Adress(
                viaCep.Logradouro,
                input.Complement,
                input.Number,
                viaCep.Bairro,
                viaCep.Localidade,
                viaCep.Uf,
                viaCep.Cep);

            property.UpdateDetails(input.Description, type, newAddress);

            await _repository.SaveChangesAsync(ct);

            return CreateProperty.CreatePropertyHandler.ToOutput(property);
        }
    }
}
