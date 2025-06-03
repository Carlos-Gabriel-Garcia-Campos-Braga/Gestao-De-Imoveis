using GestaoImoveisAPI.Data;

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
            var user = _context.User.
                                    Include(u => u.user);

            return Ok(user);
        }
    }
}