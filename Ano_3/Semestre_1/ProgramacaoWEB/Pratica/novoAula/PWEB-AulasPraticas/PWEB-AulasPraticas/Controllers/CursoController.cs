using System;
using System.Collections.Generic;
using System.Diagnostics;
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
    public class CursoController : Controller
    {
        private readonly ApplicationDbContext _context;

        public CursoController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: Curso
        public async Task<IActionResult> Index(bool? disponivel)
        {
            IQueryable<Curso> cursos = _context.Curso;

            if (disponivel.HasValue)
            {
                cursos = cursos.Where(c => c.Disponivel == disponivel.Value);
            }

            return View(await cursos.ToListAsync());
        }

        public async Task<IActionResult> Search(string? TextoAPesquisar)
        {
            PesquisaCursoViewModel pesquisa_curso = new PesquisaCursoViewModel();

            if (!string.IsNullOrWhiteSpace(TextoAPesquisar))
            {
                pesquisa_curso.ListaDeCursos = await _context.Curso.Where(c => c.Nome.Contains(TextoAPesquisar)
                || c.DescricaoResumida.Contains(TextoAPesquisar)).ToListAsync();

                pesquisa_curso.TextoAPesquisar = TextoAPesquisar;
            }

            pesquisa_curso.ListaDeCursos = await _context.Curso.ToListAsync();
            pesquisa_curso.NumResultados = pesquisa_curso.ListaDeCursos.Count();

            ViewData["Title"] = "Lista de cursos Selecionados";
            return View(pesquisa_curso);
        }

        // GET: Curso/Details
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.Curso == null)
            {
                return NotFound();
            }

            var curso = await _context.Curso
                .FirstOrDefaultAsync(m => m.Id == id);
            if (curso == null)
            {
                return NotFound();
            }

            return View(curso);
        }

        // GET: Curso/Create
        [Authorize(Roles = "Admin")]
        public IActionResult Create()
        {   
            ViewBag.cat = new SelectList(_context.CategoriaCarta, "Id", "Nome");
            return View();
        }

        // POST: Curso/Create
        [Authorize(Roles = "Admin")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,Nome,Disponivel,Descricao,DescricaoResumida,Requisitos,IdadeMinima,Preco,EmDestaque,CategoriaCartaId")] Curso curso)
        {
            ViewBag.cat = new SelectList(_context.CategoriaCarta, "Id", "Nome");

            if (ModelState.IsValid)
            {
                _context.Add(curso);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            else
            {
                // Coleta as mensagens de erro do ModelState
                var erros = ModelState.Values.SelectMany(v => v.Errors).Select(e => e.ErrorMessage);

                // Exibe as mensagens de erro no console
                foreach (var erro in erros)
                {
                    Console.WriteLine("Erro de validação: " + erro);
                }
            }
            return View(curso);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Search([Bind("TextoAPesquisar")] PesquisaCursoViewModel pesquisaCurso)
        {
            IQueryable<Curso> cursos = _context.Curso;

            if (!string.IsNullOrEmpty(pesquisaCurso.TextoAPesquisar))
            {
                cursos = cursos.Where(c => c.Nome.Contains(pesquisaCurso.TextoAPesquisar)
                || c.DescricaoResumida.Contains(pesquisaCurso.TextoAPesquisar));
            }

            pesquisaCurso.ListaDeCursos = await cursos.ToListAsync();
            pesquisaCurso.NumResultados = pesquisaCurso.ListaDeCursos.Count;

            return View(pesquisaCurso);
        }

        // GET: Curso/Edit/5
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Edit(int? id)
        {
            ViewBag.cat = new SelectList(_context.CategoriaCarta, "Id", "Nome");
            if (id == null || _context.Curso == null)
            {
                return NotFound();
            }

            var curso = await _context.Curso.FindAsync(id);
            if (curso == null)
            {
                return NotFound();
            }
            return View(curso);
        }

        // POST: Curso/Edit/5
        [Authorize(Roles = "Admin")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,Nome,Disponivel,Descricao,DescricaoResumida,Requisitos,IdadeMinima,Preco,EmDestaque,CategoriaCartaId")] Curso curso)
        {
            ViewBag.cat = new SelectList(_context.CategoriaCarta, "Id", "Nome");
            if (id != curso.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(curso);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!CursoExists(curso.Id))
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
            else
            {
                // Coleta as mensagens de erro do ModelState
                var erros = ModelState.Values.SelectMany(v => v.Errors).Select(e => e.ErrorMessage);

                // Exibe as mensagens de erro no console
                foreach (var erro in erros)
                {
                    Console.WriteLine("Erro de validação: " + erro);
                }
            }
            return View(curso);
        }

        // GET: Curso/Delete/5
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.Curso == null)
            {
                return NotFound();
            }

            var curso = await _context.Curso
                .FirstOrDefaultAsync(m => m.Id == id);
            if (curso == null)
            {
                return NotFound();
            }

            return View(curso);
        }

        // POST: Curso/Delete/5
        [Authorize(Roles = "Admin")]
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.Curso == null)
            {
                return Problem("Entity set 'ApplicationDbContext.Curso'  is null.");
            }
            var curso = await _context.Curso.FindAsync(id);
            if (curso != null)
            {
                _context.Curso.Remove(curso);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool CursoExists(int id)
        {
            return (_context.Curso?.Any(e => e.Id == id)).GetValueOrDefault();
        }
    }
}
