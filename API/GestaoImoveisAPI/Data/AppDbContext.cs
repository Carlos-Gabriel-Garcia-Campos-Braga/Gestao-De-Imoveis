using GestaoImoveisAPI.Domain.Billing;
using GestaoImoveisAPI.Domain.Identity;
using GestaoImoveisAPI.Domain.Leasing;
using GestaoImoveisAPI.Domain.Property;
using Microsoft.EntityFrameworkCore;
using PropertyEntity = GestaoImoveisAPI.Domain.Property.Property;

namespace GestaoImoveisAPI.Data
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }

        public DbSet<User> Users => Set<User>();
        public DbSet<Renter> Renters => Set<Renter>();
        public DbSet<RentalContract> Contract => Set<RentalContract>();
        public DbSet<RentBill> Bills => Set<RentBill>();
        public DbSet<PropertyEntity> Properties => Set<PropertyEntity>();
        public DbSet<InspectionReport> InspectionReports => Set<InspectionReport>();
        public DbSet<ReadjustmentRecord> ReadjustmentRecords => Set<ReadjustmentRecord>();
        public DbSet<Invoice> Invoices => Set<Invoice>();

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            // Renter
            modelBuilder.Entity<Renter>(entity =>
            {
                entity.ToTable("Renter");

                entity.OwnsOne(e => e.CPF, cpf =>
                    cpf.Property(p => p.Value).HasColumnName("CPF"));

                entity.OwnsOne(e => e.PhoneNumber, phone =>
                    phone.Property(p => p.Value).HasColumnName("PhoneNumber"));

                entity.HasMany(e => e.Contracts)
                      .WithOne(c => c.Renter)
                      .HasForeignKey(c => c.RenterId);

                entity.Navigation(e => e.Contracts)
                      .HasField("_contracts")
                      .UsePropertyAccessMode(PropertyAccessMode.Field);
            });

            // User (Domain Entity — Identity Context)
            modelBuilder.Entity<User>(entity =>
            {
                entity.ToTable("User");

                entity.Property(e => e.PasswordHash).HasColumnName("Password");

                entity.OwnsOne(e => e.Email, email =>
                    email.Property(p => p.Value).HasColumnName("Email"));
            });

            // RentalContract (Aggregate Root)
            modelBuilder.Entity<RentalContract>(entity =>
            {
                entity.ToTable("Contract");

                entity.Property(e => e.PreferredIndex)
                      .HasConversion<string>()
                      .HasDefaultValue(EconomicIndex.IPCA);

                entity.OwnsOne(e => e.RentalValue, money =>
                    money.Property(p => p.Amount).HasColumnName("RentalValue"));

                entity.OwnsOne(e => e.Adress, adress =>
                {
                    adress.Property(p => p.Street).HasColumnName("Street");
                    adress.Property(p => p.Number).HasColumnName("Number");
                    adress.Property(p => p.Complement).HasColumnName("Complement");
                    adress.Property(p => p.Neighborhood).HasColumnName("Neighborhood");
                    adress.Property(p => p.City).HasColumnName("City");
                    adress.Property(p => p.State).HasColumnName("State");
                    adress.Property(p => p.ZipCode).HasColumnName("ZipCode");
                });

                entity.HasMany(e => e.Bills)
                      .WithOne()
                      .HasForeignKey(b => b.RentalContractId);

                entity.Navigation(e => e.Bills)
                      .HasField("_bills")
                      .UsePropertyAccessMode(PropertyAccessMode.Field);

                entity.HasMany(e => e.ReadjustmentHistory)
                      .WithOne()
                      .HasForeignKey(r => r.ContractId);

                entity.Navigation(e => e.ReadjustmentHistory)
                      .HasField("_readjustments")
                      .UsePropertyAccessMode(PropertyAccessMode.Field);
            });

            // ReadjustmentRecord (child Entity — acesso apenas via RentalContract.ApplyAnnualReadjustment)
            modelBuilder.Entity<ReadjustmentRecord>(entity =>
            {
                entity.ToTable("ReadjustmentRecords");
                entity.Property(e => e.Index).HasConversion<string>();
            });

            // RentBill (child Entity — acesso apenas via RentalContract.AddBill)
            modelBuilder.Entity<RentBill>(entity =>
            {
                entity.ToTable("Bills");

                entity.OwnsOne(e => e.Value, money =>
                    money.Property(p => p.Amount).HasColumnName("Value"));
            });

            // Property (Aggregate Root — Property Context)
            modelBuilder.Entity<PropertyEntity>(entity =>
            {
                entity.ToTable("Properties");

                entity.OwnsOne(e => e.Address, address =>
                {
                    address.Property(p => p.Street).HasColumnName("Street");
                    address.Property(p => p.Number).HasColumnName("Number");
                    address.Property(p => p.Complement).HasColumnName("Complement");
                    address.Property(p => p.Neighborhood).HasColumnName("Neighborhood");
                    address.Property(p => p.City).HasColumnName("City");
                    address.Property(p => p.State).HasColumnName("State");
                    address.Property(p => p.ZipCode).HasColumnName("ZipCode");
                });

                entity.Property(e => e.Type).HasConversion<string>();
                entity.Property(e => e.Status).HasConversion<string>();

                entity.HasMany(e => e.InspectionReports)
                      .WithOne()
                      .HasForeignKey(r => r.PropertyId);

                entity.Navigation(e => e.InspectionReports)
                      .HasField("_inspectionReports")
                      .UsePropertyAccessMode(PropertyAccessMode.Field);
            });

            // InspectionReport (child Entity — acesso apenas via Property.AddInspectionReport)
            modelBuilder.Entity<InspectionReport>(entity =>
            {
                entity.ToTable("InspectionReports");
                entity.Property(e => e.Type).HasConversion<string>();
            });

            // Invoice (Aggregate Root — Billing Context)
            modelBuilder.Entity<Invoice>(entity =>
            {
                entity.ToTable("Invoices");
                entity.Property(e => e.Status).HasConversion<string>();

                // PixCharge — Entity filha, tabela separada
                entity.HasOne(e => e.PixCharge)
                      .WithOne()
                      .HasForeignKey<PixCharge>(p => p.InvoiceId)
                      .IsRequired(false);

                entity.Navigation(e => e.PixCharge)
                      .HasField("_pixCharge")
                      .UsePropertyAccessMode(PropertyAccessMode.Field);

                // LateFeeCalculation — Value Object, colunas inline
                entity.OwnsOne(e => e.LateFee, lf =>
                {
                    lf.Property(p => p.DaysOverdue).HasColumnName("LateFee_DaysOverdue");
                    lf.Property(p => p.LateFeeAmount).HasColumnName("LateFee_LateFeeAmount");
                    lf.Property(p => p.InterestAmount).HasColumnName("LateFee_InterestAmount");
                    lf.Property(p => p.TotalAmount).HasColumnName("LateFee_TotalAmount");
                });

                // PaymentRecord — Value Object, colunas inline
                entity.OwnsOne(e => e.Payment, p =>
                {
                    p.Property(r => r.PaidAt).HasColumnName("Payment_PaidAt");
                    p.Property(r => r.AmountPaid).HasColumnName("Payment_AmountPaid");
                    p.Property(r => r.PaymentMethod).HasColumnName("Payment_PaymentMethod");
                });
            });

            // PixCharge — Entity filha da Invoice (acesso apenas via Invoice.AttachPixCharge)
            modelBuilder.Entity<PixCharge>(entity =>
            {
                entity.ToTable("PixCharges");
                entity.Property(e => e.Status).HasConversion<string>();
            });
        }
    }
}
