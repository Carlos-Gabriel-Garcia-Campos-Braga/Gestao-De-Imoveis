using GestaoImoveisAPI.Data;
using GestaoImoveisAPI.Models;
using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.AspNetCore.Identity.Data;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using SharedClasses.Models;
using SharedClasses.AuxiliarClasses;
using SharedClasses.OutputsDTOs;
using SharedClasses.InputDTOs;
using BCrypt.Net;
using SharedClasses.ValueObjects;

namespace GestaoImoveisAPI.Controller
{
    [ApiController]
    [Route("api/[controller]")]
    public class UserController : ControllerBase
    {
        private readonly AppDbContext _context;

        public UserController(AppDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<IActionResult> GetAll()
        {
            var user = _context.User.ToList();

            return Ok(user);
        }

        [HttpPost("register")]
        public async Task<IActionResult> Register([FromBody] UserInputModel userInput)
        {
            if (await _context.User.AnyAsync(u => u.Email.email == userInput.Email))
            {
                return BadRequest("E-mail ja esta em uso!");
            }

            var user = new User
            {
                Name = userInput.Name,
                Email = new Email(userInput.Email),
                Password = BCrypt.Net.BCrypt.HashPassword(userInput.Password)
            };

            _context.User.Add(user);
            await _context.SaveChangesAsync();

            return Ok("Usuario registrado!");
        }

        [HttpPost("login")]
        public async Task<IActionResult> Login([FromBody] SharedClasses.AuxiliarClasses.LoginRequest request)
        {
            //Busca o primeiro registro que possui que satisfaca a condicao
            var User = await _context.User.FirstOrDefaultAsync(u => u.Email.email == request.Email);

            if (User == null || !BCrypt.Net.BCrypt.Verify(request.Password, User.Password))
            {
                return Unauthorized("E-mail ou senha incorretos!");
            }

            var userOutput = new UserOutput {
                                              Id = User.Id,
                                              Name = User.Name,
                                              Email = User.Email.email 
                                            };

            return Ok(userOutput);
        }
    }
}