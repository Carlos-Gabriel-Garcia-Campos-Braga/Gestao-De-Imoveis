using GestaoImoveisAPI.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using SharedClasses.Models;

namespace GestaoImoveisAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    [Authorize]
    public class AddressController : ControllerBase
    {
        private readonly AddressService _addressService;

        public AddressController(AddressService addressService)
        {
            _addressService = addressService;
        }

        [HttpGet("{cep}")]
        public async Task<ActionResult<ViaCepResponse>> GetAdress([FromRoute] string cep)
        {
            var address = await _addressService.GetAddressByZipCode(cep);

            if (address == null || address.Erro)
            {
                return NotFound(new { message = "CEP não encontrado!" });
            }

            return Ok(address);
        }
    }
}
