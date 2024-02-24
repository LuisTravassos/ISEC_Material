using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PWEB_AulasPraticas1.Data;
using PWEB_AulasPraticas1.Models;
using System.Diagnostics;

namespace PWEB_AulasPraticas1.Controllers
{
    public class HomeController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger, ApplicationDbContext context)
        {
            _logger = logger;
            _context = context; // Injetando o contexto do banco de dados
        }

        public async Task<IActionResult> Index()
        {
            IQueryable<Curso> cursos = _context.Curso;

            return View(await cursos.ToListAsync());
        }

        public IActionResult Contacts()
        {
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        public IActionResult Quem()
        {
            return View();
        }

        public IActionResult Cursos()
        {
            var cursosAtivos = _context.Curso.Where(c => c.Disponivel).ToList();
            return View(cursosAtivos);
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}