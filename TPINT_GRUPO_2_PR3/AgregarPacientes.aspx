<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgregarPacientes.aspx.cs" Inherits="TPINT_GRUPO_2_PR3.AgregarPacientes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Agregar Paciente</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="CentrarContenido">
            <div class="Contenedor">
                
                <asp:Label ID="lblUsuario" runat="server" CssClass="LabelUsuario" Text="Nombre de usuario"></asp:Label>
               
                <br /><br />
                
                <asp:Label ID="lblTituloAgregar" runat="server" CssClass="Titulo" 
                    Text="Agregar los datos del paciente"></asp:Label>

                <asp:Label ID="lblDNI" runat="server" CssClass="Label" Text="DNI"></asp:Label>
                <asp:TextBox ID="txtDNI" runat="server" CssClass="TextBox" MaxLength="9"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvDNI" runat="server" CssClass="msg-error" 
                    ControlToValidate="txtDNI" ErrorMessage="Ingresar DNI."></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revDNI" runat="server" CssClass="msg-error" 
                    ControlToValidate="txtDNI" ValidationExpression="^\d+$" 
                    ErrorMessage="Solo ingresar números."></asp:RegularExpressionValidator>

                <asp:Label ID="lblNombre" runat="server" CssClass="Label" Text="Nombre"></asp:Label>
                <asp:TextBox ID="txtNombre" runat="server" CssClass="TextBox" MaxLength="40"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvNombre" runat="server" CssClass="msg-error" 
                    ControlToValidate="txtNombre" ErrorMessage="Ingresar nombre."></asp:RequiredFieldValidator>

                <asp:Label ID="lblApellido" runat="server" CssClass="Label" Text="Apellido"></asp:Label>
                <asp:TextBox ID="txtApellido" runat="server" CssClass="TextBox" MaxLength="40"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvApellido" runat="server" CssClass="msg-error" 
                    ControlToValidate="txtApellido" ErrorMessage="Ingresar Apellido"></asp:RequiredFieldValidator>

                <asp:Label ID="lblSexo" runat="server" CssClass="Label" Text="Sexo"></asp:Label>
                <asp:RadioButtonList ID="rblSexo" runat="server" CssClass="RadioButton" RepeatDirection="Horizontal">
                    <asp:ListItem Value="1">Mujer</asp:ListItem>
                    <asp:ListItem Value="2">Hombre</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="rfvSexo" runat="server" CssClass="msg-error" 
                    ControlToValidate="rblSexo" ErrorMessage="Elegir sexo."></asp:RequiredFieldValidator>

                <asp:Label ID="lblNacionalidad" runat="server" CssClass="Label" Text="Nacionalidad"></asp:Label>
                <asp:TextBox ID="txtNacionalidad" runat="server" CssClass="TextBox" MaxLength="40"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvNacionalidad" runat="server" CssClass="msg-error" 
                    ControlToValidate="txtNacionalidad" ErrorMessage="Ingresar nacionalidad."></asp:RequiredFieldValidator>

                <asp:Label ID="lblNacimiento" runat="server" CssClass="Label" Text="Fecha de nacimiento"></asp:Label>
                <asp:TextBox ID="txtFechaNacimiento" runat="server" CssClass="TextBox" TextMode="Date"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvNacimiento" runat="server" CssClass="msg-error" 
                    ControlToValidate="txtFechaNacimiento" ErrorMessage="Ingresar fecha de nacimiento."></asp:RequiredFieldValidator>

                <asp:Label ID="lblDireccion" runat="server" CssClass="Label" Text="Dirección"></asp:Label>
                <asp:TextBox ID="txtDireccion" runat="server" CssClass="TextBox" MaxLength="40"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvDireccion" runat="server" CssClass="msg-error" 
                    ControlToValidate="txtDireccion" ErrorMessage="Ingresar dirección."></asp:RequiredFieldValidator>

                <asp:Label ID="lblProvincia" runat="server" CssClass="Label" Text="Provincia"></asp:Label>
                <asp:DropDownList ID="ddlProvincia" runat="server" CssClass="DropDownList" AutoPostBack="true"
                    OnSelectedIndexChanged="ddlProvincia_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvProvincia" runat="server" CssClass="msg-error" 
                    ControlToValidate="ddlProvincia" InitialValue="0" ErrorMessage="Elegir provincia."></asp:RequiredFieldValidator>

                <asp:Label ID="lblLocalidad" runat="server" CssClass="Label" Text="Localidad"></asp:Label>
                <asp:DropDownList ID="ddlLocalidad" runat="server" CssClass="DropDownList">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvLocalidad" runat="server" CssClass="msg-error" 
                    ControlToValidate="ddlLocalidad" InitialValue="0" ErrorMessage="Elegir localidad."></asp:RequiredFieldValidator>

                <asp:Label ID="lblCorreo" runat="server" CssClass="Label" Text="Correo electrónico"></asp:Label>
                <asp:TextBox ID="txtCorreo" runat="server" CssClass="TextBox" MaxLength="40"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvCorreo" runat="server" CssClass="msg-error" 
                    ControlToValidate="txtCorreo" ErrorMessage="Ingresar correo electrónico."></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revCorreo" runat="server" CssClass="msg-error" 
                    ControlToValidate="txtCorreo" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                    ErrorMessage="Correo inválido."></asp:RegularExpressionValidator>

                <asp:Label ID="lblTelefono" runat="server" CssClass="Label" Text="Teléfono"></asp:Label>
                <asp:TextBox ID="txtTelefono" runat="server" CssClass="TextBox" MaxLength="20"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvTelefono" runat="server" CssClass="msg-error" 
                    ControlToValidate="txtTelefono" ErrorMessage="Ingresar teléfono."></asp:RequiredFieldValidator>

                <br />
                <table class="auto-style1">
                    <tr>
                        <td>

                <asp:Button ID="btnRegistrar" runat="server" CssClass="Boton" 
                    Text="Registrar" OnClick="btnRegistrar_Click" />

                <asp:Label ID="lblError" runat="server" CssClass="msg-error"></asp:Label>

                        </td>
                    </tr>
                </table>
                <br />
                 <asp:HyperLink ID="hlVolver" runat="server" CssClass="HyperLink" NavigateUrl="~/MenuAdministrador.aspx">Volver al menú</asp:HyperLink>
            </div>
        </div>
    </form>
</body>
</html>
