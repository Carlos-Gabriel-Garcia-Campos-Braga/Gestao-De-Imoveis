using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;

namespace GestaoImoveisAPI.Data
{
    // Usado exclusivamente pelo EF Core CLI (dotnet ef migrations add/update).
    // Evita a necessidade de AutoDetect (que exige conexão real ao MySQL).
    public class AppDbContextFactory : IDesignTimeDbContextFactory<AppDbContext>
    {
        public AppDbContext CreateDbContext(string[] args)
        {
            var config = new ConfigurationBuilder()
                .SetBasePath(Directory.GetCurrentDirectory())
                .AddJsonFile("appsettings.json", optional: true)
                .AddUserSecrets<AppDbContextFactory>(optional: true)
                .AddEnvironmentVariables()
                .Build();

            var raw = config.GetConnectionString("DefaultConnection") ?? string.Empty;

            // Placeholder não é uma connection string válida — usa fallback com formato correto
            var cs = raw.StartsWith("Server=") || raw.StartsWith("server=")
                ? raw
                : "Server=localhost;Port=3306;Database=GestaoImoveisDB;User=root;Password=placeholder;";

            var optionsBuilder = new DbContextOptionsBuilder<AppDbContext>();
            optionsBuilder.UseMySql(cs, new MySqlServerVersion(new Version(8, 0, 33)));

            return new AppDbContext(optionsBuilder.Options);
        }
    }
}
