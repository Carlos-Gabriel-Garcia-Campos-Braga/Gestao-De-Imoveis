using GestaoImoveisAPI.Models;
using Microsoft.EntityFrameworkCore;

namespace GestaoImoveisAPI.Data
{
    public class AppDbContext : DbContext
    {
        //Este construtor recebe opcoes de banco de dados, tais como conexao e versao do mesmo
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) 
        { 
        }

        //Cada DbSet faz uma tabela no banco de dados, ou seja, teremos as entidades principais aq
        //Isso é feito utilizando o EntityFramework, transformando o objeto em tabelas
        public DbSet<Renter> Renter => Set<Renter>();
        public DbSet<Bills> Bills => Set<Bills>();
        public DbSet<Adress> Adress => Set<Adress>();
        public DbSet<RentalContract> Contract => Set<RentalContract>();

    }
}
