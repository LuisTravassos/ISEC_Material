using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using PWEB_AulasPraticas1.Models;

namespace PWEB_AulasPraticas1.Data
{
    public class ApplicationDbContext : IdentityDbContext<ApplicationUser>
    {
        public DbSet<Curso> Curso { get; set; }
        public DbSet<CategoriaCarta> CategoriaCarta { get; set; }
        public DbSet<Agendamento> Agendamentos { get; set; }
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {

        }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            // Configuração para a propriedade Preco do modelo Curso
            modelBuilder.Entity<Curso>()
                .Property(c => c.Preco)
                .HasPrecision(18, 2); // Precisão de 18 dígitos e 2 casas decimais
        }

    }
}