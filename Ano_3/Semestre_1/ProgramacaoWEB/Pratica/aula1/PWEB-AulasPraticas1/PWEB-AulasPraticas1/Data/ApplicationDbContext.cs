using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using PWEB_AulasPraticas1.Models;

namespace PWEB_AulasPraticas1.Data
{
    public class ApplicationDbContext : IdentityDbContext
    {
        public DbSet<Curso> Curso { get; set; }
        public DbSet<CategoriaCarta> CategoriaCarta { get; set; }
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }
     
    }
}