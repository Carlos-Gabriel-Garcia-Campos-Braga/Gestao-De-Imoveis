using GestaoImoveisAPI.Data;
using SharedClasses.InputDTOs;
using GestaoImoveisAPI.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using SharedClasses.OutputsDTOs;
using GestaoImoveisAPI.Interfaces;
using SharedClasses.ValueObjects;

namespace GestaoImoveisAPI.Repositories
{

    public class RentalContractRepository : IRentalContract
    {
        private readonly AppDbContext _context;

        public RentalContractRepository(AppDbContext context)
        {
            _context = context;
        }

        public async Task<RentalContract> createContract(RentalContractInputModel rc)
        {
            // Primeiro salvamos o Renter e o Adress
            var renter = new Renter
            {
                Name = rc.Renter.Name,
                CPF = new CPF(rc.Renter.CPF),
                PhoneNumber = new PhoneNumber(rc.Renter.PhoneNumber)
            };

            _context.Renter.Add(renter);
            await _context.SaveChangesAsync();

            var adress = new Adress(
                    rc.Adress.Street,
                    rc.Adress.Complement,
                    rc.Adress.Number,
                    rc.Adress.Neighborhood,
                    rc.Adress.City,
                    rc.Adress.State,
                    rc.Adress.ZipCode);

            var bills = rc.Bills.Select(b => new Bills
            {
                Type = b.Type,
                ValidationDate = b.ValidationDate,
                Value = new Money(b.Value)
            }).
              ToList();

            var rentalContract = new RentalContract
            {
                StartContract = rc.StartContract,
                EndContract = rc.EndContract,
                RentalValue = new Money(rc.RentalValue),
                Adress = adress,
                RenterId = renter.Id,
                Bills = bills
            };



            _context.Contract.Add(rentalContract);
            // Agora salva o contrato com os IDs corretos
            await _context.SaveChangesAsync();

            return rentalContract;
        }

        public List<RentalContract> getContract()
        {
            return _context.Contract.ToList();
        }
    }
}