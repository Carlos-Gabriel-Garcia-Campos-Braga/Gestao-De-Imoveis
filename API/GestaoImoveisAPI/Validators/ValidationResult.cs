namespace GestaoImoveisAPI.Validators
{
    public class ValidationResult
    {
        public bool Any => Errors.Any();
        public List<string> Errors { get; set; } = new();
    }
}