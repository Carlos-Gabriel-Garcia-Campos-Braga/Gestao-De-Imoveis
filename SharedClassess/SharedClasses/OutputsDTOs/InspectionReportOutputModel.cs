namespace SharedClasses.OutputsDTOs
{
    public class InspectionReportOutputModel
    {
        public int Id { get; set; }
        public int PropertyId { get; set; }
        public string Type { get; set; } = string.Empty;
        public string Inspector { get; set; } = string.Empty;
        public string? Notes { get; set; }
        public DateTime InspectedAt { get; set; }
    }
}
