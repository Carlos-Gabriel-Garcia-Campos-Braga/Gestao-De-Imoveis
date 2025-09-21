using GestaoImoveisAPI.Data;
using SharedClasses.InputDTOs;
using GestaoImoveisAPI.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using SharedClasses.OutputsDTOs;


namespace GestaoImoveisAPI.Interfaces
{
    public interface IRentalContract
    {
        Task<RentalContract> createContract(RentalContractInputModel rentalContract);
        List<RentalContract> getContract();
    }
}