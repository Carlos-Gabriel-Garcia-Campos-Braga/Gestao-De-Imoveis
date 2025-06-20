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

namespace MauiAppGestaoImoveis.Services
{
    public class UserService
    {
        private readonly HttpClient _httpClient;

        public UserService()    
        {
            _httpClient = new HttpClient
            {
                BaseAddress = new Uri("https://gestaoapi.onrender.com/")
            };
        }

        public async Task<User> GetUsers()
        {
            var users = await _httpClient.GetFromJsonAsync<User>("api/user");

            return users;
        }

        public async Task<UserOutput> LoginAsync(string email, string password)
        {
            var loginRequest = new LoginRequest {Email = email, Password = password};
            var response = await _httpClient.PostAsJsonAsync("api/user/login", loginRequest);

            if(response.IsSuccessStatusCode)
            {
                var user = await response.Content.ReadFromJsonAsync<UserOutput>();
                return user;
            }
            else
            {
                throw new Exception("Login invalido!");
            }
        }
    }
}
