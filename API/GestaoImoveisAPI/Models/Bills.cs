namespace GestaoImoveisAPI.Models
{
    public class Bills
    { 
        //PK
        public int Id { get; set; }                
        public string Type { get; set; } = string.Empty;
        public DateTime ValidationDate { get; set; }
        public double Value { get; set; }

        //FK para RentalContract
        public int RentalContractId { get; set; }
        public RentalContract RentalContract { get; set; } = null!;
    }
}
