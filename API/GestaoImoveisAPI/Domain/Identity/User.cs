using GestaoImoveisAPI.Domain.Shared;
using SharedClasses.ValueObjects;

namespace GestaoImoveisAPI.Domain.Identity
{
    public sealed class User : Entity
    {
        public string Name { get; private set; } = string.Empty;
        public Email Email { get; private set; } = null!;
        public string PasswordHash { get; private set; } = string.Empty;

        // Refresh token rotativo — token anterior é invalidado a cada renovação
        public string? RefreshToken { get; private set; }
        public DateTime? RefreshTokenExpiresAt { get; private set; }

        private User() { } // EF Core

        public static User Create(string name, string email, string plainPassword)
        {
            if (string.IsNullOrWhiteSpace(name))
                throw new ArgumentException("Nome do usuário não pode ser vazio.");

            if (string.IsNullOrWhiteSpace(plainPassword) || plainPassword.Length < 6)
                throw new ArgumentException("Senha deve ter pelo menos 6 caracteres.");

            return new User
            {
                Name = name.Trim(),
                Email = new Email(email),
                PasswordHash = BCrypt.Net.BCrypt.HashPassword(plainPassword, 12)
            };
        }

        public bool VerifyPassword(string plainPassword) =>
            BCrypt.Net.BCrypt.Verify(plainPassword, PasswordHash);

        public void ChangePassword(string currentPlainPassword, string newPlainPassword)
        {
            if (!VerifyPassword(currentPlainPassword))
                throw new UnauthorizedAccessException("Senha atual incorreta.");

            if (string.IsNullOrWhiteSpace(newPlainPassword) || newPlainPassword.Length < 6)
                throw new ArgumentException("Nova senha deve ter pelo menos 6 caracteres.");

            PasswordHash = BCrypt.Net.BCrypt.HashPassword(newPlainPassword, 12);

            // Invalida sessões abertas ao trocar a senha
            RefreshToken = null;
            RefreshTokenExpiresAt = null;
        }

        public void SetRefreshToken(string token, DateTime expiresAt)
        {
            RefreshToken = token;
            RefreshTokenExpiresAt = expiresAt;
        }

        public bool ValidateRefreshToken(string providedToken) =>
            RefreshToken != null &&
            RefreshToken == providedToken &&
            RefreshTokenExpiresAt > DateTime.UtcNow;

        public void InvalidateRefreshToken()
        {
            RefreshToken = null;
            RefreshTokenExpiresAt = null;
        }
    }
}
