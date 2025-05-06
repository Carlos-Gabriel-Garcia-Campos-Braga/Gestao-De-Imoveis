using System.ComponentModel.DataAnnotations;

namespace GestaoImoveisAPI.Models
{
    public class Adress
    {
        //PK
        [Key]
        public int Id;

        [Required]
        public string Street { get; set; } = string.Empty;

        [Required]
        public string Number { get; set; } = string.Empty;

        [Required]
        public string Neighborhood { get; set; } = string.Empty;
        public string Complement { get; set; }
        [Required]
        public string City { get; set; } = string.Empty;

        [Required]
        public string State { get; set; } = string.Empty;

        [Required]
        [MaxLength(8)]
        public string ZipCode { get; set; } = string.Empty;

        public RentalContract RentalContract { get; set; }
    }
}
