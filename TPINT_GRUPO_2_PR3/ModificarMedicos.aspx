<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModificarMedicos.aspx.cs" Inherits="TPINT_GRUPO_2_PR3.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 290px;
        }
        .auto-style3 {
            width: 212px;
        }
        .auto-style4 {
            width: 290px;
            height: 33px;
        }
        .auto-style5 {
            width: 212px;
            height: 33px;
        }
        .auto-style6 {
            height: 33px;
        }
        .auto-style7 {
            width: 290px;
            height: 39px;
        }
        .auto-style8 {
            width: 212px;
            height: 39px;
        }
        .auto-style9 {
            height: 39px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblNombreDeUsuario" runat="server"></asp:Label>
                </td>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
                <td>
                    <asp:HyperLink ID="hlVolverAlMenu" runat="server" NavigateUrl="~/MenuAdministrador.aspx">Volver al menu</asp:HyperLink>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">
                    <asp:Label ID="lblBuscarLegajo" runat="server" Text="Ingrese el legajo a buscar:"></asp:Label>
                </td>
                <td class="auto-style8">
                    <asp:TextBox ID="txtBuscarLegajo" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style9">
                    <asp:Button ID="btnBuscarLegajo" runat="server" Text="Buscar" OnClick="btnBuscarLegajo_Click" ValidationGroup="1" />
                </td>
                <td class="auto-style9">
                    <asp:RequiredFieldValidator ID="rfvBuscarLegajo" runat="server" ControlToValidate="txtBuscarLegajo" ErrorMessage="ingrese un legajo para buscar" ValidationGroup="1"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style9"></td>
                <td class="auto-style9"></td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblLegajo" runat="server" Text="Legajo:"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:Label ID="lblLegajoEncontrado" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblMensaje" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblDNI" runat="server" Text="DNI:"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtDNI" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvDNI" runat="server" ControlToValidate="txtDNI" ErrorMessage="ingrese un dni" ValidationGroup="2"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblNombre" runat="server" Text="Nombre:"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre" ErrorMessage="ingrese un nombre" ValidationGroup="2"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblApellido" runat="server" Text="Apellido:"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtApellido" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvApellido" runat="server" ControlToValidate="txtApellido" ErrorMessage="ingrese un apellido" ValidationGroup="2"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblSexo" runat="server" Text="Sexo:"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:RadioButtonList ID="rblSexo" runat="server">
                        <asp:ListItem>Masculino</asp:ListItem>
                        <asp:ListItem>Femenino</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td>&nbsp;</td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvSexo" runat="server" ControlToValidate="rblSexo" ErrorMessage="Seleccione un sexo" ValidationGroup="2"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblNacionalidad" runat="server" Text="Nacionalidad:"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtNacionalidad" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvNacionalidad" runat="server" ControlToValidate="txtNacionalidad" ErrorMessage="ingrese una nacionalidad" ValidationGroup="2"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="lblFechaDeNacimiento" runat="server" Text="Fecha de nacimiento:"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="txtFechaDeNacimiento" runat="server" TextMode="Date"></asp:TextBox>
                </td>
                <td class="auto-style6"></td>
                <td class="auto-style6">
                    <asp:RequiredFieldValidator ID="rfvFechaDeNacimiento" runat="server" ControlToValidate="txtFechaDeNacimiento" ErrorMessage="seleccione una fecha de nacimiento" ValidationGroup="2"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style6"></td>
                <td class="auto-style6"></td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblDireccion" runat="server" Text="Direccion:"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtDireccion" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvDireccion" runat="server" ControlToValidate="txtDireccion" ErrorMessage="ingrese una direccion" ValidationGroup="2"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblProvincia" runat="server" Text="Provincia:"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:DropDownList ID="ddlProvincia" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlProvincia_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblLocalidad" runat="server" Text="Localidad:"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:DropDownList ID="ddlLocalidad" runat="server">
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblCorreoElectronico" runat="server" Text="Correo electronico:"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtCorreoElectronico" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvCorreo" runat="server" ControlToValidate="txtCorreoElectronico" ErrorMessage="ingrese un correo" ValidationGroup="2"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblEspecialidad" runat="server" Text="Especialidad:"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:DropDownList ID="ddlEspecialidad" runat="server">
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblDiasLaborales" runat="server" Text="Dias laborales:"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:CheckBoxList ID="cblDiasLaborales" runat="server">
                        <asp:ListItem Value="1">Lunes</asp:ListItem>
                        <asp:ListItem Value="2">Martes</asp:ListItem>
                        <asp:ListItem Value="3">Miercoles</asp:ListItem>
                        <asp:ListItem Value="4">Jueves</asp:ListItem>
                        <asp:ListItem Value="5">viernes</asp:ListItem>
                        <asp:ListItem Value="6">Sabado</asp:ListItem>
                        <asp:ListItem Value="7">Domingo</asp:ListItem>
                    </asp:CheckBoxList>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblHoraDeEntrada" runat="server" Text="Hora de Entrada:"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:DropDownList ID="ddlHorarioDeEntrada" runat="server">
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvEntrada" runat="server" ControlToValidate="ddlHorarioDeEntrada" ErrorMessage="ingrese un horario de entrada" ValidationGroup="2"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblHoraDeSalida" runat="server" Text="Hora de salida:"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:DropDownList ID="ddlHorarioDeSalida" runat="server">
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvSalida" runat="server" ControlToValidate="ddlHorarioDeSalida" ErrorMessage="ingrese un horario de salida" ValidationGroup="2"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="lblUsuario" runat="server" Text="Nombre de usuario:"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="txtNombreDeUsuario" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style6"></td>
                <td class="auto-style6">
                    <asp:RequiredFieldValidator ID="rfvUsuario" runat="server" ControlToValidate="txtNombreDeUsuario" ErrorMessage="ingrese un nombre de usuario" ValidationGroup="2"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style6"></td>
                <td class="auto-style6"></td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblContrasenia" runat="server" Text="Contrasenia:"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtContrasenia" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvContrasenia" runat="server" ControlToValidate="txtContrasenia" ErrorMessage="ingrese una contrasenia" ValidationGroup="2"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblTelefono" runat="server" Text="Telefono:"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtTelefono" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvTelefono" runat="server" ControlToValidate="ddlEspecialidad" ErrorMessage="ingrese un telefono" ValidationGroup="2"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <div>
                    <asp:Button ID="btnModificar" runat="server" Text="Modificar" OnClick="btnModificar_Click" ValidationGroup="2" />
        </div>
    </form>
</body>
</html>
