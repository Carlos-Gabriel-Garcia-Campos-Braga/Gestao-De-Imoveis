using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MauiAppGestaoImoveis.Models
{
    public class Adress
    {
        public int Id { get; set; }
        public string Street { get; set; } 
        public string Number { get; set; }
        public string Complement { get; set; }
        public string Neighborhood { get; set; } 
        public string City { get; set; }
        public string State { get; set; }
        public string ZipCode { get; set; }

        public Adress() { }
        public Adress(string street, string number, string neighborhood, string city, string state, string zipCode, string complement)
        {
            Street = street;
            Number = number;
            Neighborhood = neighborhood;
            City = city;
            State = state;
            ZipCode = zipCode;
            Complement = complement;
        }

        public override string ToString()
        {
            return $"{Street}, {Number} - {Neighborhood}, {City} - {State}, {ZipCode}";
        }
    }
}
