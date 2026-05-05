using GestaoImoveisAPI.Domain.Identity;
using GestaoImoveisAPI.Domain.Identity.Repositories;
using SharedClasses.InputDTOs;
using SharedClasses.OutputsDTOs;

namespace GestaoImoveisAPI.Application.Identity.Register
{
    public class RegisterUserHandler
    {
        private readonly IUserRepository _repository;

        public RegisterUserHandler(IUserRepository repository)
        {
            _repository = repository;
        }

        public async Task<UserOutput> HandleAsync(UserInputModel input, CancellationToken ct = default)
        {
            if (await _repository.EmailExistsAsync(input.Email, ct))
                throw new InvalidOperationException("E-mail já está em uso.");

            var user = User.Create(input.Name, input.Email, input.Password);
            await _repository.AddAsync(user, ct);
            await _repository.SaveChangesAsync(ct);

            return new UserOutput { Id = user.Id, Name = user.Name, Email = user.Email.Value };
        }
    }
}
