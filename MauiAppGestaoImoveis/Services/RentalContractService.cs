using MauiAppGestaoImoveis.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Json;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using SharedClasses.InputDTOs;
using SharedClasses.OutputsDTOs;

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
                BaseAddress = new Uri("http://localhost:5156/")
            };
        }

        public async Task<string> AddRentalContractAsync(RentalContractInputModel rentalContract)
        {
            try
            {
                //log do JSON
                Console.WriteLine("JSON ENVIADO");
                Console.WriteLine(JsonSerializer.Serialize(rentalContract));

                // Serializa o objeto RentalContract para JSON e envia via POST
                var response = await _httpClient.PostAsJsonAsync("api/rentalcontract", rentalContract);
                var payload = await response.Content.ReadAsStringAsync();

                if(response.IsSuccessStatusCode) 
                {
                    return "Success";
                }
                else
                {
                    return $"HTTP {(int)response.StatusCode} {response.StatusCode}: {payload}";
                }
            }
            catch (Exception ex)
            {
                return $"Erro ao adicionar contrato de locação: {ex.Message}";
            }
        }

        public async Task<List<RentalContractOutputModel>> GetAllRentalContractsAsync()
        {
            try
            {
                var contracts = await _httpClient.GetFromJsonAsync<List<RentalContractOutputModel>>("api/rentalcontract");
                return contracts ?? new List<RentalContractOutputModel>();
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Erro ao buscar contratos: {ex.Message}");
                return new List<RentalContractOutputModel>();
            }
        }

        public async Task<List<RenterBillsGroup>> GetAllRentalContractsBillsAsync()
        {
            try
            {
                var contracts = await _httpClient.GetFromJsonAsync<List<RentalContractOutputModel>>("api/rentalcontract");

                var AllBills = contracts.
                    Where(c => c.Renter != null && c.Bills != null)
                    .Select(c => new RenterBillsGroup
                    {
                        Renter = c.Renter,
                        Bills = c.Bills.Select
                        (b => new BillsOutputModel
                        {
                            Type = b.Type,
                            Value = b.Value,
                            ValidationDate = b.ValidationDate
                        }).ToList()
                    })
                    .ToList();

                return AllBills;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Erro ao buscar as contas: {ex.Message}");
                return new List<RenterBillsGroup>();
            }
        }

        public async Task<List<DelayedBillsRenter>> GetAllRentalContractsDelayedBillsAsync()
        {
            var contracts = await _httpClient.GetFromJsonAsync<List<RentalContractOutputModel>>("api/rentalcontract");

            var delayedBills = contracts.
                Where(d => d.Renter != null && d.Bills != null)
                .Select(d => new DelayedBillsRenter
                {
                    Renter = d.Renter,
                    DelayedBills = d.Bills
                    .Where(b => b.ValidationDate < DateTime.Now)
                    .Select(c => new BillsOutputModel
                    {
                        Type= c.Type,
                        Value = c.Value,
                        ValidationDate = c.ValidationDate
                    }).ToList()
                }).ToList();

            return delayedBills;
        }
    }
}
