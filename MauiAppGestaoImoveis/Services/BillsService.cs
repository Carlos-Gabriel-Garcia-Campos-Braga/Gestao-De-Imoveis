using MauiAppGestaoImoveis.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Json;
using System.Text;
using System.Threading.Tasks;

namespace MauiAppGestaoImoveis.Services
{
    public class BillsService
    {
        private readonly HttpClient _httpClient;

        public BillsService()
        {
            _httpClient = new HttpClient
            {
                BaseAddress = new Uri("http://localhost:5156/")
            };
        }

        public async Task<bool> AddBillsAsync(Bills bills)
        {
            try
            {
                var response = await _httpClient.PostAsJsonAsync("api/bills", bills);
                return response.IsSuccessStatusCode;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Erro ao adicionar contas: {ex.Message}");
                return false;
            }
        }

        public async Task<List<Bills>> GetAllBillsAsync()
        {
            try
            {
                var bills = await _httpClient.GetFromJsonAsync<List<Bills>>("api/bills");
                return bills ?? new List<Bills>();
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Erro ao buscar contas: {ex.Message}");
                return new List<Bills>();
            }
        }
    }
}
