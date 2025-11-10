<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListadoPaciente.aspx.cs" Inherits="TPINT_GRUPO_2_PR3.ListadoPaciente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
                <td>
                    <asp:Label ID="lblNombreAdministrador" runat="server">Nombre del Administrador</asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>
                    <asp:HyperLink ID="hlVolverMenu" runat="server" NavigateUrl="~/MenuAdministrador.aspx">Volver al Menú</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblListaDePacientes" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Lista de Pacientes"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblBuscarDNI" runat="server" Text="Buscar por DNI:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtDNI" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblBuscarNombre" runat="server" Text="Buscar por Nombre:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblBuscarApellido" runat="server" Text="Buscar por Apellido:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtApellido" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblBuscarNacionalidad" runat="server" Text="Buscar por Nacionalidad:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtNacionalidad" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblBuscarProvincia" runat="server" Text="Buscar por Provincia:"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlProvincia" runat="server" AutoPostBack="True">
                        <asp:ListItem Value="0">--Seleccionar Provincia--</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblBuscarLocalidad" runat="server" Text="Buscar por Localidad:"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlLocalidad" runat="server" AutoPostBack="True">
                        <asp:ListItem Value="0">--Seleccionar Localidad--</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>
                    <asp:Button ID="btnFiltrar" runat="server" Text="Filtrar" />
                    &nbsp;
                    <asp:Button ID="btnMostrarTodosPacientes" runat="server" Text="Listar todos los pacientes" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:GridView ID="gvListaPacientes" runat="server">
                    </asp:GridView>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <div>
        </div>
    </form>
</body>
</html>
