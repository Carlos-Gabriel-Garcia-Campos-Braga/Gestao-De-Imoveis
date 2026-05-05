using GestaoImoveisAPI.Domain.Identity.Repositories;
using GestaoImoveisAPI.TokenService;
using SharedClasses.InputDTOs;
using SharedClasses.OutputsDTOs;

namespace GestaoImoveisAPI.Application.Identity.RefreshToken
{
    public class RefreshTokenHandler
    {
        private readonly IUserRepository _repository;
        private readonly JwtTokenService _tokenService;

        public RefreshTokenHandler(IUserRepository repository, JwtTokenService tokenService)
        {
            _repository = repository;
            _tokenService = tokenService;
        }

        public async Task<LoginResponse> HandleAsync(
            int userId,
            RefreshTokenInputModel input,
            CancellationToken ct = default)
        {
            var user = await _repository.GetByIdAsync(userId, ct)
                ?? throw new KeyNotFoundException("Usuário não encontrado.");

            if (!user.ValidateRefreshToken(input.RefreshToken))
                throw new UnauthorizedAccessException("Refresh token inválido ou expirado.");

            // Rotação: invalida o token atual e emite um novo par
            var (accessToken, accessExpiresAt) = _tokenService.GenerateAccessToken(user.Id, user.Email.Value);
            var (newRefreshToken, refreshExpiresAt) = _tokenService.GenerateRefreshToken();

            user.SetRefreshToken(newRefreshToken, refreshExpiresAt);
            await _repository.SaveChangesAsync(ct);

            return new LoginResponse
            {
                User = new UserOutput { Id = user.Id, Name = user.Name, Email = user.Email.Value },
                AccessToken = accessToken,
                RefreshToken = newRefreshToken,
                AccessTokenExpiresAt = accessExpiresAt,
                RefreshTokenExpiresAt = refreshExpiresAt
            };
        }
    }
}
