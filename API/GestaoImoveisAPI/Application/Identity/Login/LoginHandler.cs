using GestaoImoveisAPI.Domain.Identity.Repositories;
using GestaoImoveisAPI.TokenService;
using SharedClasses.AuxiliarClasses;
using SharedClasses.OutputsDTOs;

namespace GestaoImoveisAPI.Application.Identity.Login
{
    public class LoginHandler
    {
        private readonly IUserRepository _repository;
        private readonly JwtTokenService _tokenService;

        public LoginHandler(IUserRepository repository, JwtTokenService tokenService)
        {
            _repository = repository;
            _tokenService = tokenService;
        }

        public async Task<LoginResponse> HandleAsync(LoginRequest request, CancellationToken ct = default)
        {
            var user = await _repository.GetByEmailAsync(request.Email, ct)
                ?? throw new UnauthorizedAccessException("E-mail ou senha incorretos.");

            if (!user.VerifyPassword(request.Password))
                throw new UnauthorizedAccessException("E-mail ou senha incorretos.");

            var (accessToken, accessExpiresAt) = _tokenService.GenerateAccessToken(user.Id, user.Email.Value);
            var (refreshToken, refreshExpiresAt) = _tokenService.GenerateRefreshToken();

            user.SetRefreshToken(refreshToken, refreshExpiresAt);
            await _repository.SaveChangesAsync(ct);

            return new LoginResponse
            {
                User = new UserOutput { Id = user.Id, Name = user.Name, Email = user.Email.Value },
                AccessToken = accessToken,
                RefreshToken = refreshToken,
                AccessTokenExpiresAt = accessExpiresAt,
                RefreshTokenExpiresAt = refreshExpiresAt
            };
        }
    }
}
