<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TPINT_GRUPO_2_PR3.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Login</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="CentrarLogin">
            <div class="Contenedor">
                <div>
                    <asp:Label ID="lblLogin" runat="server" Text="INGRESO AL SISTEMA" CssClass="Titulo"></asp:Label> 
                    <br />
                </div>
                <div>
                    <br />
                    <asp:Label ID="lblUsuario" runat="server" Text="Usuario" CssClass="Label"></asp:Label>
                    <asp:TextBox ID="txtUsuario" runat="server" Width="239px" CssClass="TextBox"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvUsuario" runat="server" ControlToValidate="txtUsuario" ErrorMessage="Debe ingresar el usuario"></asp:RequiredFieldValidator>
                </div>
                <div>
                    <asp:Label ID="LblContrasenia" runat="server" Text="Contraseña" CssClass="Label"></asp:Label>
                    <asp:TextBox ID="txtContrasenia" runat="server" Width="238px" TextMode="Password" CssClass="TextBox"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvContraseña" runat="server" ControlToValidate="txtContrasenia" ErrorMessage="Debe ingresar la contraseña"></asp:RequiredFieldValidator>
                </div>
                <div>
                    <br />
                    <asp:Button ID="btnIngresar" runat="server" Text="Ingresar" OnClick="btnIngresar_Click" CssClass="Boton" />
                </div>
                <br />
                <div>
                    <asp:Label ID="lblMensaje" runat="server" CssClass="msg-error"></asp:Label>
                </div>
                <div>
                    <br />
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/RecuperarContraseña.aspx" CssClass="HyperLink">Olvidaste la contraseña?</asp:HyperLink>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
