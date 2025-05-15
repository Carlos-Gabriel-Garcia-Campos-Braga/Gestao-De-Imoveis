using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

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
        public decimal Value { get; set; }

        //FK para RentalContract
        [ForeignKey("RentalContractId")]
        public int? RentalContractId { get; set; }
        public RentalContract? RentalContract { get; set; }
    }
}
