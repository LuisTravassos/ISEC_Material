using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace PWEB_AulasPraticas1.Data.Migrations
{
    public partial class migration2 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "Categoria",
                table: "Cursos",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "Descricao",
                table: "Cursos",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "DescricaoResumida",
                table: "Cursos",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "IdadeMinima",
                table: "Cursos",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "Requisitos",
                table: "Cursos",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Categoria",
                table: "Cursos");

            migrationBuilder.DropColumn(
                name: "Descricao",
                table: "Cursos");

            migrationBuilder.DropColumn(
                name: "DescricaoResumida",
                table: "Cursos");

            migrationBuilder.DropColumn(
                name: "IdadeMinima",
                table: "Cursos");

            migrationBuilder.DropColumn(
                name: "Requisitos",
                table: "Cursos");
        }
    }
}
