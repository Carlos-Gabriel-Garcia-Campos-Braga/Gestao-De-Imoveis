namespace SharedClasses.OutputsDTOs
{
    public class BillsOutputModel
    {
        public int Id { get; set; }
        public int? RentalContractId { get; set; }
        public string Type { get; set; } = string.Empty;
        public DateTime ValidationDate { get; set; }
        public decimal Value { get; set; }
    }
}
