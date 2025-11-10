<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TPINT_GRUPO_2_PR3.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            width: 321px;
        }

        .auto-style3 {
            width: 358px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">
                        <asp:Label ID="lblLogin" runat="server" Text="LOGIN"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblUsuario" runat="server" Text="Ingrese su usuario"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtUsuario" runat="server" Width="239px"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label2" runat="server" Text="Ingrese su contrasenia"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtContrasenia" runat="server" Width="238px"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblMensaje" runat="server"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/RecuperarContraseña.aspx">Olvidaste la contraseña?</asp:HyperLink>
                    </td>
                    <td>
                        <asp:Button ID="btnIngresar" runat="server" Text="Ingresar" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
