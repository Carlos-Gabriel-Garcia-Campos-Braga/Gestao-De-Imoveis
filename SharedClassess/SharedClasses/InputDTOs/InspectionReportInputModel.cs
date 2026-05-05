using System.ComponentModel.DataAnnotations;

namespace SharedClasses.InputDTOs
{
    public class InspectionReportInputModel
    {
        [Required(ErrorMessage = "Tipo de vistoria é obrigatório. Valores aceitos: Entry, Exit.")]
        public string Type { get; set; } = string.Empty;

        [Required(ErrorMessage = "Nome do vistoriador é obrigatório.")]
        [StringLength(100, ErrorMessage = "Nome do vistoriador não pode exceder 100 caracteres.")]
        public string Inspector { get; set; } = string.Empty;

        [StringLength(2000, ErrorMessage = "Observações não podem exceder 2000 caracteres.")]
        public string? Notes { get; set; }
    }
}
