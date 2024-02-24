using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using PWEB_AulasPraticas1.Data;
using PWEB_AulasPraticas1.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Authorization;

namespace PWEB_AulasPraticas1.Controllers
{
    public class AgendamentoController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly UserManager<ApplicationUser> _userManager;
        public AgendamentoController(ApplicationDbContext context, UserManager<ApplicationUser> user)
        {
            _context = context;
            _userManager = user;
        }

        [Authorize]
        public async Task<IActionResult> Index()
        {
            _userManager.GetUserId(User);
            IQueryable<Agendamento> agendamentos = _context.Agendamentos.Include("ApplicationUser");

            return View(await agendamentos.ToListAsync());
        }

        [Authorize(Roles = "Cliente")]
        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Cliente")]
        public async Task<IActionResult> Create(Agendamento agendamento)
        {
            if (ModelState.IsValid)
            {
                // Obter o usuário atualmente autenticado
                var usuario = await _userManager.GetUserAsync(User);

                // Associar o usuário ao agendamento
                agendamento.ApplicationUser = usuario;

                _context.Add(agendamento);
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

            // Se o modelo não for válido, retorna a view com os erros de validação
            return View(agendamento);
        }

        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.Agendamentos == null)
            {
                return NotFound();
            }

            var agendamento = await _context.Agendamentos.FindAsync(id);
            if (agendamento== null)
            {
                return NotFound();
            }
            return View(agendamento);
        }

        // POST: CategoriaCartas/Edit/5
        [Authorize(Roles = "Admin")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,DataInicio,DataFim,DuracaoEmHoras,DuracaoEmMinutos,Preco,DataHoraDoPedido,applicationUserId")] Agendamento agendamento)
        {
            if (id != agendamento.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(agendamento);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!AgendamentoExists(agendamento.Id))
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
            return View(agendamento);
        }

        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.Agendamentos == null)
            {
                return NotFound();
            }

            var agendamento = await _context.Agendamentos
                .FirstOrDefaultAsync(m => m.Id == id);
            if (agendamento == null)
            {
                return NotFound();
            }

            return View(agendamento);
        }

        // POST: CategoriaCartas/Delete/5
        [Authorize(Roles = "Admin")]
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.Agendamentos == null)
            {
                return Problem("Entity set 'ApplicationDbContext.Agendamento'  is null.");
            }
            var agendamento = await _context.Agendamentos.FindAsync(id);
            if (agendamento != null)
            {
                _context.Agendamentos.Remove(agendamento);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool AgendamentoExists(int id)
        {
            return (_context.Agendamentos?.Any(e => e.Id == id)).GetValueOrDefault();
        }
    }
}
