namespace SharedClasses.OutputsDTOs
{
    public class RentalContractOutputModel
    {
        public int Id { get; set; }
        public int PropertyId { get; set; }
        public RenterOutputModel Renter { get; set; } = new();
        public AdressOutputModel Adress { get; set; } = new();
        public List<BillsOutputModel> Bills { get; set; } = [];
        public DateTime StartContract { get; set; }
        public DateTime EndContract { get; set; }
        public decimal RentalValue { get; set; }
        public string PreferredIndex { get; set; } = string.Empty;
        public List<ReadjustmentOutputModel> ReadjustmentHistory { get; set; } = [];
        public DateTime? ArchivedAt { get; set; }
        public DateTime? TerminatedAt { get; set; }
        public string? TerminatedBy { get; set; }
    }
}
