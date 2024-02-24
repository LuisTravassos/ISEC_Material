using System.ComponentModel.DataAnnotations;
namespace PWEB_AulasPraticas1.Models
{
    public class PesquisaCursoViewModel
    {
        public List<Curso> ListaDeCursos { get; set; }
        public int NumResultados { get; set; }

        [Display(Name = "Texto", Prompt = "introduza o texto a pesquisar")]
        public string TextoAPesquisar { get; set; }
    }
}
