using System.ComponentModel.DataAnnotations;

namespace SharedClasses.InputDTOs
{
    public class RefreshTokenInputModel
    {
        [Required(ErrorMessage = "Refresh token é obrigatório.")]
        public string RefreshToken { get; set; } = string.Empty;

        // O JWT expirado não pode ser re-validado pelo middleware (ValidateLifetime = true),
        // então o cliente envia o userId extraído na resposta do login.
        [Required(ErrorMessage = "UserId é obrigatório.")]
        public int UserId { get; set; }
    }
}
