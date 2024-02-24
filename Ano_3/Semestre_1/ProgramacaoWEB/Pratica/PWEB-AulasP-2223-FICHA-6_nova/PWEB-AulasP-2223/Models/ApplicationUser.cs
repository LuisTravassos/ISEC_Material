using Microsoft.AspNetCore.Identity;
using Microsoft.Build.ObjectModelRemoting;

namespace PWEB_AulasP_2223.Models
{
    public class ApplicationUser : IdentityUser
    {
        public string PrimeiroNome { get; set; }
        public string UltimoNome { get; set; }
        public DateTime DataNascimento { get; set; }                
        public int NIF { get; set; }

        public byte[] Avatar { get; set; }
        public ICollection<Agendamento> Agendamentos { get; set; }
    }
}
