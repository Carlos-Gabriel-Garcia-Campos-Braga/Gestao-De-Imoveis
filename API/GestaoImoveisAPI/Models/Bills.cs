using System.ComponentModel.DataAnnotations;

namespace GestaoImoveisAPI.Models
{
    public class Bills
    {
        //PK
        [Key]
        public int Id { get; set; }

        [Required]
        public string Type { get; set; } = string.Empty;

        [Required]
        public DateTime ValidationDate { get; set; }

        [Required]
        public double Value { get; set; }

        //FK para RentalContract
        public int RentalContractId { get; set; }
        public RentalContract RentalContract { get; set; } = null!;
    }
}
