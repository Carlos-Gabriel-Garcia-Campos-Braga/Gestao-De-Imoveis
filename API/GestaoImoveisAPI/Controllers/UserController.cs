using GestaoImoveisAPI.Application.Identity.ChangePassword;
using GestaoImoveisAPI.Application.Identity.Login;
using GestaoImoveisAPI.Application.Identity.RefreshToken;
using GestaoImoveisAPI.Application.Identity.Register;
using GestaoImoveisAPI.Domain.Identity.Repositories;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.RateLimiting;
using SharedClasses.AuxiliarClasses;
using SharedClasses.InputDTOs;
using SharedClasses.OutputsDTOs;
using System.Security.Claims;

namespace GestaoImoveisAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    [Authorize]
    public class UserController : ControllerBase
    {
        private readonly IUserRepository _repository;
        private readonly RegisterUserHandler _registerHandler;
        private readonly LoginHandler _loginHandler;
        private readonly RefreshTokenHandler _refreshHandler;
        private readonly ChangePasswordHandler _changePasswordHandler;

        public UserController(
            IUserRepository repository,
            RegisterUserHandler registerHandler,
            LoginHandler loginHandler,
            RefreshTokenHandler refreshHandler,
            ChangePasswordHandler changePasswordHandler)
        {
            _repository = repository;
            _registerHandler = registerHandler;
            _loginHandler = loginHandler;
            _refreshHandler = refreshHandler;
            _changePasswordHandler = changePasswordHandler;
        }

        [HttpGet]
        public async Task<IActionResult> GetAll(CancellationToken ct)
        {
            var users = await _repository.GetAllAsync(ct);
            return Ok(users.Select(u => new UserOutput
            {
                Id = u.Id,
                Name = u.Name,
                Email = u.Email.Value
            }));
        }

        [HttpPost("register")]
        [AllowAnonymous]
        public async Task<IActionResult> Register([FromBody] UserInputModel input, CancellationToken ct)
        {
            var output = await _registerHandler.HandleAsync(input, ct);
            return Ok(output);
        }

        [HttpPost("login")]
        [AllowAnonymous]
        [EnableRateLimiting("login")]
        public async Task<IActionResult> Login([FromBody] LoginRequest request, CancellationToken ct)
        {
            var response = await _loginHandler.HandleAsync(request, ct);
            return Ok(response);
        }

        [HttpPost("refresh")]
        [AllowAnonymous]
        public async Task<IActionResult> Refresh([FromBody] RefreshTokenInputModel input, CancellationToken ct)
        {
            var response = await _refreshHandler.HandleAsync(input.UserId, input, ct);
            return Ok(response);
        }

        [HttpPatch("password")]
        public async Task<IActionResult> ChangePassword(
            [FromBody] ChangePasswordInputModel input,
            CancellationToken ct)
        {
            var userIdClaim = User.FindFirstValue(ClaimTypes.NameIdentifier)
                ?? User.FindFirstValue("sub");

            if (!int.TryParse(userIdClaim, out var userId))
                return Unauthorized("Token inválido.");

            await _changePasswordHandler.HandleAsync(userId, input, ct);
            return NoContent();
        }
    }
}
