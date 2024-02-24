using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Reflection.Metadata;

namespace PWEB_AulasPraticas1.Models
{
    public class Curso
    {
        [Key]
        public int Id { get; set; }
        public string Nome { get; set; }
        public bool Disponivel { get; set; }
        public string? Categoria { get; set; }
        public string Descricao { get; set; }
        public string DescricaoResumida { get; set; }
        public string Requisitos { get; set; }
        public int IdadeMinima { get; set; }
        public decimal? Preco {  get; set; }
        public bool EmDestaque { get; set; }
        public int CategoriaCartaId { get; set; }
        public CategoriaCarta categoriaCarta { get; set; }
    }
}
