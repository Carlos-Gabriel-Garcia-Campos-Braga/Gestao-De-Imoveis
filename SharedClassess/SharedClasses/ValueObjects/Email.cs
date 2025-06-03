namespace SharedClasses.ValueObjects
{
    public string Email { get; set; }

    public Email(string email)
    {
        if (string.IsNullOrWhiteSpace(email))
        {
            throw new ArgumentException("O e-mail nao pode estar vazio!");
        }

        if (!isValidEmail())
            {
                throw new ArgumentException("Formato de e-mail invalido!");
            }
        Email = email;
    }

    public bool isValidEmail()
    {
        var regex = new Regex(@"^[^@\s]+@[^@\s]+\.[^@\s]+$");
        return regex.IsMatch(email);
    }
    
}