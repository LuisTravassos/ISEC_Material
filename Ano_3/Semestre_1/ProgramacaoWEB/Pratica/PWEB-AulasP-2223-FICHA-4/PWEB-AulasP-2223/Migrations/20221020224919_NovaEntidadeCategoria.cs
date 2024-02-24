using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace PWEB_AulasP_2223.Migrations
{
    public partial class NovaEntidadeCategoria : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Cursos_Categoria_CategoriaId",
                table: "Cursos");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Categoria",
                table: "Categoria");

            migrationBuilder.DropColumn(
                name: "Categoria",
                table: "Cursos");

            migrationBuilder.RenameTable(
                name: "Categoria",
                newName: "Categorias");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Categorias",
                table: "Categorias",
                column: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_Cursos_Categorias_CategoriaId",
                table: "Cursos",
                column: "CategoriaId",
                principalTable: "Categorias",
                principalColumn: "Id");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Cursos_Categorias_CategoriaId",
                table: "Cursos");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Categorias",
                table: "Categorias");

            migrationBuilder.RenameTable(
                name: "Categorias",
                newName: "Categoria");

            migrationBuilder.AddColumn<string>(
                name: "Categoria",
                table: "Cursos",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Categoria",
                table: "Categoria",
                column: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_Cursos_Categoria_CategoriaId",
                table: "Cursos",
                column: "CategoriaId",
                principalTable: "Categoria",
                principalColumn: "Id");
        }
    }
}
