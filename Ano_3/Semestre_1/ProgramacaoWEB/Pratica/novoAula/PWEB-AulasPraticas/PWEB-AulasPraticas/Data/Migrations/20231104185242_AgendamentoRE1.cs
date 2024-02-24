using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace PWEB_AulasPraticas1.Data.Migrations
{
    public partial class AgendamentoRE1 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Cliente",
                table: "Agendamentos");

            migrationBuilder.AddColumn<string>(
                name: "applicationUserId",
                table: "Agendamentos",
                type: "nvarchar(450)",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Agendamentos_applicationUserId",
                table: "Agendamentos",
                column: "applicationUserId");

            migrationBuilder.AddForeignKey(
                name: "FK_Agendamentos_AspNetUsers_applicationUserId",
                table: "Agendamentos",
                column: "applicationUserId",
                principalTable: "AspNetUsers",
                principalColumn: "Id");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Agendamentos_AspNetUsers_applicationUserId",
                table: "Agendamentos");

            migrationBuilder.DropIndex(
                name: "IX_Agendamentos_applicationUserId",
                table: "Agendamentos");

            migrationBuilder.DropColumn(
                name: "applicationUserId",
                table: "Agendamentos");

            migrationBuilder.AddColumn<string>(
                name: "Cliente",
                table: "Agendamentos",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");
        }
    }
}
