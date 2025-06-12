using GestaoImoveisAPI.Data;
using GestaoImoveisAPI.Models;
using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.AspNetCore.Identity.Data;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using SharedClasses.Models;
using SharedClasses.AuxiliarClasses;
using SharedClasses.OutputsDTOs;

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

        [HttpPost("login")]
        public async Task<IActionResult> Login([FromBody] SharedClasses.AuxiliarClasses.LoginRequest request)
        {
            //Busca o primeiro registro que possui que satisfaca a condicao
            var User = await _context.User.FirstOrDefaultAsync(u => u.Email.email == request.Email);

            if (User == null || User.Password != request.Password)
            {
                return Unauthorized("E-mail ou senha incorretos!");
            }

            var userOutput = new UserOutput { Id = User.Id,
                                              Name = User.Name,
                                              Email = User.Email.email 
                                            };

            return Ok(userOutput);

        }
    }
}