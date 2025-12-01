<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Informes.aspx.cs" Inherits="TPINT_GRUPO_2_PR3.WebForm4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 30px;
        }
        .auto-style3 {
            width: 298px;
        }
        .auto-style4 {
            height: 30px;
            width: 298px;
        }
        .auto-style5 {
            width: 395px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="lblNombreAdministrador" runat="server" Font-Bold="False" Font-Italic="True" Font-Size="Larger">Nombre del Administrador</asp:Label>
                    </td>
                    <td class="auto-style5">&nbsp;</td>
                    <td>
                        <asp:HyperLink ID="HyperLinkPaciente" runat="server" NavigateUrl="~/MenuAdministrador.aspx">Volver al Menú</asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:Label ID="lblTituloInforme" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Informes"></asp:Label>
                    </td>
                    <td class="auto-style2" colspan="2">
                        <asp:Label ID="lblMensaje" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:DropDownList ID="ddlInforme" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlInforme_SelectedIndexChanged">
                            <asp:ListItem Value="0" Selected="True">Elija un informe</asp:ListItem>
                            <asp:ListItem Value="1">Asistencia a Turnos</asp:ListItem>
                            <asp:ListItem Value="2">Pacientes</asp:ListItem>
                            <asp:ListItem Value="3">Médicos</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style5">
                        <asp:TextBox ID="txtFechaMenor" runat="server" TextMode="Date" Visible="False"></asp:TextBox>
                        <asp:Label ID="lblSeparador" runat="server" Text="-" Visible="False"></asp:Label>
                        <asp:TextBox ID="txtFechaMayor" runat="server" TextMode="Date" Visible="False"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="btnInforme" runat="server" OnClick="btnInforme_Click" Text="Generar Informe" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td colspan="2">
                        <asp:GridView ID="gvInforme" runat="server" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" PageSize="2">
                            <AlternatingRowStyle BackColor="Gainsboro" />
                            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#0000A9" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#000065" />
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style5">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
