using MauiAppGestaoImoveis.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Json;
using System.Text;
using System.Threading.Tasks;
using SharedClasses.Models;
using SharedClasses.AuxiliarClasses;
using SharedClasses.OutputsDTOs;
using SharedClasses.InputDTOs;

namespace MauiAppGestaoImoveis.Services
{
    public class UserService
    {
        private readonly HttpClient _httpClient;

        public UserService()
        {
            _httpClient = new HttpClient
            {
                //BaseAddress = new Uri("https://gestaoapi.onrender.com/")
                BaseAddress = new Uri("http://localhost:5156/")
            };
        }

        public async Task<User> GetUsers()
        {
            var users = await _httpClient.GetFromJsonAsync<User>("api/user");

            return users;
        }

        public async Task<string> RegisterAsync(UserInputModel userInput)
        {
            try
            {
                var response = await _httpClient.PostAsJsonAsync("api/user/register", userInput);
                var payload = await response.Content.ReadAsStringAsync();

                if (response.IsSuccessStatusCode)
                {
                    return "Sucess";
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

        public async Task<UserOutput> LoginAsync(string email, string password)
        {
            var loginRequest = new LoginRequest { Email = email, Password = password };
            var response = await _httpClient.PostAsJsonAsync("api/user/login", loginRequest);

            if (response.IsSuccessStatusCode)
            {
                var user = await response.Content.ReadFromJsonAsync<UserOutput>();
                return user;
            }
            else
            {
                throw new Exception("Login invalido!");
            }
        }

        public async Task<string> ResetPassword(UserInputModel user)
        {
            if (string.IsNullOrWhiteSpace(user?.Password))
            {
                throw new ArgumentException("Senha inválida.");
            }

            var request = new HttpRequestMessage(HttpMethod.Patch, "api/user/reset")
            {
                Content = JsonContent.Create(new ResetPasswordInputModel { Email = user.Email, Password = user.Password })
            };

            var response = await _httpClient.SendAsync(request);

            var payload = await response.Content.ReadAsStringAsync();
            if (response.IsSuccessStatusCode)
            {
                return string.IsNullOrWhiteSpace(payload) ? "Senha alterada com sucesso" : payload;
            }

            throw new Exception($"Erro {response.StatusCode}: {payload}");
        }
    }
}
