using System.ComponentModel.DataAnnotations;

namespace SharedClasses.InputDTOs
{
    public class CreateInvoiceInputModel
    {
        [Required(ErrorMessage = "Id do contrato é obrigatório.")]
        public int RentalContractId { get; set; }

        [Required(ErrorMessage = "Descrição é obrigatória.")]
        [StringLength(200, ErrorMessage = "Descrição não pode exceder 200 caracteres.")]
        public string Description { get; set; } = string.Empty;

        [Required(ErrorMessage = "Data de vencimento é obrigatória.")]
        public DateOnly DueDate { get; set; }

        [Required(ErrorMessage = "Valor é obrigatório.")]
        [Range(0.01, double.MaxValue, ErrorMessage = "Valor deve ser maior que zero.")]
        public decimal Amount { get; set; }
    }
}
