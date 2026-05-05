namespace SharedClasses.OutputsDTOs
{
    public class PropertyOutputModel
    {
        public int Id { get; set; }
        public string Description { get; set; } = string.Empty;
        public string Type { get; set; } = string.Empty;
        public string Status { get; set; } = string.Empty;
        public AdressOutputModel Address { get; set; } = new();
    }
}
