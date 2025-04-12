
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

        public override string ToString()
        {
            return $"Name: {Name}";
        }

        public string getEmail()
        {
            return Email;
        }

        public string getPassword()
        {
            return Password;
        }
    }
}
