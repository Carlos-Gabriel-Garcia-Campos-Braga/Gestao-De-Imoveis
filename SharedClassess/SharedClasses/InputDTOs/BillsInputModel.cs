using System.ComponentModel.DataAnnotations;

namespace SharedClasses.InputDTOs
{
    public class BillsInputModel
    {
        [Required(ErrorMessage = "ID do contrato é obrigatório.")]
        [Range(1, int.MaxValue, ErrorMessage = "ID do contrato inválido.")]
        public int RentalContractId { get; set; }

        [Required(ErrorMessage = "Tipo da conta é obrigatório.")]
        public string Type { get; set; } = string.Empty;

        [Required(ErrorMessage = "Data de vencimento é obrigatória.")]
        public DateTime ValidationDate { get; set; }

        [Required(ErrorMessage = "Valor da conta é obrigatório.")]
        [Range(0.01, double.MaxValue, ErrorMessage = "Valor da conta deve ser maior que zero.")]
        public decimal Value { get; set; }
    }
}
