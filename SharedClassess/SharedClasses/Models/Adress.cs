using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SharedClasses.Models
{
    public class Address
    {
        public string Street { get; }
        public string Number { get; }
        public string Complement { get; }
        public string Neighborhood { get; }
        public string City { get; }
        public string State { get; }
        public string ZipCode { get; }

        public Address(string street, string number, string neighborhood, string city, string state, string zipCode)
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
        }

        public override string ToString() =>
            $"{Street}, {Number} - {Neighborhood}, {City}/{State} - CEP: {ZipCode}";

        public override bool Equals(object obj) =>
            obj is Address other &&
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
