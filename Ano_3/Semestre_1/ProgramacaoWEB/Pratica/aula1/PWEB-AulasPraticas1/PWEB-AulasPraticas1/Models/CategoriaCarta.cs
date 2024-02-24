using System.ComponentModel.DataAnnotations;

namespace PWEB_AulasPraticas1.Models
{
    public class CategoriaCarta
    {
        [Key]
        public int Id { get; set; }
        public string Nome { get; set; }
        public string Descricao { get; set; }
        public string Disponivel { get; set; }
        public ICollection<Curso> Cursos { get; set; }
    }
}
