using GestaoImoveisAPI.Domain.Identity.Repositories;
using SharedClasses.InputDTOs;

namespace GestaoImoveisAPI.Application.Identity.ChangePassword
{
    public class ChangePasswordHandler
    {
        private readonly IUserRepository _repository;

        public ChangePasswordHandler(IUserRepository repository)
        {
            _repository = repository;
        }

        public async Task HandleAsync(int userId, ChangePasswordInputModel input, CancellationToken ct = default)
        {
            var user = await _repository.GetByIdAsync(userId, ct)
                ?? throw new KeyNotFoundException("Usuário não encontrado.");

            // ChangePassword valida senha atual, aplica BCrypt e invalida refresh tokens
            user.ChangePassword(input.CurrentPassword, input.NewPassword);
            await _repository.SaveChangesAsync(ct);
        }
    }
}
