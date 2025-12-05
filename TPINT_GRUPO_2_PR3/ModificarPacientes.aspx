<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModificarPacientes.aspx.cs" Inherits="TPINT_GRUPO_2_PR3.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
    <title>Reactivar Pacientes</title>    
</head>
<body>

    <form id="form1" runat="server">
        <div class="Contenedor">
            <asp:Label ID="lblNombreAdministrador" runat="server" Text="Nombre del Adminitrador" CssClass="LabelUsuario"></asp:Label>
            <div>
                <asp:Label ID="lblModificarPacientes" runat="server" class="form-title" Text="Modificar los datos del paciente" CssClass="Titulo"></asp:Label>
            </div>
            <div>
                <asp:Label ID="lblDNI" runat="server" Text="Ingrese el DNI del paciente que modificará: " CssClass="Label"></asp:Label>
                 <asp:TextBox ID="txtDNI" runat="server" Width="250px" CssClass="TextBox"></asp:TextBox>
                <asp:Label ID="lblMsjDNI" runat="server" Text="Ingresar sólo números" CssClass="Label" Font-Bold="True"></asp:Label>
                <asp:Button ID="btnBuscarDNI" runat="server" OnClick="btnBuscarDNI_Click" Text="Buscar" ValidationGroup="grupo1" CssClass="Boton"/>
            </div>
            <div>
                <asp:Label ID="lblError" runat="server" CssClass="msg-error"></asp:Label>
                <asp:Label ID="lblExito" runat="server" CssClass="msg-exito"></asp:Label>
            </div>
            <div>
                <asp:Label ID="lblNombre" runat="server" Text="Nombre" CssClass="Label"></asp:Label>
                 <asp:TextBox ID="txtNombre" runat="server" Width="250px" CssClass="TextBox"></asp:TextBox>
                <asp:RegularExpressionValidator ID="revNombre" runat="server" ControlToValidate="txtNombre" ErrorMessage="Solamente letras y espacios" ValidationExpression="^[A-Za-zÁÉÍÓÚáéíóúÑñ ]{1,40}$" CssClass="msg-error" ValidationGroup="grupo2"></asp:RegularExpressionValidator>
                &nbsp;<asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre" ErrorMessage="Ingrese Nombre" ValidationGroup="grupo2" CssClass="msg-error"></asp:RequiredFieldValidator>         
            </div>
            <div>
                 <asp:Label ID="lblApellido" runat="server" Text="Apellido" CssClass="Label"></asp:Label>
                 <asp:TextBox ID="txtApellido" runat="server" Width="250px" CssClass="TextBox"></asp:TextBox>
                <asp:RegularExpressionValidator ID="revApellido" runat="server" ControlToValidate="txtApellido" ErrorMessage="Solamente letras y espacios" ValidationExpression="^[A-Za-zÁÉÍÓÚáéíóúÑñ ]{1,40}$" CssClass="msg-error" ValidationGroup="grupo2"></asp:RegularExpressionValidator>
                &nbsp;<asp:RequiredFieldValidator ID="rfvApellido" runat="server" ControlToValidate="txtApellido" ErrorMessage="Ingrese Apellido" ValidationGroup="grupo2" CssClass="msg-error"></asp:RequiredFieldValidator>
            </div>
            <div>
                <asp:Label ID="lblSexo" runat="server" Text="Sexo" CssClass="Label"></asp:Label>
                <asp:RadioButtonList ID="rblSexo" runat="server" CssClass="RadioButton">
                    <asp:ListItem Value="Femenino">Femenino</asp:ListItem>
                    <asp:ListItem Value="Masculino">Masculino</asp:ListItem>
                </asp:RadioButtonList>
            </div>
            <div>
                <asp:Label ID="lblNacionalidad" runat="server" Text="Nacionalidad" CssClass="Label"></asp:Label>
                <asp:TextBox ID="txtNacionalidad" runat="server" Width="250px" CssClass="TextBox"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="revNacionalidad" runat="server" ControlToValidate="txtNacionalidad" ErrorMessage="Solamente letras y espacios" ValidationExpression="^[A-Za-zÁÉÍÓÚáéíóúÑñ ]{1,40}$" CssClass="msg-error" ValidationGroup="grupo2"></asp:RegularExpressionValidator>
                &nbsp;<asp:RequiredFieldValidator ID="rfvNacionalidad" runat="server" ControlToValidate="txtNacionalidad" ErrorMessage="Ingrese Nacionalidad" ValidationGroup="grupo2" CssClass="msg-error"></asp:RequiredFieldValidator>
            </div>
            <div>
                <asp:Label ID="lblNacimiento" runat="server" Text="Fecha de nacimiento" CssClass="Label"></asp:Label>
                <asp:TextBox ID="calNacimiento" runat="server" CssClass="Calendario" TextMode="Date">&lt;</asp:TextBox>
                    <asp:Label ID="lblMensajeFecha" runat="server" CssClass="msg-error"></asp:Label>
                &nbsp;<asp:RequiredFieldValidator ID="rfvFecha" runat="server" ControlToValidate="calNacimiento" ErrorMessage="Ingrese fecha" ValidationGroup="grupo2" CssClass="msg-error"></asp:RequiredFieldValidator>     
            </div>
            <div>
                <asp:Label ID="lblDireccion" runat="server" Text="Dirección" CssClass="Label"></asp:Label>
                <asp:TextBox ID="txtDireccion" runat="server" Width="250px" CssClass="TextBox"></asp:TextBox>
                <asp:RegularExpressionValidator ID="revDireccion" runat="server" ControlToValidate="txtDireccion" ErrorMessage="Dirección inválida" ValidationExpression="^[A-Za-zÁÉÍÓÚáéíóúÑñ0-9 ]{1,40}$" CssClass="msg-error" ValidationGroup="grupo2"></asp:RegularExpressionValidator>
                &nbsp;<asp:RequiredFieldValidator ID="rfvdireccion" runat="server" ControlToValidate="txtDireccion" ErrorMessage="Ingrese direccion" ValidationGroup="grupo2" CssClass="msg-error"></asp:RequiredFieldValidator>     
            </div>
            <div>
                 <asp:Label ID="lblProvincia" runat="server" Text="Provincia" CssClass="Label"></asp:Label>
                <asp:DropDownList ID="ddlProvincia" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlProvincia_SelectedIndexChanged" Width="256px" CssClass="DropDownList">
                </asp:DropDownList>
            </div>
            <div>
                <asp:Label ID="lblLocalidad" runat="server" Text="Localidad" CssClass="Label"></asp:Label>
                <asp:DropDownList ID="ddlLocalidad" runat="server" Width="256px" CssClass="DropDownList">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvdireccion0" runat="server" ControlToValidate="ddlLocalidad" ErrorMessage="Ingrese localidad" ValidationGroup="grupo2" CssClass="msg-error" InitialValue="0"></asp:RequiredFieldValidator>
            </div>
            <div>
                <asp:Label ID="lblCorreo" runat="server" Text="Correo electrónico" CssClass="Label"></asp:Label>
                <asp:TextBox ID="txtCorreo" runat="server" Width="250px" CssClass="TextBox"></asp:TextBox>
                <asp:RegularExpressionValidator ID="revCorreo" runat="server" ControlToValidate="txtCorreo" ErrorMessage="Correo inválido" ValidationExpression="^(?=.{1,40}$)[^@\s]+@[^@\s]+\.[^@\s]+$" CssClass="msg-error" ValidationGroup="grupo2"></asp:RegularExpressionValidator>
                &nbsp;<asp:RequiredFieldValidator ID="rfvCorreo" runat="server" ControlToValidate="txtCorreo" ErrorMessage="Ingrese correo" ValidationGroup="grupo2" CssClass="msg-error"></asp:RequiredFieldValidator>  
            </div>
            <div>
                <asp:Label ID="lblTelefono" runat="server" Text="Teléfono" CssClass="Label"></asp:Label>
                <asp:TextBox ID="txtTelefono" runat="server" Width="250px" CssClass="TextBox"></asp:TextBox>
                <asp:RegularExpressionValidator ID="revTelefono" runat="server" ControlToValidate="txtTelefono" ErrorMessage="Telefono inválido" ValidationExpression="^\d{6,10}$" CssClass="msg-error" ValidationGroup="grupo2"></asp:RegularExpressionValidator>
                &nbsp;<asp:RequiredFieldValidator ID="rfvTelefono" runat="server" ControlToValidate="txtTelefono" ErrorMessage="Ingrese numero de telefono" ValidationGroup="grupo2" CssClass="msg-error"></asp:RequiredFieldValidator>           
            </div>
            <div>
                 <asp:Button ID="btnModificar" runat="server" Enabled="False" OnClick="btnModificar_Click" Text="Modificar" Width="190px" ValidationGroup="grupo2" CssClass="Boton"/>
                <asp:Label ID="lblConfirmacionError" runat="server" CssClass="msg-error"></asp:Label>
                <asp:Label ID="lblConfirmacionExito" runat="server" CssClass="msg-exito"></asp:Label>
            </div>
            <div>
                <br />
                 <asp:HyperLink ID="hlVolver" runat="server" NavigateUrl="~/MenuAdministrador.aspx" CssClass="HyperLink">Volver al menú anterior</asp:HyperLink>
            </div>
        </div>     
                       
    </form>
</body>
</html>
