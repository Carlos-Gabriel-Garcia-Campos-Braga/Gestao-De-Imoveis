using System.ComponentModel.DataAnnotations;

namespace SharedClasses.InputDTOs
{
    public class RentalContractInputModel
    {
        [Required(ErrorMessage = "Dados do inquilino são obrigatórios.")]
        public RenterInputModel Renter { get; set; } = new RenterInputModel();

        [Required(ErrorMessage = "Imóvel é obrigatório.")]
        [Range(1, int.MaxValue, ErrorMessage = "PropertyId inválido.")]
        public int PropertyId { get; set; }

        public ICollection<BillsInputModel> Bills { get; set; } = [];

        [Required(ErrorMessage = "Data de início do contrato é obrigatória.")]
        public DateTime StartContract { get; set; }

        [Required(ErrorMessage = "Data de fim do contrato é obrigatória.")]
        public DateTime EndContract { get; set; }

        [Required(ErrorMessage = "Valor do aluguel é obrigatório.")]
        [Range(0.01, double.MaxValue, ErrorMessage = "Valor do aluguel deve ser maior que zero.")]
        public decimal RentalValue { get; set; }

        public string PreferredIndex { get; set; } = "IPCA";
    }
}
