<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Informes.aspx.cs" Inherits="TPINT_GRUPO_2_PR3.WebForm4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="StyleSheet.css" type="text/css" />
</head>



<body>
    <style>
        <!-- Por alguna razon no pude incluir esto en la stylesheet. El navegador simplemente lo ignoraba. -->
        #cblOpciones label { display: inline-block; margin-bottom: 6px; }
        #cblOpciones input[type="checkbox"] { margin-right: 8px; accent-color: #3a7ca5; }
    </style>
    <form id="form1" runat="server">
        <table class="Tabla">
            <tr>
                <td>
                    <asp:Label ID="lblNombreAdministrador" runat="server" Font-Bold="False" Font-Italic="True" Font-Size="Larger" CssClass="LabelUsuario">Nombre del Administrador</asp:Label>
                </td>
                <td>&nbsp;</td>
                <td class="CeldaHyperlink">
                    <asp:HyperLink ID="HyperLinkPaciente" runat="server" NavigateUrl="~/MenuAdministrador.aspx" CssClass="HyperLink" Font-Underline="True">Volver al Menú</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblTituloInforme" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Informes" CssClass="Titulo"></asp:Label>
                </td>
                <td class="CeldaLabel" colspan="2">
                    <asp:Label ID="lblMensaje" runat="server" Font-Size="Large" CssClass="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:DropDownList ID="ddlInforme" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlInforme_SelectedIndexChanged" CssClass="DropDownList">
                        <asp:ListItem Value="0" Selected="True">Elija un informe</asp:ListItem>
                        <asp:ListItem Value="1">Asistencia a Turnos</asp:ListItem>
                        <asp:ListItem Value="2">Pacientes por localidad</asp:ListItem>
                        <asp:ListItem Value="3">Médicos disponibles</asp:ListItem>
                        <asp:ListItem Value="4">Especialidad de Turnos</asp:ListItem>
                        <asp:ListItem Value="5">Turnos por Médico</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="CeldaDerecha">
                    <asp:TextBox ID="txtFechaMenor" runat="server" TextMode="Date" Visible="False" CssClass="TextBoxFecha"></asp:TextBox>
                    <asp:Label ID="lblSeparador" runat="server" Text="-" Visible="False" CssClass="Label" Font-Size="X-Large"></asp:Label>
                    <asp:TextBox ID="txtFechaMayor" runat="server" TextMode="Date" Visible="False" CssClass="TextBoxFecha"></asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="btnInforme" runat="server" OnClick="btnInforme_Click" Text="Generar Informe" CssClass="Boton"/>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:CheckBoxList ID="cblOpciones" runat="server" AutoPostBack="True" OnSelectedIndexChanged="CheckBoxList1_SelectedIndexChanged" Visible="False">
                    </asp:CheckBoxList>
                </td>
                <td colspan="2">
                    <asp:GridView ID="gvInforme" runat="server" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" PageSize="2" CssClass="GridView">
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
        </table>
    </form>
</body>
</html>
