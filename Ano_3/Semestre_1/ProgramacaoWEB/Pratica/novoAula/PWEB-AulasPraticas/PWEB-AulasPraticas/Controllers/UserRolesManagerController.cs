using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PWEB_AulasPraticas1.Models;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace PWEB_AulasPraticas1.Controllers
{
    public class UserRolesManagerController : Controller
    {
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly RoleManager<IdentityRole> _roleManager;

        public UserRolesManagerController(UserManager<ApplicationUser> userManager,
            RoleManager<IdentityRole> roleManager)
        {
            _userManager = userManager;
            _roleManager = roleManager;
        }

        public async Task<IActionResult> Index()
        {
            var users = await _userManager.Users.ToListAsync();

            List<UserRolesViewModel> userRolesViewModel = new List<UserRolesViewModel>();

            foreach (var user in users)
            {
                var model = new UserRolesViewModel
                {
                    UserId = user.Id,
                    UserName = user.UserName,
                    Roles = await GetUserRoles(user)
                };

                userRolesViewModel.Add(model);
            }

            return View(userRolesViewModel);
        }

        private async Task<List<string>> GetUserRoles(ApplicationUser user)
        {
            return new List<string>(await _userManager.GetRolesAsync(user));
        }

        public async Task<IActionResult> Details(string userId)
        {
            var user = await _userManager.FindByIdAsync(userId);

            if (user == null)
            {
                return NotFound();
            }

            var model = new UserRolesViewModel
            {
                UserId = user.Id,
                UserName = user.UserName,
                Roles = await GetUserRoles(user)
            };

            return View(model);
        }

        [HttpPost]
        public async Task<IActionResult> Details(List<ManagerUserRolesViewModel> model,
            string userId)
        {
            var user = await _userManager.FindByIdAsync(userId);

            if (user == null)
            {
                return NotFound();
            }

            var rolesToAdd = model.Where(m => m.Selected).Select(m => m.RoleName);
            var rolesToRemove = model.Where(m => !m.Selected).Select(m => m.RoleName);

            await _userManager.AddToRolesAsync(user, rolesToAdd);
            await _userManager.RemoveFromRolesAsync(user, rolesToRemove);

            return RedirectToAction("Index");
        }
    }
}