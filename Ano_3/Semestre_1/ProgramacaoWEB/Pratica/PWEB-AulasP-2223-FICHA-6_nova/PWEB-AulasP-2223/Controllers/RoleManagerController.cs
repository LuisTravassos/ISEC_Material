
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace PWEB_AulasP_2223.Controllers
{
    public class RoleManagerController : Controller
    {
        private readonly RoleManager<IdentityRole> _roleManager;
        public RoleManagerController(RoleManager<IdentityRole> roleManager)
        {
            /*o seu código*/
            _roleManager = roleManager;
        }

        public async Task<IActionResult> Index()
        {
            /*o seu código */
            var roles = await _roleManager.Roles.ToListAsync();
            return View(roles);
        }
        [HttpPost]
        public async Task<IActionResult> AddRole(string roleName)
        {
            /* o seu código */
            if (roleName != null)
            {
                await _roleManager.CreateAsync(new IdentityRole(roleName.Trim()));
            }
            return RedirectToAction("Index");
        }

        public async Task<IActionResult> Delete(string id)
        {
            var role = _roleManager.Roles.Where(r => r.Id == id).FirstOrDefault();
            if (role != null)
            {
                await _roleManager.DeleteAsync(role);
            }                
            return RedirectToAction("Index");
        }
    }
}
