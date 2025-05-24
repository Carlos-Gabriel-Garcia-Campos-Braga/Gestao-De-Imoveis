namespace GestaoImoveisAPI.OutputModels
{
    public class RentalContractOutputModel
    {
        public RenterOutputModel Renter { get; set; }
        public AdressOutputModel Adress { get; set; }
        public List<BillsOutputModel> Bills { get; set; }
        public DateTime StartContract { get; set; }
        public DateTime EndContract { get; set; }
        public decimal RentalValue { get; set; }
    }
}
