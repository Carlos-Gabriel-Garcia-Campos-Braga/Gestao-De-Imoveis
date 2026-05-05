using System.ComponentModel.DataAnnotations;

namespace SharedClasses.InputDTOs
{
    public class PropertyInputModel
    {
        [Required(ErrorMessage = "Descrição do imóvel é obrigatória.")]
        [StringLength(200, ErrorMessage = "Descrição não pode exceder 200 caracteres.")]
        public string Description { get; set; } = string.Empty;

        [Required(ErrorMessage = "Tipo do imóvel é obrigatório.")]
        public string Type { get; set; } = string.Empty;

        [Required(ErrorMessage = "Endereço é obrigatório.")]
        public AdressInputModel Address { get; set; } = new();
    }
}
