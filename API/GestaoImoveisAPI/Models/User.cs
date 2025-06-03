using SharedClasses.ValueObjects;
using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;

namespace GestaoImoveisAPI.Models
{
    public class User
    {
        [Required]
        [Key]
        public int Id { get; set; }
        [Required]
        public string Name { get; set; }
        [Required]
        public Email Email { get; set; }
        [Required]
        public string Password { get; set; }
    }
}