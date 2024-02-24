using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace PWEB_AulasPraticas1.Data.Migrations
{
    public partial class EmDestaqueMigracao : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<bool>(
                name: "EmDestaque",
                table: "Curso",
                type: "bit",
                nullable: false,
                defaultValue: false);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "EmDestaque",
                table: "Curso");
        }
    }
}
