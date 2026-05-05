using System.ComponentModel.DataAnnotations;

namespace SharedClasses.InputDTOs
{
    public class UpdatePropertyStatusInputModel
    {
        [Required(ErrorMessage = "Status é obrigatório.")]
        public string Status { get; set; } = string.Empty;
    }
}
