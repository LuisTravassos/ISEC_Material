using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Reflection.Metadata;

namespace PWEB_AulasPraticas1.Models
{
    public class Curso
    {
        [Key]
        public int Id { get; set; }

        [Display(Name = "Nome")]
        public string Nome { get; set; }

        [Display(Name = "Disponível")]
        public bool Disponivel { get; set; }

        [Display(Name = "Descrição")]
        public string Descricao { get; set; }

        [Display(Name = "Descrição Resumida")]
        public string DescricaoResumida { get; set; }

        [Display(Name = "Requisitos")]
        public string Requisitos { get; set; }

        [Display(Name = "Idade Mínima")]
        public int IdadeMinima { get; set; }

        [Display(Name = "Preço")]
        [DisplayFormat(DataFormatString = "{0:C}")]
        public decimal Preco { get; set; }

        [Display(Name = "Em Destaque")]
        public bool EmDestaque { get; set; }

        [Display(Name = "Categoria da Carta")]
        public int CategoriaCartaId { get; set; }

        [Display(Name = "Categoria da Carta")]
        public CategoriaCarta? categoriaCarta { get; set; }
    }
}
