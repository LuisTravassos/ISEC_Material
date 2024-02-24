namespace PWEB_AulasPraticas1.Models
{
    public class Agendamento
    {
        public int Id { get; set; }
        public DateTime DataInicio { get; set; }
        public DateTime DataFim { get; set; }
        public int DuracaoEmHoras { get; set; }
        public int DuracaoEmMinutos { get; set; }
        public decimal Preco { get; set; }
        public DateTime DataHoraDoPedido { get; set; }
        public string? applicationUserId { get; set; }
        public ApplicationUser? ApplicationUser { get; set; }
    }
}
