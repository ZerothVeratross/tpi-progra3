<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModificarPacientes.aspx.cs" Inherits="TPINT_GRUPO_2_PR3.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style5 {
            width: 849px;
        }

        .auto-style2 {
            width: 486px;
        }

        .auto-style3 {
            width: 259px;
        }

        .auto-style4 {
            width: 259px;
            text-align: center;
        }

        .auto-style6 {
            width: 486px;
            height: 26px;
        }

        .auto-style7 {
            width: 259px;
            height: 26px;
        }

        .auto-style8 {
            width: 849px;
            height: 26px;
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
                        <asp:Label ID="lblTituloModificar" runat="server" Font-Bold="True" Font-Size="Larger" Text="Modificar los datos del paciente"></asp:Label>
                    </td>
                    <td class="auto-style5">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblDNI" runat="server" Text="Ingrese el DNI del paciente que modificará: "></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtDNI" runat="server" Width="250px"></asp:TextBox>
                    </td>
                    <td class="auto-style5">
                        <%--<asp:RegularExpressionValidator ID="revDNI" runat="server" ErrorMessage="Solo ingresar números."></asp:RegularExpressionValidator>--%>
                        <asp:Label ID="lblMsjDNI" runat="server" Font-Size="Small" Text="Ingresar sólo números"></asp:Label>
                        <br />
                        <asp:Button ID="btnBuscarDNI" runat="server" OnClick="btnBuscarDNI_Click" Text="Buscar" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        &nbsp;</td>
                    <td class="auto-style3">
                        <asp:Label ID="lblMensajeDNI" runat="server"></asp:Label>
                    </td>
                    <td class="auto-style5">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style6">
                        <asp:Label ID="lblNombre" runat="server" Text="Nombre"></asp:Label>
                        :</td>
                    <td class="auto-style7">
                        <asp:TextBox ID="txtNombre" runat="server" Width="250px"></asp:TextBox>
                    </td>
                    <td class="auto-style8">
                        <asp:RegularExpressionValidator ID="revNombre" runat="server" ControlToValidate="txtNombre" ErrorMessage="Solamente letras y espacios" ValidationExpression="^[A-Za-zÁÉÍÓÚáéíóúÑñ ]{1,40}$" ForeColor="Red"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6">
                        <asp:Label ID="lblApellido" runat="server" Text="Apellido"></asp:Label>
                        :</td>
                    <td class="auto-style7">
                        <asp:TextBox ID="txtApellido" runat="server" Width="250px"></asp:TextBox>
                    </td>
                    <td class="auto-style8">
                        <asp:RegularExpressionValidator ID="revApellido" runat="server" ControlToValidate="txtApellido" ErrorMessage="Solamente letras y espacios" ValidationExpression="^[A-Za-zÁÉÍÓÚáéíóúÑñ ]{1,40}$" ForeColor="Red"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblSexo" runat="server" Text="Sexo"></asp:Label>
                        :</td>
                    <td class="auto-style3">
                        <asp:RadioButtonList ID="rblSexo" runat="server">
                            <asp:ListItem Value="Femenino">Femenino</asp:ListItem>
                            <asp:ListItem Value="Masculino">Masculino</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td class="auto-style5">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblNacionalidad" runat="server" Text="Nacionalidad"></asp:Label>
                        :</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtNacionalidad" runat="server" Width="250px"></asp:TextBox>
                    </td>
                    <td class="auto-style5">
                        <asp:RegularExpressionValidator ID="revNacionalidad" runat="server" ControlToValidate="txtNacionalidad" ErrorMessage="Solamente letras y espacios" ValidationExpression="^[A-Za-zÁÉÍÓÚáéíóúÑñ ]{1,40}$" ForeColor="Red"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblNacimiento" runat="server" Text="Fecha de nacimiento"></asp:Label>
                        :</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="calNacimiento" runat="server" TextMode="Date">&lt;</asp:TextBox>
                    </td>
                    <td class="auto-style5">
                        <asp:Label ID="lblMensajeFecha" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblDireccion" runat="server" Text="Dirección"></asp:Label>
                        :</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtDireccion" runat="server" Width="250px"></asp:TextBox>
                    </td>
                    <td class="auto-style5">
                        <asp:RegularExpressionValidator ID="revDireccion" runat="server" ControlToValidate="txtDireccion" ErrorMessage="Dirección inválida" ValidationExpression="^[A-Za-zÁÉÍÓÚáéíóúÑñ0-9 ]{1,40}$" ForeColor="Red"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblProvincia" runat="server" Text="Provincia"></asp:Label>
                        :</td>
                    <td class="auto-style3">
                        <asp:DropDownList ID="ddlProvincia" runat="server" AutoPostBack="True" Height="19px" OnSelectedIndexChanged="ddlProvincia_SelectedIndexChanged" Width="256px">
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style5">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblLocalidad" runat="server" Text="Localidad"></asp:Label>
                        :</td>
                    <td class="auto-style3">
                        <asp:DropDownList ID="ddlLocalidad" runat="server" Height="18px" Width="256px">
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style5">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblCorreo" runat="server" Text="Correo electrónico"></asp:Label>
                        :</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtCorreo" runat="server" Width="250px"></asp:TextBox>
                    </td>
                    <td class="auto-style5">
                        <%--<asp:RegularExpressionValidator ID="revCorreo" runat="server" ErrorMessage="Correo inválido."></asp:RegularExpressionValidator>--%>
                        <asp:RegularExpressionValidator ID="revCorreo" runat="server" ControlToValidate="txtCorreo" ErrorMessage="Correo inválido" ValidationExpression="^(?=.{1,40}$)[^@\s]+@[^@\s]+\.[^@\s]+$" ForeColor="Red"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6">
                        <asp:Label ID="lblTelefono" runat="server" Text="Teléfono"></asp:Label>
                        :</td>
                    <td class="auto-style7">
                        <asp:TextBox ID="txtTelefono" runat="server" Width="250px"></asp:TextBox>
                    </td>
                    <td class="auto-style8">
                        <asp:RegularExpressionValidator ID="revTelefono" runat="server" ControlToValidate="txtTelefono" ErrorMessage="Telefono inválido" ValidationExpression="^\d{6,10}$" ForeColor="Red"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style4">
                        <asp:Button ID="btnModificar" runat="server" Enabled="False" OnClick="btnModificar_Click" Text="Modificar" Width="190px" />
                    </td>
                    <td class="auto-style5">
                        <asp:Label ID="lblNoModifico" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
