using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PWEB_AulasPraticas1.Data;

namespace PWEB_AulasPraticas1.Controllers
{
    public class RoleManagerController : Controller
    {
        private readonly RoleManager<IdentityRole> _roleManager;
        public RoleManagerController(RoleManager<IdentityRole> roleManager)
        {
            _roleManager = roleManager;
        }

        public async Task<IActionResult> Index()
        {
            var roles = await _roleManager.Roles.ToListAsync();
            return View(roles);
        }

        [HttpPost]
        public async Task<IActionResult> AddRole(string roleName)
        {
            if (!string.IsNullOrWhiteSpace(roleName))
            {
                var role = new IdentityRole(roleName);
                await _roleManager.CreateAsync(role);
            }

            return RedirectToAction("Index");
        }
    }
}
