using System.ComponentModel.DataAnnotations;

namespace SharedClasses.InputDTOs
{
    public class RegisterPaymentInputModel
    {
        [Required(ErrorMessage = "Valor pago é obrigatório.")]
        [Range(0.01, double.MaxValue, ErrorMessage = "Valor pago deve ser maior que zero.")]
        public decimal AmountPaid { get; set; }

        /// <summary>
        /// Meio de pagamento: PIX, Transferência, Dinheiro, etc. Padrão: PIX.
        /// </summary>
        public string PaymentMethod { get; set; } = "PIX";
    }
}
