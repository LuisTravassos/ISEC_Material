namespace PWEB_AulasP_2223.ViewModels
{
    public class UserRolesViewModel
    {
        
            public string UserId { get; set; }
            public string PrimeiroNome { get; set; }
            public string UltimoNome { get; set; }
            public string UserName { get; set; }
            public string Email { get; set; }
            public IEnumerable<string> Roles { get; set; }
        
    }
}
