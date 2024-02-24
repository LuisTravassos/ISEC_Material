using System.ComponentModel.DataAnnotations;

namespace PWEB_AulasP_2223.Models
{
    public class Categoria
    {
        public int Id { get; set; }

        [Display(Name ="Categoria")]
        public string Nome { get; set; }
        public string Descricao { get; set; }
        public bool Disponivel { get; set; }        

        public ICollection<Curso> Cursos { get; set; }

    }
}
