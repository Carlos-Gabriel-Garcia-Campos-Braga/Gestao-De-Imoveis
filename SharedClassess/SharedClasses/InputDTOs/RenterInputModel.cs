using System.ComponentModel.DataAnnotations;

namespace SharedClasses.InputDTOs
{
    public class RenterInputModel
    {
        [Required(ErrorMessage = "O campo é obrigatório.")]
        [StringLength(100, ErrorMessage = "O nome não pode exceder 100 caracteres.")]
        public string Name { get; set; } = string.Empty;

        [Required(ErrorMessage = "O campo é obrigatório.")]
        [StringLength(11, ErrorMessage = "O CPF deve ter 11 caracteres.")]
        [RegularExpression(@"^\d{11}$", ErrorMessage = "O CPF deve conter apenas números.")]
        public string CPF { get; set; } = string.Empty;

        [Required(ErrorMessage = "O campo é obrigatório.")]
        [StringLength(15, ErrorMessage = "O telefone não pode exceder 15 caracteres.")]
        [RegularExpression(@"^\d{10,15}$", ErrorMessage = "O telefone deve conter entre 10 e 15 números.")]
        public string PhoneNumber { get; set; } = string.Empty;
    }
}
