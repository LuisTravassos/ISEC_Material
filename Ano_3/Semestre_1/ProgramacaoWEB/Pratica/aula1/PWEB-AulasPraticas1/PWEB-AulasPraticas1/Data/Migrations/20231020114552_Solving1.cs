using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace PWEB_AulasPraticas1.Data.Migrations
{
    public partial class Solving1 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "CategoriaCartaId",
                table: "Curso",
                type: "int",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Curso_CategoriaCartaId",
                table: "Curso",
                column: "CategoriaCartaId");

            migrationBuilder.AddForeignKey(
                name: "FK_Curso_CategoriaCarta_CategoriaCartaId",
                table: "Curso",
                column: "CategoriaCartaId",
                principalTable: "CategoriaCarta",
                principalColumn: "Id");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Curso_CategoriaCarta_CategoriaCartaId",
                table: "Curso");

            migrationBuilder.DropIndex(
                name: "IX_Curso_CategoriaCartaId",
                table: "Curso");

            migrationBuilder.DropColumn(
                name: "CategoriaCartaId",
                table: "Curso");
        }
    }
}
