using System.ComponentModel.DataAnnotations;

namespace SharedClasses.InputDTOs
{
    public class RentalContractInputModel
    {
        // RENTER
        [Required(ErrorMessage = "Dados do inquilino são obrigatórios.")]
        public RenterInputModel Renter { get; set; } = new RenterInputModel();

        // ADRESS
        [Required(ErrorMessage = "Endereço é obrigatório.")]
        public AdressInputModel Adress { get; set; } = new AdressInputModel();

        // BILLS
        [Required(ErrorMessage = "Contas são obrigatórias.")]
        public ICollection<BillsInputModel> Bills { get; set; } = new List<BillsInputModel>();

        // CONTRATO
        [Required(ErrorMessage = "Data de início do contrato é obrigatória.")]
        public DateTime StartContract { get; set; }
        
        [Required(ErrorMessage = "Data de fim do contrato é obrigatória.")]
        public DateTime EndContract { get; set; }
        
        [Required(ErrorMessage = "Valor do aluguel é obrigatório.")]
        [Range(0.01, double.MaxValue, ErrorMessage = "Valor do aluguel deve ser maior que zero.")]
        public decimal RentalValue { get; set; }

        /// <summary>
        /// Índice de reajuste: IPCA, INPC ou IGPM. Padrão: IPCA.
        /// </summary>
        public string PreferredIndex { get; set; } = "IPCA";
    }
}
