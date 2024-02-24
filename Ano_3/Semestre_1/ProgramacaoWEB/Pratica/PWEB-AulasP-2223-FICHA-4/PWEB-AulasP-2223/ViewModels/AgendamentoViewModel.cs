using PWEB_AulasP_2223.Models;
using System.ComponentModel.DataAnnotations;
using System.Runtime.InteropServices;
using System.Xml.Linq;

namespace PWEB_AulasP_2223.ViewModels
{
    public class AgendamentoViewModel
    {
        [Display(Name = "Nome Cliente", Prompt = "Introduza o nome do cliente")]
        public string Cliente { get; set; }
        [Display(Name = "Data de Início", Prompt = "yyyy-mm-dd")]
        public DateTime DataInicio { get; set; }
        [Display(Name = "Data de Fim", Prompt = "yyyy-mm-dd")]
        public DateTime DataFim { get; set; }

        [Display(Name = "Tipo de aula", Prompt = "Escolha o tipo de aula que pretende")]
        public int TipoDeAulaId { get; set; }                
    }
}
