<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AsignacionTurnos.aspx.cs" Inherits="TPINT_GRUPO_2_PR3.AsignacionTurnos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            height: 29px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td>
                        <asp:Label ID="lblAdmin" runat="server" Text="Nombre del Administrador"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblAsignarTurno" runat="server" Text="Asignar Turno" Style="font-weight: bold;"></asp:Label>
                    </td>
                    <td>
                        <asp:HyperLink ID="hlVolverMenu" runat="server" NavigateUrl="~/MenuAdministrador.aspx">Volver al Menú</asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblDniPaciente" runat="server" Text="Ingrese el DNI del paciente:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtDni" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <%--<asp:RequiredFieldValidator ID="rfvDni" runat="server" ControlToValidate="txtDni" ErrorMessage="Ingresar DNI."></asp:RequiredFieldValidator>--%>
                        <br />
                        <%--<asp:RegularExpressionValidator ID="revDni" runat="server" ControlToValidate="txtDni" ErrorMessage="Unicamente ingresar numeros"></asp:RegularExpressionValidator>--%>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblEspecialidad" runat="server" Text="Ingrese la especialidad:"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlEspecialidad" runat="server">
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style2">
                        <%--<asp:RequiredFieldValidator ID="rfvEspecialidad" runat="server" ControlToValidate="ddlEspecialidad" ErrorMessage="Escoja la especialidad"></asp:RequiredFieldValidator>--%>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblCalendarioDia" runat="server" Text="Seleccione el día:"></asp:Label>
                    </td>
                    <td>
                        <asp:Calendar ID="CalendarFecha" runat="server" BackColor="White" BorderColor="Black" DayNameFormat="Shortest" Font-Names="Times New Roman" Font-Size="10pt" ForeColor="Black" Height="220px" NextPrevFormat="FullMonth" TitleFormat="Month" Width="400px">
                            <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" ForeColor="#333333" Height="10pt" />
                            <DayStyle Width="14%" />
                            <NextPrevStyle Font-Size="8pt" ForeColor="White" />
                            <OtherMonthDayStyle ForeColor="#999999" />
                            <SelectedDayStyle BackColor="#CC3333" ForeColor="White" />
                            <SelectorStyle BackColor="#CCCCCC" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt" ForeColor="#333333" Width="1%" />
                            <TitleStyle BackColor="Black" Font-Bold="True" Font-Size="13pt" ForeColor="White" Height="14pt" />
                            <TodayDayStyle BackColor="#CCCC99" />
                        </asp:Calendar>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblHorario" runat="server" Text="Seleccione el horario:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtHora" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtHora" ErrorMessage="Ingrese el horario"></asp:RequiredFieldValidator>--%>
                        <br />
                        <%--<asp:RegularExpressionValidator ID="RevHorario" runat="server" ControlToValidate="txtHora" ErrorMessage="Unicamente ingresar numeros!"></asp:RegularExpressionValidator>--%>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblMedico" runat="server" Text="Seleccione al medico:"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlMedico" runat="server">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <%--<asp:RequiredFieldValidator ID="rfvMedicos" runat="server" ControlToValidate="ddlMedico" ErrorMessage="Escoja un medico"></asp:RequiredFieldValidator>--%>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblMensaje" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Button ID="btnRegistrarTurno" runat="server" Text="Registrar Turno" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
