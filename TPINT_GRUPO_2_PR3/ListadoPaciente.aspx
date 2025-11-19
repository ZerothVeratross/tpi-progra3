<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListadoPaciente.aspx.cs" Inherits="TPINT_GRUPO_2_PR3.ListadoPaciente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 358px;
        }
        .auto-style3 {
            width: 136px;
        }
        .auto-style4 {
            width: 284px;
        }
        .auto-style5 {
            width: 284px;
            height: 27px;
        }
        .auto-style6 {
            width: 136px;
            height: 27px;
        }
        .auto-style7 {
            width: 358px;
            height: 27px;
        }
        .auto-style8 {
            margin-top: 3px;
        }
        .auto-style9 {
            width: 284px;
            height: 26px;
        }
        .auto-style10 {
            width: 136px;
            height: 26px;
        }
        .auto-style11 {
            width: 358px;
            height: 26px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="lblNombreAdministrador" runat="server"></asp:Label>
                </td>
                <td class="auto-style3">&nbsp;</td>
                <td>
                    <asp:HyperLink ID="hlVolverMenu" runat="server" NavigateUrl="~/MenuAdministrador.aspx">Volver al Menú</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:Label ID="lblListaDePacientes" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Lista de Pacientes"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="lblPorBusqueda" runat="server" Font-Bold="True" Text="Por búsqueda general"></asp:Label>
                </td>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="lblBuscarProvincia0" runat="server" Text="Buscar por DNI, nombre, apellido o sexo" Font-Size="Small"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtBusqueda" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style2">
                    <asp:Button ID="btnBusqueda" runat="server" Text="Buscar" OnClick="btnBusqueda_Click" CssClass="auto-style8" />
                </td>
            </tr>
            <tr>
                <td class="auto-style9">
                    </td>
                <td class="auto-style10">
                    </td>
                <td class="auto-style11"></td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <strong>Por filtro</strong></td>
                <td class="auto-style6">
                </td>
                <td class="auto-style7"></td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="lblBuscarProvincia" runat="server" Text="Buscar por Provincia:"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:DropDownList ID="ddlProvincia" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlProvincia_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
                <td class="auto-style2">
                    <asp:Button ID="btnFiltrar" runat="server" Text="Filtrar" OnClick="btnFiltrar_Click" />
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="lblBuscarLocalidad" runat="server" Text="Buscar por Localidad:"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:DropDownList ID="ddlLocalidad" runat="server">
                    </asp:DropDownList>
                </td>
                <td class="auto-style2">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style2">
                    <br />
                    <asp:Button ID="btnMostrarTodosPacientes" runat="server" Text="Listar todos los pacientes" OnClick="btnMostrarTodosPacientes_Click" />
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    &nbsp;</td>
                <td class="auto-style3">
                    <asp:GridView ID="gvListaPacientes" runat="server" DataKeyNames="DNI" AllowPaging="True" PageSize="2" OnPageIndexChanging="gvListaPacientes_PageIndexChanging" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
                        <AlternatingRowStyle BackColor="#DCDCDC" />
                        <Columns>
                        </Columns>
                        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#0000A9" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#000065" />
                    </asp:GridView>
                </td>
                <td class="auto-style2">&nbsp;</td>
            </tr>
        </table>
        <div>
        </div>
    </form>
</body>
</html>