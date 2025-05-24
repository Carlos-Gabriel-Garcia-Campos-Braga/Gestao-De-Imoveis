namespace GestaoImoveisAPI.DTOs
{
    public class RentalContractInputModel
    {
        // RENTER
        public RenterInputModel Renter { get; set; } = new RenterInputModel();

        // ADRESS
        public AdressInputModel Adress { get; set; } = new AdressInputModel();

        // BILLS
        public ICollection<BillsInputModel> Bills { get; set; }

        // CONTRATO
        public DateTime StartContract { get; set; }
        public DateTime EndContract { get; set; }
        public decimal RentalValue { get; set; }
    }
}
