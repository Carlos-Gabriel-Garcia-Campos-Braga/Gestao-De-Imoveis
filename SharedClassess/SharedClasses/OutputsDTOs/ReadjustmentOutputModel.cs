namespace SharedClasses.OutputsDTOs
{
    public class ReadjustmentOutputModel
    {
        public int ContractId { get; set; }
        public string Index { get; set; } = string.Empty;
        public decimal Rate { get; set; }
        public decimal OldValue { get; set; }
        public decimal NewValue { get; set; }
        public DateTime AppliedAt { get; set; }
    }
}
