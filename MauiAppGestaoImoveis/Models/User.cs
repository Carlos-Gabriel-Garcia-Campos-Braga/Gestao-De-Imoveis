
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MauiAppGestaoImoveis.Models
{
    internal class User
    {
        public string Name;
        private string Email;
        private string Password;

        public User(string name)
        {
            this.Name = name;
            Email = "carlosgabrielbraga035@gmail.com";
            Password = "123456";
        }

        public User(string name, string email, string password) : this(name)
        {
            Email = email;
            Password = password;
        }

        public override string ToString()
        {
            return $"Nome: {Name}" +
                   $"\nE-mail: {Email}" +
                   $"\nSenha: {Password}";
        }


        public string getName
        {
            get
            {
                return Name;
            }
        }
        public string getEmail
        {
            get
            {
                return Email;
            }
        }
        public string getPassword
        {
            get
            {
                return Password;
            }
        }
    }
}
