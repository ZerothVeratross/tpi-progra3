<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TurnosAsignados.aspx.cs" Inherits="TPINT_GRUPO_2_PR3.TurnosAsignados" %>

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
            width: 346px;
        }

        .auto-style3 {
            width: 346px;
            height: 29px;
        }

        .auto-style4 {
            height: 29px;
        }

        .auto-style5 {
            width: 260px;
        }

        .auto-style6 {
            height: 29px;
            width: 260px;
        }

        .auto-style7 {
            width: 346px;
            height: 33px;
        }

        .auto-style8 {
            width: 260px;
            height: 33px;
        }

        .auto-style9 {
            height: 33px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblUsuario" runat="server" Text="Nombre del Médico"></asp:Label>
                    </td>
                    <td class="auto-style5">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style5">
                        <asp:Label ID="lblTurnosAsignados" runat="server" Font-Bold="True" Font-Size="Large" Text="Turnos Asignados"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style5">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblBuscarDni" runat="server" Text="Buscar por DNI:"></asp:Label>
                    </td>
                    <td class="auto-style5">
                        <asp:TextBox ID="txtDNI" runat="server"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="lblBuscarNombre" runat="server" Text="Buscar por nombre:"></asp:Label>
                    </td>
                    <td class="auto-style6">
                        <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style4">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblBuscarApellido" runat="server" Text="Buscar por apellido:"></asp:Label>
                    </td>
                    <td class="auto-style5">
                        <asp:TextBox ID="txtApellido" runat="server"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style7"></td>
                    <td class="auto-style8">
                        <asp:Button ID="btnFiltrar" runat="server" Text="Filtrar" />
                        <asp:Button ID="btnMostrarTodos" runat="server" Text="Mostrar todos" />
                    </td>
                    <td class="auto-style9">
                        <asp:Label ID="lblError" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style5">
                        <asp:GridView ID="gvTurnosAsignados" runat="server">
                        </asp:GridView>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:HyperLink ID="hlMenuAnterior" runat="server" NavigateUrl="~/MenuMedico.aspx">Volver al menú anterior</asp:HyperLink>
                    </td>
                    <td class="auto-style5">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
