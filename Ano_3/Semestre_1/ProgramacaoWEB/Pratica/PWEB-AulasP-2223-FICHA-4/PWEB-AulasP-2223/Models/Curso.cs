using Microsoft.Build.Framework;
using System.ComponentModel.DataAnnotations;
using System.Xml.Linq;


namespace PWEB_AulasP_2223.Models
{
    public class Curso
    {
        public int Id { get; set; }
        [Display(Name = "Nome", Prompt = "Introduza o nome do curso")]
        public string Nome { get; set; }


        //public string Categoria  { get; set; }   --->  ELININADO - EXERC. 10
        //Provoca erros nas Views - necessário corrigir Views e o Bind nos metodos httpPost- Edit/Create - no controller cursos
        [Display(Name = "Descrição", Prompt = "Introduza a descrição do curso")]
        public string Descricao  { get; set; }

        [Display(Name = "Descrição resumida", Prompt = "Introduza a descrição resumida")]
        public string DescricaoResumida{ get; set; }
        
        [Display(Name = "Requísitos", Prompt = "Introduza os requísitos para poder frequentar o curso")]
        public string Requisitos  { get; set; }
        
        [Display(Name = "Idade mínima", Prompt = "Introduza a idade Mínima", Description = "Idade mínima para poder frequentar esta formação")]
        [Range(14, 100, ErrorMessage = "Mínimo: 14 anos, máximo: 100 anos")]
        public int IdadeMinima  { get; set; }
        [Display(Name = "Curso activo?")]
        public bool Disponivel { get; set; }
        [Display(Name = "Curso em destaque na primeira página?")]
        public bool EmDestaque { get; set; }
        [Display(Name = "Preço", Prompt = "Introduza o Preço", Description = "Preço do curso")]
        [Range(0.5, 99999, ErrorMessage = "Mínimo: 0.50 €")]        
        public decimal? Preco { get; set; }


        public int? CategoriaId { get; set; }
        public Categoria categoria { get; set; }


    }
}
