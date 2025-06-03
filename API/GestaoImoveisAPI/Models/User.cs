using SharedClasses.ValueObjects;
using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;

namespace GestaoImoveisAPI.Models
{
    public class User
    {
        public string Name;
        public Email Email;
        
    }
}