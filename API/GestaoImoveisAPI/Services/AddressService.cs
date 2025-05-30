using SharedClasses.Models;
using System.Runtime.ConstrainedExecution;
using System.Text.Json;

namespace GestaoImoveisAPI.Services
{
    public class AddressService
    {
        HttpClient _httpClient;

        public AddressService(HttpClient htppClient)
        {
            _httpClient = htppClient;
        }

        
        public async Task<ViaCepResponse> GetAddressByZipCode(string cep)
        {
            //Esta e a URL do WebService que esta sendo consumido,
            //ou seja, e daqui que conseguiremos no formato JSON as informacoes do endereco via CEP
            var url = $"https://viacep.com.br/ws/{cep}/json/";

            //O http faz o get de todas as informacoes com base na URL que montamos
            //com o CEP desejado
            var response = await _httpClient.GetAsync(url);

            if(!response.IsSuccessStatusCode)
            {
                return null;
            }

            //O conteudo armazena o corpo da resposta como uma string em formato JSON
            var content = await response.Content.ReadAsStringAsync();

            //O endereco, em JSON, sera deserializado no formato da model ViaCepResponse
            var adress = JsonSerializer.Deserialize<ViaCepResponse>(content, new JsonSerializerOptions
            {
                PropertyNameCaseInsensitive = true
            });

            return adress;
        }
    }
}
