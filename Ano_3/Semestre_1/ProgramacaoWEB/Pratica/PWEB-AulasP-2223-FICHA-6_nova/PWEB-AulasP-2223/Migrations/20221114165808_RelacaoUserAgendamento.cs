using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace PWEB_AulasP_2223.Migrations
{
    public partial class RelacaoUserAgendamento : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Cliente",
                table: "Agendamentos");

            migrationBuilder.AddColumn<string>(
                name: "ApplicationUserId",
                table: "Agendamentos",
                type: "nvarchar(450)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.CreateIndex(
                name: "IX_Agendamentos_ApplicationUserId",
                table: "Agendamentos",
                column: "ApplicationUserId");

            migrationBuilder.AddForeignKey(
                name: "FK_Agendamentos_AspNetUsers_ApplicationUserId",
                table: "Agendamentos",
                column: "ApplicationUserId",
                principalTable: "AspNetUsers",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Agendamentos_AspNetUsers_ApplicationUserId",
                table: "Agendamentos");

            migrationBuilder.DropIndex(
                name: "IX_Agendamentos_ApplicationUserId",
                table: "Agendamentos");

            migrationBuilder.DropColumn(
                name: "ApplicationUserId",
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
