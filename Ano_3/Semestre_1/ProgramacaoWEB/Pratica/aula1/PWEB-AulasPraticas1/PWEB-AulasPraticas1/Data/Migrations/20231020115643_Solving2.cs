using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace PWEB_AulasPraticas1.Data.Migrations
{
    public partial class Solving2 : Migration
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

            migrationBuilder.AlterColumn<string>(
                name: "Categoria",
                table: "Curso",
                type: "nvarchar(max)",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)");

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

            migrationBuilder.AlterColumn<string>(
                name: "Categoria",
                table: "Curso",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "",
                oldClrType: typeof(string),
                oldType: "nvarchar(max)",
                oldNullable: true);

            migrationBuilder.AddForeignKey(
                name: "FK_Curso_CategoriaCarta_CategoriaCartaId",
                table: "Curso",
                column: "CategoriaCartaId",
                principalTable: "CategoriaCarta",
                principalColumn: "Id");
        }
    }
}
