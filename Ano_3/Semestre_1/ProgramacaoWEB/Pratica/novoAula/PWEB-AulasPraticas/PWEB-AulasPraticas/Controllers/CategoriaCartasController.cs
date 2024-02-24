using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using PWEB_AulasPraticas1.Data;
using PWEB_AulasPraticas1.Models;

namespace PWEB_AulasPraticas1.Controllers
{
    public class CategoriaCartasController : Controller
    {
        private readonly ApplicationDbContext _context;

        public CategoriaCartasController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: CategoriaCartas
        public async Task<IActionResult> Index()
        {
              return _context.CategoriaCarta != null ? 
                          View(await _context.CategoriaCarta.ToListAsync()) :
                          Problem("Entity set 'ApplicationDbContext.CategoriaCarta'  is null.");
        }

        // GET: CategoriaCartas/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.CategoriaCarta == null)
            {
                return NotFound();
            }

            var categoriaCarta = await _context.CategoriaCarta
                .FirstOrDefaultAsync(m => m.Id == id);
            if (categoriaCarta == null)
            {
                return NotFound();
            }

            return View(categoriaCarta);
        }

        // GET: CategoriaCartas/Create
        [Authorize(Roles = "Admin")]
        public IActionResult Create()
        {
            return View();
        }

        // POST: CategoriaCartas/Create
        [Authorize(Roles = "Admin")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,Nome,Descricao,Disponivel")] CategoriaCarta categoriaCarta)
        {
            if (ModelState.IsValid)
            {
                _context.Add(categoriaCarta);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(categoriaCarta);
        }

        // GET: CategoriaCartas/Edit/5
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.CategoriaCarta == null)
            {
                return NotFound();
            }

            var categoriaCarta = await _context.CategoriaCarta.FindAsync(id);
            if (categoriaCarta == null)
            {
                return NotFound();
            }
            return View(categoriaCarta);
        }

        // POST: CategoriaCartas/Edit/5
        [Authorize(Roles = "Admin")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,Nome,Descricao,Disponivel")] CategoriaCarta categoriaCarta)
        {
            if (id != categoriaCarta.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(categoriaCarta);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!CategoriaCartaExists(categoriaCarta.Id))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            return View(categoriaCarta);
        }

        // GET: CategoriaCartas/Delete/5
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.CategoriaCarta == null)
            {
                return NotFound();
            }

            var categoriaCarta = await _context.CategoriaCarta
                .FirstOrDefaultAsync(m => m.Id == id);
            if (categoriaCarta == null)
            {
                return NotFound();
            }

            return View(categoriaCarta);
        }

        // POST: CategoriaCartas/Delete/5
        [Authorize(Roles = "Admin")]
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.CategoriaCarta == null)
            {
                return Problem("Entity set 'ApplicationDbContext.CategoriaCarta'  is null.");
            }
            var categoriaCarta = await _context.CategoriaCarta.FindAsync(id);
            if (categoriaCarta != null)
            {
                _context.CategoriaCarta.Remove(categoriaCarta);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool CategoriaCartaExists(int id)
        {
          return (_context.CategoriaCarta?.Any(e => e.Id == id)).GetValueOrDefault();
        }
    }
}
