using PWEB_AulasP_2223.Models;
using System.ComponentModel.DataAnnotations;
using System.Xml.Linq;

namespace PWEB_AulasP_2223.ViewModels
{
    public class PesquisaCursoViewModel
    {
        public List<Curso> ListaDeCursos { get; set; }
        public int NumResultados { get; set; }
        [Display(Name = "PESQUISA DE CURSOS ...", Prompt = "introduza o texto a pesquisar")]
        public string TextoAPesquisar { get; set; }

    }
}
