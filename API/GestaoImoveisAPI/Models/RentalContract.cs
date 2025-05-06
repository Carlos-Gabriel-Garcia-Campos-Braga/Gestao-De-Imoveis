namespace GestaoImoveisAPI.Models
{
    public class RentalContract
    {
        public int Id { get; set; }

        //FK para Renter
        public int RenterId { get; set; }
        public Renter Renter { get; set; } = null!;

        //FK para Adress
        public int AdressId { get; set; }
        public Adress Adress { get; set; } = null!;

        public DateTime StartContract { get; set; }
        public DateTime EndContract { get; set; }
        public double RentalValue { get; set; }

        //Um imóvel pode ter várias contas, portanto, 1:N
        public ICollection<Bills> Bills { get; set; } = new List<Bills>();
    }
}
