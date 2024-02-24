using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Hosting;
using PWEB_AulasP_2223.Models;
using System.Reflection.Metadata;

namespace PWEB_AulasP_2223.Data
{
    public class ApplicationDbContext : IdentityDbContext <ApplicationUser>
    {

        public DbSet<Curso> Cursos{ get; set; }
        public DbSet<Categoria> Categorias { get; set; }

        public DbSet<Agendamento> Agendamentos{ get; set; }

        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }
       
        public DbSet<PWEB_AulasP_2223.Models.TipoDeAula> TipoDeAula { get; set; }
    }
}