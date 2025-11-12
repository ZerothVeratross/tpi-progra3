<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListadoMedico.aspx.cs" Inherits="TPINT_GRUPO_2_PR3.ListadoMedico" %>

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
            width: 260px;
        }

        .auto-style4 {
            width: 385px;
        }

        .auto-style5 {
            width: 359px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td colspan="2">
                        <asp:Label ID="lblNombreAdministrador" runat="server" Font-Bold="False" Font-Italic="True" Font-Size="Larger">Nombre del Administrador</asp:Label>
                    </td>
                    <td class="auto-style5">
                        <asp:HyperLink ID="HyperLinkPaciente" runat="server" NavigateUrl="~/MenuAdministrador.aspx">Volver al Menú</asp:HyperLink>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblListaDePacientes" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Lista de Médicos"></asp:Label>
                    </td>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style5">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="lblInstrucciones" runat="server" Text="Deje vacío los campos que no necesita para filtrar."></asp:Label>
                    </td>
                    <td class="auto-style5">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblBuscarLegajo" runat="server" Text="Buscar por Legajo:"></asp:Label>
                    </td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtLegajo" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style5">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblBuscarNombre" runat="server" Text="Buscar por Nombre:"></asp:Label>
                    </td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style5">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblBuscarApellido" runat="server" Text="Buscar por Apellido:"></asp:Label>
                    </td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtApellido" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style5">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblBuscarDias" runat="server" Text="Buscar por días laborales:"></asp:Label>
                    </td>
                    <td class="auto-style4">
                        <asp:RadioButtonList ID="rblDiasLaborales" runat="server" AutoPostBack="True" Width="194px">
                            <asp:ListItem Value="0">No filtrar</asp:ListItem>
                            <asp:ListItem Value="1">Lunes</asp:ListItem>
                            <asp:ListItem Value="2">Martes</asp:ListItem>
                            <asp:ListItem Value="3">Miercoles</asp:ListItem>
                            <asp:ListItem Value="4">Jueves</asp:ListItem>
                            <asp:ListItem Value="5">Viernes</asp:ListItem>
                            <asp:ListItem Value="6">Sabado</asp:ListItem>
                            <asp:ListItem Value="7">Domingo</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td class="auto-style5">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblBucarEspecialidad" runat="server" Text="Buscar por Especialidad:"></asp:Label>
                        &nbsp;</td>
                    <td class="auto-style4">
                        <asp:DropDownList ID="ddlEspecialidad" runat="server" AutoPostBack="True" AppendDataBoundItems="True">
                            <asp:ListItem Value="0">No filtrar</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style5">
                        <asp:Button ID="btnFiltrar" runat="server" Text="Filtrar" OnClick="btnFiltrar_Click" />
                        <asp:Button ID="btnMostrarTodosMedicos" runat="server" Text="Listar todos los medicos" OnClick="btnMostrarTodosMedicos_Click" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style5">
                        &nbsp;
                        </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td colspan="3">
                        <asp:GridView ID="gvListaMedicos" runat="server">
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style5">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
