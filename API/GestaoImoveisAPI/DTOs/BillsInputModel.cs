namespace GestaoImoveisAPI.DTOs
{
    public class BillsInputModel
    {
        public string Type { get; set; } = string.Empty;
        public DateTime ValidationDate { get; set; }
        public decimal Value { get; set; }
    }
}
