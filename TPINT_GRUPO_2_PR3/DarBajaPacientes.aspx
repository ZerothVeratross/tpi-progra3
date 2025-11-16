<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DarBajaPacientes.aspx.cs" Inherits="TPINT_GRUPO_2_PR3.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 592px;
        }
        .auto-style3 {
            width: 234px;
        }
        .auto-style5 {
            width: 849px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td colspan="2">
                        <asp:Label ID="lblUsuario" runat="server" Font-Italic="True" Font-Overline="False" Font-Size="Larger" Font-Underline="False"></asp:Label>
                    </td>
                    <td class="auto-style5">
                        <asp:HyperLink ID="hlVolver" runat="server" NavigateUrl="~/MenuAdministrador.aspx">Volver al menú</asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblDarBajaPaciente" runat="server" Font-Bold="True" Font-Size="Larger" Text="Dar de baja paciente"></asp:Label>
                    </td>
                    <td class="auto-style3">&nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblDNI" runat="server" Text="Ingrese el DNI del paciente que desea dar de baja:"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtDNI" runat="server" MaxLength="9"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="lblMsjDNI" runat="server" Font-Size="Small" Text="Ingresar sólo números sin letras ni espacios."></asp:Label>
                        <br />
                        <asp:Button ID="btnDarBaja" runat="server" Text="Dar de baja" OnClick="btnDarBaja_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        &nbsp;</td>
                    <td class="auto-style3">
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblMensaje" runat="server"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:GridView ID="gvPacienteABorrar" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" Visible="False">
                            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F7F7F7" />
                            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                            <SortedDescendingCellStyle BackColor="#E5E5E5" />
                            <SortedDescendingHeaderStyle BackColor="#242121" />
                        </asp:GridView>
                    </td>
                    <td>
                        <asp:Button ID="btnConfirmar" runat="server" Text="Confirmar" OnClick="btnConfirmar_Click" />
                        <asp:Button ID="btnCerrar" runat="server" Text="Cerrar" OnClick="btnCerrar_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>