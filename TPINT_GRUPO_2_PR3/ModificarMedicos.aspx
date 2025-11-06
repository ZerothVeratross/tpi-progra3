<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModificarMedicos.aspx.cs" Inherits="TPINT_GRUPO_2_PR3.ModificarMedicos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style8 {
            width: 153px;
            height: 31px;
        }
        .auto-style9 {
            width: 116px;
            height: 31px;
        }
        .auto-style10 {
            width: 89px;
            height: 31px;
        }
        .auto-style11 {
            height: 31px;
            width: 359px;
        }
        .auto-style2 {
            width: 153px;
        }
        .auto-style3 {
            width: 116px;
        }
        .auto-style4 {
            width: 89px;
        }
        .auto-style12 {
            width: 359px;
        }
        .auto-style13 {
            width: 114px;
        }
        .auto-style14 {
            width: 263px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
                <td>
                    <asp:Label ID="lblNombreDeUsuario" runat="server" Text="Nombre del usuario"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td class="auto-style12">&nbsp;</td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style14">
                    <asp:HyperLink ID="hlMenu" runat="server">Volver al menu</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblDNIBusqueda" runat="server" Text="Ingrese el DNI del medico a modificar:"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtDNIaBuscar" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style4">
                    <asp:Button ID="btnDNIaBuscar" runat="server" Text="Buscar" />
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="revBuscarDNI" runat="server" ErrorMessage="Ingrese solo numeros"></asp:RegularExpressionValidator>
                    <br />
                    <asp:RequiredFieldValidator ID="rfvBuscarDNI" runat="server" ErrorMessage="Ingrese un DNI a buscar"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style14">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8">
                    <asp:Label ID="lblLegajo" runat="server" Text="Legajo"></asp:Label>
                    :</td>
                <td class="auto-style9">
                    <asp:TextBox ID="txtLegajo" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style10"></td>
                <td class="auto-style11">
                    <asp:RegularExpressionValidator ID="revLegajo" runat="server" ErrorMessage="ingrese solo numeros"></asp:RegularExpressionValidator>
                    <br />
                    <asp:RequiredFieldValidator ID="rfvLegajo" runat="server" ErrorMessage="Ingrese un numero de legajo"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style14">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8">
                    <asp:Label ID="lblDNI" runat="server" Text="DNI:"></asp:Label>
                </td>
                <td class="auto-style9">
                    <asp:TextBox ID="txtDNI" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style10"></td>
                <td class="auto-style11">
                    <asp:RegularExpressionValidator ID="revDNI" runat="server" ErrorMessage="Ingrese solo numeros"></asp:RegularExpressionValidator>
                    <br />
                    <asp:RequiredFieldValidator ID="rfvDNI" runat="server" ErrorMessage="Ingrese un DNI"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style14">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblNombre" runat="server" Text="Nombre:"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style12">
                    <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ErrorMessage="Escriba un nombre"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style14">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblApellido" runat="server" Text="Apellido"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtApellido" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style12">
                    <asp:RequiredFieldValidator ID="rfvApellido" runat="server" ErrorMessage="Escriba un apellido"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style14">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblSexo" runat="server" Text="Sexo:"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:RadioButtonList ID="rblSexo" runat="server">
                        <asp:ListItem>Hombre</asp:ListItem>
                        <asp:ListItem>Mujer</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style12">
                    <asp:RequiredFieldValidator ID="rfvSexo" runat="server" ErrorMessage="Elija un sexo"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style14">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8">
                    <asp:Label ID="lblNacionalidad" runat="server" Text="Nacionalidad:"></asp:Label>
                </td>
                <td class="auto-style9">
                    <asp:TextBox ID="txtNacionalidad" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style10"></td>
                <td class="auto-style11">
                    <asp:RequiredFieldValidator ID="rfvNacionalidad" runat="server" ErrorMessage="Escriba una nacionalidad"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style14">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblFechaDeNacimiento" runat="server" Text="Fecha de nacimiento:"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:Calendar ID="calFechaDeNacimiento" runat="server"></asp:Calendar>
                </td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style12">
                    <asp:RequiredFieldValidator ID="rfvFechaDeNacimiento" runat="server" ErrorMessage="Indique su fecha de nacimiento"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style14">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblDireccion" runat="server" Text="Direccion:"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtDireccion" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style12">
                    <asp:RequiredFieldValidator ID="rfvDireccion" runat="server" ErrorMessage="Escriba una direccion"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style14">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblProvincia" runat="server" Text="Provincia:"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:DropDownList ID="ddlProvincia" runat="server">
                    </asp:DropDownList>
                </td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style12">
                    <asp:RequiredFieldValidator ID="rfvProvincia" runat="server" ErrorMessage="Seleccione una Provincia"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style14">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblLocalidad" runat="server" Text="Localidad:"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:DropDownList ID="ddlLocalidad" runat="server">
                    </asp:DropDownList>
                </td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style12">
                    <asp:RequiredFieldValidator ID="rfvLocalidad" runat="server" ErrorMessage="Seleccione una localidad"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style14">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblCorreo" runat="server" Text="Correo electronico:"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtCorreo" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style12">
                    <asp:RequiredFieldValidator ID="rfvCorreoElectronico" runat="server" ErrorMessage="Escriba un correo electronico"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style14">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblTelefono" runat="server" Text="Telefono:"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtTelefono" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style12">
                    <asp:RequiredFieldValidator ID="rfvTelefono" runat="server" ErrorMessage="Escriba un telefono"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style14">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblEspecialidad" runat="server" Text="Especialidad:"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:DropDownList ID="ddlEspecialidad" runat="server">
                    </asp:DropDownList>
                </td>
                <td class="auto-style4">&nbsp;</td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvEspecialidad" runat="server" ErrorMessage="seleccione una especialidad"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style14">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblDiasLaborales" runat="server" Text="Dias laborales:"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:RadioButtonList ID="rblDias" runat="server">
                        <asp:ListItem>Lunes</asp:ListItem>
                        <asp:ListItem>Martes</asp:ListItem>
                        <asp:ListItem>Miercoles</asp:ListItem>
                        <asp:ListItem>Jueves</asp:ListItem>
                        <asp:ListItem>Viernes</asp:ListItem>
                        <asp:ListItem>Sabado</asp:ListItem>
                        <asp:ListItem>Domingo</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td class="auto-style4">&nbsp;</td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvDiasLaborales" runat="server" ErrorMessage="Seleccione al menos un dia"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style14">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblHorarioEntrada" runat="server" Text="Hora de entrada:"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtHorarioDeEntrada" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style4">&nbsp;</td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvHorarioDeEntrada" runat="server" ErrorMessage="Ingrese un horario de entrada"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style14">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblHorarioSalida" runat="server" Text="Horario de salida:"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtHorarioDeSalida" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style4">&nbsp;</td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvHorarioDeSalida" runat="server" ErrorMessage="Ingrese un horario de salida"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style14">&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:Button ID="btnModificar" runat="server" Text="Modificar" />
                </td>
                <td>&nbsp;</td>
                <td class="auto-style12">&nbsp;</td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style14">&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td class="auto-style12">&nbsp;</td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style14">&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td class="auto-style12">&nbsp;</td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style14">&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td class="auto-style12">&nbsp;</td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style14">&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td class="auto-style12">&nbsp;</td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style14">&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td class="auto-style12">&nbsp;</td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style14">&nbsp;</td>
            </tr>
        </table>
        <div>
        </div>
    </form>
</body>
</html>
