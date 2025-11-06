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
            width: 310px;
        }
        .auto-style3 {
            width: 234px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblDarBajaPaciente" runat="server" Font-Bold="True" Font-Size="Larger" Text="Dar de baja paciente"></asp:Label>
                    </td>
                    <td class="auto-style3">&nbsp;</td>
                    <td>
                        <asp:HyperLink ID="hlVolverMenu" runat="server">Volver al menú</asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblDNI" runat="server" Text="Ingrese el DNI del paciente que desea dar de baja:"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtDNI" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="btnDarBaja" runat="server" Text="Dar de baja" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblMensaje" runat="server"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:RequiredFieldValidator ID="rfvDNI" runat="server" ErrorMessage="DNI requerido."></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revDNI" runat="server" ErrorMessage="Solo ingrese números."></asp:RegularExpressionValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">
                        <asp:GridView ID="gvPacienteABorrar" runat="server">
                        </asp:GridView>
                    </td>
                    <td>
                        <asp:Button ID="btnConfirmar" runat="server" Text="Confirmar" />
                        <asp:Button ID="btnCerrar" runat="server" Text="Cerrar" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
