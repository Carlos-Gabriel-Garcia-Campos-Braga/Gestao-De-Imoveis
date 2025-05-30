using SharedClasses.Models;
using SharedClasses.ValueObjects;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Json;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;

namespace MauiAppGestaoImoveis.Services
{
    public class AddressService
    {
        private readonly HttpClient _httpClient;

        public AddressService()
        {
            _httpClient = new HttpClient
            {
                BaseAddress = new Uri("http://localhost:5156/")
            };
        }

        public async Task<ViaCepResponse> GetAddressByZipCode(string zipCode)
        {
            var url = $"http://localhost:5156/api/address/{zipCode}";
            var response = await _httpClient.GetAsync(url);

            if (!response.IsSuccessStatusCode)
            {
                return null;
            }

            var content = await response.Content.ReadAsStringAsync();

            var address = JsonSerializer.Deserialize<ViaCepResponse>(content, new JsonSerializerOptions
            {
                PropertyNameCaseInsensitive = true
            });

            return address;
        }
    }
}
