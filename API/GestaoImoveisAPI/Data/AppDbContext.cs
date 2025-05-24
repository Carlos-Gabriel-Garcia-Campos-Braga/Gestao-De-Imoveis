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
            // ✅ Renter
            modelBuilder.Entity<Renter>(entity =>
            {
                entity.OwnsOne(e => e.CPF, cpf =>
                {
                    cpf.Property(p => p.Value).HasColumnName("CPF");
                });

                entity.OwnsOne(e => e.PhoneNumber, phone =>
                {
                    phone.Property(p => p.Value).HasColumnName("PhoneNumber");
                });
            });

            // ✅ RentalContract
            modelBuilder.Entity<RentalContract>(entity =>
            {
                entity.OwnsOne(e => e.RentalValue, money =>
                {
                    money.Property(p => p.Amount).HasColumnName("RentalValue");
                });

                entity.OwnsOne(e => e.Adress, adress =>
                {
                    adress.Property(p => p.Street).HasColumnName("Street");
                    adress.Property(p => p.Number).HasColumnName("Number");
                    adress.Property(p => p.Complement).HasColumnName("Complement");
                    adress.Property(p => p.Neighborhood).HasColumnName("Neighborhood");
                    adress.Property(p => p.City).HasColumnName("City");
                    adress.Property(p => p.State).HasColumnName("State");
                    adress.Property(p => p.ZipCode).HasColumnName("ZipCode");
                    adress.Property(p => p.Complement).HasColumnName("Complement");
                });
            });

            // ✅ Bills
            modelBuilder.Entity<Bills>(entity =>
            {
                entity.OwnsOne(e => e.Value, money =>
                {
                    money.Property(p => p.Amount).HasColumnName("Value");
                });
            });
        }

    }
}
