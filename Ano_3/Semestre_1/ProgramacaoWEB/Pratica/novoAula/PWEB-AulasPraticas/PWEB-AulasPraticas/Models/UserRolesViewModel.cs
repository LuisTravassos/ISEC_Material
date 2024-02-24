namespace PWEB_AulasPraticas1.Models
{
    public class UserRolesViewModel
    {
        public string UserId { get; set; }
        public string PrimeiroNome { get; set; }
        public string UltimoNome { get; set; }
        public string UserName { get; set; }
        public IEnumerable<string> Roles { get; set; }
    }
}
