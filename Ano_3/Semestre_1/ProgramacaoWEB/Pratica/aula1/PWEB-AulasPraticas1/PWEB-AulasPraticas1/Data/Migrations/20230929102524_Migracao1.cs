using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace PWEB_AulasPraticas1.Data.Migrations
{
    public partial class Migracao1 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "Categoria",
                table: "Curso",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "Descricao",
                table: "Curso",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "DescricaoResumida",
                table: "Curso",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<int>(
                name: "IdadeMinima",
                table: "Curso",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<string>(
                name: "Requisitos",
                table: "Curso",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Categoria",
                table: "Curso");

            migrationBuilder.DropColumn(
                name: "Descricao",
                table: "Curso");

            migrationBuilder.DropColumn(
                name: "DescricaoResumida",
                table: "Curso");

            migrationBuilder.DropColumn(
                name: "IdadeMinima",
                table: "Curso");

            migrationBuilder.DropColumn(
                name: "Requisitos",
                table: "Curso");
        }
    }
}
