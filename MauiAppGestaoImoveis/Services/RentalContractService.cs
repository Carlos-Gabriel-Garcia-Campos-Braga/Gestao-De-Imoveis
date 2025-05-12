using MauiAppGestaoImoveis.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Json;
using System.Text;
using System.Threading.Tasks;

namespace MauiAppGestaoImoveis.Services
{
    public class RentalContractService
    {
        private readonly HttpClient _httpClient;

        public RentalContractService()
        {
            // BaseAddress aponta para a URL da API ASP.NET Core
            _httpClient = new HttpClient
            {
                BaseAddress = new Uri("http://10.0.2.2:5000/")
            };
        }

        public async Task<bool> AddRentalContractAsync(RentalContract rentalContract)
        {
            try
            {
                // Serializa o objeto RentalContract para JSON e envia via POST
                var response = await _httpClient.PostAsJsonAsync("api/rentalcontract", rentalContract);
                return response.IsSuccessStatusCode;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Erro ao adicionar contrato de locação: {ex.Message}");
                return false;
            }
        }

        public async Task<List<RentalContract>> GetAllRentalContractsAsync()
        {
            try
            {
                var contracts = await _httpClient.GetFromJsonAsync<List<RentalContract>>("api/rentalcontract");
                return contracts ?? new List<RentalContract>();
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Erro ao buscar contratos: {ex.Message}");
                return new List<RentalContract>();
            }
        }
    }
}
