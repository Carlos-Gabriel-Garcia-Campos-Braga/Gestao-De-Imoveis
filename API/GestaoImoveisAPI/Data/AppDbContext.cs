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

        public DbSet<RentalContract> Contract => Set<RentalContract>();

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            // Relacionamento 1:1 entre RentalContract e Adress
            modelBuilder.Entity<RentalContract>()
                .HasOne(rc => rc.Adress)
                .WithOne(a => a.RentalContract)
                .HasForeignKey<RentalContract>(rc => rc.AdressId);

            modelBuilder.Entity<Renter>(entity =>
            {
                entity.OwnsOne(e => e.CPF);
                entity.OwnsOne(e => e.PhoneNumber);
            });

            modelBuilder.Entity<RentalContract>(entity =>
            {
                entity.OwnsOne(e => e.RentalValue);
                entity.OwnsOne(e => e.Adress);
            })
            
        }
    }
}
