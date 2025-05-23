using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SharedClasses.ValueObjects
{
    public class Adress
    {
        public string Street { get; private set; }
        public string Number { get; private set; }
        public string Complement { get; private set; }
        public string Neighborhood { get; private set; }
        public string City { get; private set; }
        public string State { get; private set; }
        public string ZipCode { get; private set; }

        public Adress() { }

        public Adress(string street, string complement, string number, string neighborhood, string city, string state, string zipCode)
        {
            if (string.IsNullOrWhiteSpace(street)) throw new ArgumentException("Rua não pode ser vazia.");
            if (string.IsNullOrWhiteSpace(number)) throw new ArgumentException("Número não pode ser vazio.");
            if (string.IsNullOrWhiteSpace(city)) throw new ArgumentException("Cidade não pode ser vazia.");
            if (string.IsNullOrWhiteSpace(state)) throw new ArgumentException("Estado não pode ser vazio.");
            if (string.IsNullOrWhiteSpace(zipCode)) throw new ArgumentException("CEP não pode ser vazio.");

            Street = street;
            Number = number;
            Neighborhood = neighborhood;
            City = city;
            State = state;
            ZipCode = zipCode;
            Complement = complement;
        }
        public Adress(string street, string number, string neighborhood, string city, string state, string zipCode)
        {
            if (string.IsNullOrWhiteSpace(street)) throw new ArgumentException("Rua não pode ser vazia.");
            if (string.IsNullOrWhiteSpace(number)) throw new ArgumentException("Número não pode ser vazio.");
            if (string.IsNullOrWhiteSpace(city)) throw new ArgumentException("Cidade não pode ser vazia.");
            if (string.IsNullOrWhiteSpace(state)) throw new ArgumentException("Estado não pode ser vazio.");
            if (string.IsNullOrWhiteSpace(zipCode)) throw new ArgumentException("CEP não pode ser vazio.");

            Street = street;
            Number = number;
            Neighborhood = neighborhood;
            City = city;
            State = state;
            ZipCode = zipCode;
            Complement = "Sem complemento";
        }

        public override string ToString() =>
            $"{Street}, {Number} - {Neighborhood}, {City}/{State} - CEP: {ZipCode}";

        public override bool Equals(object obj) =>
            obj is Adress other &&
            Street == other.Street &&
            Number == other.Number &&
            Neighborhood == other.Neighborhood &&
            City == other.City &&
            State == other.State &&
            ZipCode == other.ZipCode;

        public override int GetHashCode() =>
            HashCode.Combine(Street, Number, Neighborhood, City, State, ZipCode);
    }

}
