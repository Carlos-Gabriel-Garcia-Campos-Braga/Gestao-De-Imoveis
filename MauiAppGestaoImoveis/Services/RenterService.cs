using MauiAppGestaoImoveis.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Json;
using System.Text;
using System.Threading.Tasks;

namespace MauiAppGestaoImoveis.Services
{
    public class RenterService
    {
        private readonly HttpClient _httpClient;
        public RenterService()
        {
            //Oq esta acontecendo aqui?
            //Fazemos uma instancia de um servico HTTP, configurando a rota padrao com BaseAdress   
            _httpClient = new HttpClient
            {
                BaseAddress = new Uri("http://localhost:5156/")
            };
        }

        public async Task<List<Renter>> GetAllRentersAsync()
        {
            try
            {
                //Aq, para mostrar os objetos e renters, voltamos ele do JSON para Object
                var renters = await _httpClient.GetFromJsonAsync<List<Renter>>("api/renter");
                return renters ?? new List<Renter>();
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Erro ao mostrar inquilino: {ex.Message}");
                return new List<Renter>();
            }
        }

        public async Task<bool> AddRenterAsync(Renter renter)
        {
            try
            {
                //Aq eu pego e transformo o meu objeto renter para JSON, para que a API entenda ele
                var response = await _httpClient.PostAsJsonAsync("api/renter", renter);
                return response.IsSuccessStatusCode;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Erro ao adicionar inquilino: {ex.Message}");
                return false;
            }
        }
    }
}
