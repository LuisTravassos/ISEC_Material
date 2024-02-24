using Microsoft.AspNetCore.Identity;
using System;


namespace PWEB_AulasPraticas1.Models
{
    public class ApplicationUser : IdentityUser
    {
        public string PrimeiroNome { get; set; }
        public string UltimoNome { get; set; }
        public DateTime DataNascimento { get; set; }
        public int NIF { get; set; }
        public ICollection<Agendamento> Agendamentos { get; set;}
    }
}
