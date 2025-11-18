<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecuperarContraseña.aspx.cs" Inherits="TPINT_GRUPO_2_PR3.RecuperarContraseña" %>

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
        width: 151px;
    }
    .auto-style3 {
        width: 518px;
    }
    .auto-style4 {
        height: 23px;
    }
    .auto-style6 {
        height: 23px;
        width: 150px;
    }
    .auto-style7 {
        width: 150px;
    }
    .auto-style9 {
        height: 23px;
        width: 514px;
    }
    .auto-style10 {
        width: 514px;
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
                        <asp:Label ID="lblRecuperarContrasenia" runat="server" Font-Size="XX-Large" Text="Recuperar contraseña"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblEmail" runat="server" Text="Ingrese su email:"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtEmail" runat="server" Width="435px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Ingrese la dirección de email." ControlToValidate="txtEmail" ValidationGroup="vgEmail"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:Button ID="btnEnviarCodigo" runat="server" Text="Enviar código." OnClick="btnEnviarCodigo_Click" ValidationGroup="vgEmail"/>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td >
                        <asp:Label ID="lblIngresarCodigo" runat="server" Text="Ingrese codigo:"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtEnviarCodigo" runat="server" Width="430px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEnviarCodigo" runat="server" ErrorMessage="Ingrese el código." ControlToValidate="txtEnviarCodigo" ValidationGroup="vgCodigo"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:Button ID="btnIngresarCodigo" runat="server" Text="Ingresar código" OnClick="btnIngresarCodigo_Click" ValidationGroup="vgCodigo" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <br />
        </div>
        <table class="auto-style1">
            <tr>
                <td class="auto-style7">
                    <asp:Label ID="lblContrasenia" runat="server" Text="Contraseña nueva:"></asp:Label>
                </td>
                <td class="auto-style10">
                    <asp:TextBox ID="txtContrasenia" runat="server" Width="422px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvContrasenia" runat="server" ErrorMessage="Ingrese una contraseña." ControlToValidate="txtContrasenia" ValidationGroup="vgContrasenia"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style10">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6">
                    <asp:Label ID="lblRepetirContrasenia" runat="server" Text="Repetir contraseña:"></asp:Label>
                </td>
                <td class="auto-style9">
                    <asp:TextBox ID="txtRepetirContrasenia" runat="server" Width="420px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvRepetirContrasenia" runat="server" ErrorMessage="Por favor vuelva a repetir la contraseña." ControlToValidate="txtRepetirContrasenia" ValidationGroup="vgContrasenia"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style4"></td>
                <td class="auto-style4"></td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style10">&nbsp;</td>
                <td>
                    <asp:Button ID="btnGuardar" runat="server" Text="Guardar" OnClick="btnGuardar_Click" ValidationGroup="vgContrasenia" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <asp:Label ID="lblMensaje" runat="server"></asp:Label>
    </form>
</body>
</html>
