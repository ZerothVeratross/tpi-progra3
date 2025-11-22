<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReactivarPaciente.aspx.cs" Inherits="TPINT_GRUPO_2_PR3.ReactivarPaciente" %>

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
            width: 303px;
        }
        .auto-style3 {
            width: 355px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblNombreAdministrador" runat="server"></asp:Label>
                </td>
                <td class="auto-style3">&nbsp;</td>
                <td>
                    <asp:HyperLink ID="hlVolverMenu" runat="server" NavigateUrl="~/MenuAdministrador.aspx">Volver al Menú</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblReactivarPacientes" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Reactivar de Pacientes"></asp:Label>
                </td>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblPorBusqueda" runat="server" Font-Bold="True" Text="Por búsqueda general"></asp:Label>
                </td>
                <td class="auto-style3">
                    &nbsp;</td>
                <td>
                &nbsp;
                    </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblBuscarProvincia0" runat="server" Text="Buscar por DNI, nombre o apellido" Font-Size="Small"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtBusqueda" runat="server" Width="220px"></asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblPorFiltro" runat="server" Font-Bold="True" Text="Por filtro"></asp:Label>
                </td>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblBuscarProvincia" runat="server" Text="Buscar por Provincia:" Font-Size="Small"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:DropDownList ID="ddlProvincia" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlProvincia_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:Button ID="btnFiltrar" runat="server" Text="Filtrar" OnClick="btnFiltrar_Click" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblBuscarPorLocalidad" runat="server" Text="Buscar por Localidad:" Font-Size="Small"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:DropDownList ID="ddlLocalidad" runat="server">
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td>
                    <asp:Button ID="btnLimpiarTodosLosPacientes" runat="server" Text="Mostrar todos los pacientes" OnClick="btnLimpiarTodosLosPacientes_Click" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    &nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    &nbsp;</td>
                <td class="auto-style3" rowspan="6">
                    <asp:GridView ID="gvListaReactivarPacientes" runat="server" AllowPaging="True" PageSize="2" DataKeyNames="DNI" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" OnPageIndexChanging="gvListaReactivarPacientes_PageIndexChanging" OnRowCommand="gvListaReactivarPacientes_RowCommand">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="btnReactivar" runat="server" Text="Reactivar" CommandName="Reactivar" CommandArgument='<%# Eval("DNI") %>' CssClass="btn btn-success" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <AlternatingRowStyle BackColor="Gainsboro" />
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
                <td rowspan="6">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblMensajeAConfirmar" runat="server"></asp:Label>
                    </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" Visible="False" OnClick="btnAceptar_Click" />
                &nbsp;
                    <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" Visible="False" OnClick="btnCancelar_Click" />
                    </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <div>
        </div>
    </form>
</body>
</html>
