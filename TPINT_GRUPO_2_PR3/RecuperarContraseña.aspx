<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecuperarContraseña.aspx.cs" Inherits="TPINT_GRUPO_2_PR3.RecuperarContraseña" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Recuperar Contraseña</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="CentrarContenido">
            <div class="Contenedor">
                <div>
                    <asp:Label ID="lblRecuperarContrasenia" runat="server" Text="Recuperar contraseña" CssClass="Titulo"></asp:Label>
                </div>
                <div>
                    <asp:Label ID="lblEmail" runat="server" Text="Ingrese su email:" CssClass="Label"></asp:Label>
                    <asp:TextBox ID="txtEmail" runat="server" Width="435px" CssClass="TextBox"></asp:TextBox>
                    <asp:Button ID="btnEnviarCodigo" runat="server" Text="Enviar código." OnClick="btnEnviarCodigo_Click" ValidationGroup="vgEmail" CssClass="Boton" />
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Ingrese la dirección de email." ControlToValidate="txtEmail" ValidationGroup="vgEmail"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="Ingrese un email válido." ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="vgEmail"></asp:RegularExpressionValidator>
                </div>
                <div>
                    <asp:Label ID="lblIngresarCodigo" runat="server" Text="Ingrese codigo:" CssClass="Label"></asp:Label>
                    <asp:TextBox ID="txtEnviarCodigo" runat="server" CssClass="TextBox"></asp:TextBox>
                    <asp:Button ID="btnIngresarCodigo" runat="server" Text="Ingresar código" OnClick="btnIngresarCodigo_Click" ValidationGroup="vgCodigo" CssClass="Boton" />
                    <asp:RequiredFieldValidator ID="rfvCodigo" runat="server" ErrorMessage="Ingrese un código." ControlToValidate="txtEnviarCodigo" ValidationGroup="vgCodigo"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revCodigo" runat="server" ErrorMessage="Ingrese sólo números." ValidationGroup="vgCodigo" ControlToValidate="txtEnviarCodigo" ValidationExpression="^[0-9,$]*$"></asp:RegularExpressionValidator>
                </div>
                <div>
                    <asp:Label ID="lblContrasenia" runat="server" Text="Contraseña nueva:" CssClass="Label"></asp:Label>
                    <asp:TextBox ID="txtContrasenia" runat="server" CssClass="TextBox"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvContrasenia" runat="server" ErrorMessage="Ingrese una contraseña." ControlToValidate="txtContrasenia" ValidationGroup="vgContrasenia"></asp:RequiredFieldValidator>
                </div>
                <div>
                    <asp:Label ID="lblRepetirContrasenia" runat="server" Text="Repetir contraseña:" CssClass="Label"></asp:Label>
                    <asp:TextBox ID="txtRepetirContrasenia" runat="server" CssClass="TextBox"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvRepetirContrasenia" runat="server" ErrorMessage="Por favor vuelva a repetir la contraseña." ControlToValidate="txtRepetirContrasenia" ValidationGroup="vgContrasenia"></asp:RequiredFieldValidator>
                </div>
                <div>
                    <asp:Button ID="btnGuardar" runat="server" Text="Guardar" OnClick="btnGuardar_Click" ValidationGroup="vgContrasenia" CssClass="Boton" />
                    <asp:Label ID="lblError" runat="server" CssClass="msg-error"></asp:Label>
                    <asp:Label ID="lblExito" runat="server" CssClass="msg-exito"/>
                </div>
                <div>
                    <br />
                    <asp:HyperLink NavigateUrl="Login.aspx" runat="server" CssClass="HyperLink" Text="Volver al login." />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
