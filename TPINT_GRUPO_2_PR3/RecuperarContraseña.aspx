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
                        <asp:Label ID="Label1" runat="server" Font-Size="XX-Large" Text="Recuperar contraseña"></asp:Label>
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
                        <asp:Label ID="Label2" runat="server" Text="Ingrese su email:"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="TextBox1" runat="server" Width="435px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="Enviar código." />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">Ingrese codigo enviado:</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="TextBox2" runat="server" Width="430px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="Button2" runat="server" Text="Ingresar código" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <br />
        </div>
        <table class="auto-style1">
            <tr>
                <td class="auto-style7">
                    <asp:Label ID="Label3" runat="server" Text="Contraseña nueva:"></asp:Label>
                </td>
                <td class="auto-style10">
                    <asp:TextBox ID="TextBox3" runat="server" Width="422px"></asp:TextBox>
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
                    <asp:Label ID="Label4" runat="server" Text="Repetir contraseña:"></asp:Label>
                </td>
                <td class="auto-style9">
                    <asp:TextBox ID="TextBox4" runat="server" Width="420px"></asp:TextBox>
                </td>
                <td class="auto-style4"></td>
                <td class="auto-style4"></td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style10">&nbsp;</td>
                <td>
                    <asp:Button ID="Button3" runat="server" Text="Aceptar" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <asp:Label ID="Label5" runat="server" Text="Label Mensaje de exito"></asp:Label>
    </form>
</body>
</html>
