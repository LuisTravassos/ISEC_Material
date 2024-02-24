using Microsoft.AspNetCore.Mvc;
using PWEB_AulasP_2223.Data;
using PWEB_AulasP_2223.Models;
using System.Diagnostics;

namespace PWEB_AulasP_2223.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly ApplicationDbContext _context;

        public HomeController(ILogger<HomeController> logger, 
            ApplicationDbContext context)
        {
            _logger = logger;
            _context = context;
        }

        public IActionResult Index()
        {
            return View(_context.Cursos.Where(c => c.Disponivel == true 
            && c.EmDestaque==true
            ).ToList())
                ;
        }

        public IActionResult Privacy()
        {
            return View();
        }


        public IActionResult QuemSomos()
        {
            return View();
        }


        public IActionResult Cursos()
        {
            return View();
        }


        public IActionResult Contactos()
        {
            return View();
        }


        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}