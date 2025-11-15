<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgregarPacientes.aspx.cs" Inherits="TPINT_GRUPO_2_PR3.AgregarPacientes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            width: 125px;
        }

        .auto-style3 {
            width: 259px;
        }

        .auto-style4 {
            width: 259px;
            text-align: center;
        }

        .auto-style5 {
            width: 849px;
        }
        .auto-style6 {
            width: 125px;
            height: 58px;
        }
        .auto-style7 {
            width: 259px;
            height: 58px;
        }
        .auto-style8 {
            width: 849px;
            height: 58px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td colspan="2">
                        <asp:Label ID="lblUsuario" runat="server" Font-Italic="True" Font-Overline="False" Font-Size="Larger" Font-Underline="False" Text="Nombre de usuario"></asp:Label>
                    </td>
                    <td class="auto-style5">
                        <asp:HyperLink ID="hlVolver" runat="server" NavigateUrl="~/MenuAdministrador.aspx">Volver al menú</asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="lblTituloAgregar" runat="server" Font-Bold="True" Font-Size="Larger" Text="Agregar los datos del paciente"></asp:Label>
                    </td>
                    <td class="auto-style5">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblDNI" runat="server" Text="DNI"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtDNI" runat="server" Width="250px" MaxLength="9"></asp:TextBox>
                    </td>
                    <td class="auto-style5">
                        <%--<asp:RequiredFieldValidator ID="rfvDNI" runat="server" ErrorMessage="RequiredFieldValidator">Ingresar DNI.</asp:RequiredFieldValidator>--%>                        <%--<asp:RegularExpressionValidator ID="revDNI" runat="server" ErrorMessage="Solo ingresar números."></asp:RegularExpressionValidator>--%>
                        <asp:Label ID="lblMsjDNI" runat="server" Font-Size="Small" Text="Ingresar sólo números sin letras ni espacios."></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblNombre" runat="server" Text="Nombre"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtNombre" runat="server" Width="250px" MaxLength="40"></asp:TextBox>
                    </td>
                    <td class="auto-style5">
                        <%--<asp:RequiredFieldValidator ID="rfvNombre" runat="server" ErrorMessage="Ingresar nombre."></asp:RequiredFieldValidator>--%>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblApellido" runat="server" Text="Apellido"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtApellido" runat="server" Width="250px" MaxLength="40"></asp:TextBox>
                    </td>
                    <td class="auto-style5">
                        <%--<asp:RequiredFieldValidator ID="rfvApellido" runat="server" ErrorMessage="Ingresar Apellido"></asp:RequiredFieldValidator>--%>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6">
                        <asp:Label ID="lblSexo" runat="server" Text="Sexo"></asp:Label>
                    </td>
                    <td class="auto-style7">
                        <asp:RadioButtonList ID="rblSexo" runat="server">
                            <asp:ListItem Value="1">Mujer</asp:ListItem>
                            <asp:ListItem Value="2">Hombre</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td class="auto-style8">
                        <%--<asp:RequiredFieldValidator ID="rfvSexo" runat="server" ErrorMessage="Elegir sexo."></asp:RequiredFieldValidator>--%>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblNacionalidad" runat="server" Text="Nacionalidad"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtNacionalidad" runat="server" Width="250px" MaxLength="40"></asp:TextBox>
                    </td>
                    <td class="auto-style5">
                        <%--<asp:RequiredFieldValidator ID="rfvNacionalidad" runat="server" ErrorMessage="Ingresar nacionalidad."></asp:RequiredFieldValidator>--%>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblNacimiento" runat="server" Text="Fecha de nacimiento"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <%--<asp:Calendar ID="calNacimiento" runat="server"></asp:Calendar>--%>
                        <asp:TextBox ID = "txtFechaNacimiento" runat="server" TextMode="Date"></asp:TextBox>
                                       </td>
                    <td class="auto-style5">
                        <%--<asp:RequiredFieldValidator ID="rfvNacimiento" runat="server" ErrorMessage="Ingresar fecha de nacimiento."></asp:RequiredFieldValidator>--%>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblDireccion" runat="server" Text="Dirección"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtDireccion" runat="server" Width="250px" MaxLength="40"></asp:TextBox>
                    </td>
                    <td class="auto-style5">
                        <%--<asp:RequiredFieldValidator ID="rfvDireccion" runat="server" ErrorMessage="Ingresar dirección."></asp:RequiredFieldValidator>--%>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblProvincia" runat="server" Text="Provincia"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:DropDownList ID="ddlProvincia" runat="server" Height="19px" Width="256px" AutoPostBack="true"
    OnSelectedIndexChanged="ddlProvincia_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style5">
                        <%--<asp:RequiredFieldValidator ID="rfvProvincia" runat="server" ErrorMessage="Elegir provincia."></asp:RequiredFieldValidator>--%>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblLocalidad" runat="server" Text="Localidad"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:DropDownList ID="ddlLocalidad" runat="server" Height="18px" Width="256px">
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style5">
                        <%--<asp:RequiredFieldValidator ID="rfvLocalidad" runat="server" ErrorMessage="Elegir localidad."></asp:RequiredFieldValidator>--%>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblCorreo" runat="server" Text="Correo electrónico"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtCorreo" runat="server" Width="250px" MaxLength="40"></asp:TextBox>
                    </td>
                    <td class="auto-style5">
                        <%--<asp:RequiredFieldValidator ID="rfvCorreo" runat="server" ErrorMessage="Ingresar correo electrónico."></asp:RequiredFieldValidator>--%>
                        <br />
                        <%--<asp:RegularExpressionValidator ID="revCorreo" runat="server" ErrorMessage="Correo inválido."></asp:RegularExpressionValidator>--%>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblTelefono" runat="server" Text="Teléfono"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtTelefono" runat="server" Width="250px" MaxLength="20"></asp:TextBox>
                    </td>
                    <td class="auto-style5">
                        <%--<asp:RegularExpressionValidator ID="rfvTelefono" runat="server" ErrorMessage="Ingresar teléfono."></asp:RegularExpressionValidator>--%>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style4">
                        <asp:Button ID="btnRegistrar" runat="server" Text="Registrar" Width="190px" OnClick="btnRegistrar_Click" />
                    </td>
                    <td class="auto-style5">
                        <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
