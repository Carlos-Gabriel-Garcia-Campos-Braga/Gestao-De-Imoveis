namespace GestaoImoveisAPI.Models
{
    public class Renter
    {
        //PK
        public int Id { get; set; }
        public string Name { get; set; } = string.Empty;
        public string CPF { get; set; } = string.Empty;
        public string PhoneNumber { get; set; } = string.Empty;

        //Para entendermos, um inquilino pode ter vários contratos, 1:N
        public ICollection<RentalContract> Contracts { get; set; } = new List<RentalContract>();
    }
}
