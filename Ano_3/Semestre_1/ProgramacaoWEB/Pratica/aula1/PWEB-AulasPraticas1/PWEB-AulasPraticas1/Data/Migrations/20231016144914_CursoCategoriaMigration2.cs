using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace PWEB_AulasPraticas1.Data.Migrations
{
    public partial class CursoCategoriaMigration2 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Curso_CategoriaCarta_CategoriaCartaId",
                table: "Curso");

            migrationBuilder.AlterColumn<int>(
                name: "CategoriaCartaId",
                table: "Curso",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AddForeignKey(
                name: "FK_Curso_CategoriaCarta_CategoriaCartaId",
                table: "Curso",
                column: "CategoriaCartaId",
                principalTable: "CategoriaCarta",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Curso_CategoriaCarta_CategoriaCartaId",
                table: "Curso");

            migrationBuilder.AlterColumn<int>(
                name: "CategoriaCartaId",
                table: "Curso",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AddForeignKey(
                name: "FK_Curso_CategoriaCarta_CategoriaCartaId",
                table: "Curso",
                column: "CategoriaCartaId",
                principalTable: "CategoriaCarta",
                principalColumn: "Id");
        }
    }
}
