<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrarAsistencias.aspx.cs" Inherits="TPINT_GRUPO_2_PR3.RegistrarAsistencias" %>

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
            width: 269px;
        }

        .auto-style3 {
            width: 298px;
        }

        .auto-style4 {
            width: 269px;
            height: 33px;
        }

        .auto-style5 {
            width: 298px;
            height: 33px;
        }

        .auto-style6 {
            height: 33px;
        }

        .auto-style7 {
            width: 110px;
        }

        .auto-style8 {
            height: 33px;
            width: 110px;
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
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">
                        <asp:Label ID="lblRegistrarAsistencias" runat="server" Font-Bold="True" Font-Size="Large" Text="Registrar Asistencias"></asp:Label>
                    </td>
                    <td class="auto-style7">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblFiltrarPorDia" runat="server" Text="Filtrar por día:"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
                    </td>
                    <td class="auto-style7">
                        <asp:Button ID="btnFiltrar" runat="server" Text="Filtrar" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:Label ID="lblBuscarPorNombre" runat="server" Text="Buscar por nombre:"></asp:Label>
                    </td>
                    <td class="auto-style5">
                        <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style8">
                        <asp:Button ID="btnBuscar" runat="server" Text="Buscar" />
                    </td>
                    <td class="auto-style6">
                        <asp:Label ID="lblError" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">
                        <asp:GridView ID="gvListadoAsistencia" runat="server">
                        </asp:GridView>
                    </td>
                    <td class="auto-style7">
                        <asp:Button ID="btnGuardar" runat="server" Text="Guardar" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:HyperLink ID="hlMenuAnterior" runat="server" NavigateUrl="~/MenuMedico.aspx">Volver al menú anterior</asp:HyperLink>
                    </td>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
