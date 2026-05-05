using System.ComponentModel.DataAnnotations;

namespace SharedClasses.InputDTOs
{
    public class CreatePropertyFromCepInputModel
    {
        [Required(ErrorMessage = "Descrição do imóvel é obrigatória.")]
        [StringLength(200, ErrorMessage = "Descrição não pode exceder 200 caracteres.")]
        public string Description { get; set; } = string.Empty;

        [Required(ErrorMessage = "Tipo do imóvel é obrigatório.")]
        public string Type { get; set; } = string.Empty;

        [Required(ErrorMessage = "CEP é obrigatório.")]
        [RegularExpression(@"^\d{5}-?\d{3}$", ErrorMessage = "CEP inválido. Use o formato 00000-000 ou 00000000.")]
        public string ZipCode { get; set; } = string.Empty;

        public string? Number { get; set; }

        public string? Complement { get; set; }
    }
}
