<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgregarMedicos.aspx.cs" Inherits="TPINT_GRUPO_2_PR3.AgregarMedico" %>

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
            width: 153px;
        }

        .auto-style8 {
            width: 153px;
            height: 31px;
        }

        .auto-style11 {
            height: 31px;
        }

        .auto-style15 {
            width: 153px;
            height: 56px;
        }
        .auto-style17 {
            height: 56px;
        }
        .auto-style18 {
            width: 153px;
            height: 26px;
        }
        .auto-style20 {
            height: 26px;
        }
        .auto-style21 {
            width: 219px;
        }
        .auto-style22 {
            width: 219px;
            height: 56px;
        }
        .auto-style23 {
            width: 219px;
            height: 31px;
        }
        .auto-style24 {
            width: 219px;
            height: 26px;
        }
        .auto-style25 {
            width: 280px;
        }
        .auto-style26 {
            height: 56px;
            width: 280px;
        }
        .auto-style27 {
            height: 31px;
            width: 280px;
        }
        .auto-style28 {
            height: 26px;
            width: 280px;
        }
        .auto-style29 {
            width: 153px;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
                <td colspan="2">
                    <asp:Label ID="lblUsuario" runat="server" Text="Nombre del usuario" Font-Italic="True" Font-Size="Larger"></asp:Label>
                </td>
                <td class="auto-style25">
                    <asp:HyperLink ID="hlMenu" runat="server" NavigateUrl="~/MenuAdministrador.aspx">Volver al menu</asp:HyperLink>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblDNI" runat="server" Text="DNI:"></asp:Label>
                </td>
                <td class="auto-style21">
                    <asp:TextBox ID="txtDNI" runat="server" MaxLength="9" Width="72px"></asp:TextBox>
                </td>
                <td class="auto-style25">
                    <asp:RequiredFieldValidator ID="rfvDNI" runat="server" ControlToValidate="txtDNI" Display="Dynamic" ErrorMessage="DNI requerido." ForeColor="#CC3300" ValidationGroup="g1"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revDNI" runat="server" ControlToValidate="txtDNI" Display="Dynamic" ErrorMessage="El DNI solo puede contener números." ForeColor="#CC3300" ValidationExpression="^[0-9]*$" ValidationGroup="g1"></asp:RegularExpressionValidator>
                    <asp:Label ID="lblDNIValidator" runat="server" ForeColor="#CC3300"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblNombre" runat="server" Text="Nombre:"></asp:Label>
                </td>
                <td class="auto-style21">
                    <asp:TextBox ID="txtNombre" runat="server" MaxLength="40" Width="210px"></asp:TextBox>
                </td>
                <td class="auto-style25">
                    <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre" Display="Dynamic" ErrorMessage="Nombre requerido." ForeColor="#CC3300" ValidationGroup="g1"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblApellido" runat="server" Text="Apellido"></asp:Label>
                </td>
                <td class="auto-style21">
                    <asp:TextBox ID="txtApellido" runat="server" MaxLength="40" Width="210px"></asp:TextBox>
                </td>
                <td class="auto-style25">
                    <asp:RequiredFieldValidator ID="rfvApellido" runat="server" ControlToValidate="txtApellido" Display="Dynamic" ErrorMessage="Apellido requerido." ForeColor="#CC3300" ValidationGroup="g1"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style15">
                    <asp:Label ID="lblSexo" runat="server" Text="Sexo:"></asp:Label>
                </td>
                <td class="auto-style22">
                    <asp:RadioButtonList ID="rblSexo" runat="server">
                        <asp:ListItem Selected="True" Value="Masculino">Masculino</asp:ListItem>
                        <asp:ListItem Value="Femenino">Femenino</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td class="auto-style26">&nbsp;</td>
                <td class="auto-style17">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8">
                    <asp:Label ID="lblNacionalidad" runat="server" Text="Nacionalidad:"></asp:Label>
                </td>
                <td class="auto-style23">
                    <asp:TextBox ID="txtNacionalidad" runat="server" MaxLength="40" Width="210px"></asp:TextBox>
                </td>
                <td class="auto-style27">
                    <asp:RequiredFieldValidator ID="rfvNacionalidad" runat="server" ControlToValidate="txtNacionalidad" Display="Dynamic" ErrorMessage="Nacionalidad requerida." ForeColor="#CC3300" ValidationGroup="g1"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style11">
                    <asp:Label ID="lblMensaje" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblFechaDeNacimiento" runat="server" Text="Fecha de nacimiento:"></asp:Label>
                </td>
                <td class="auto-style21" rowspan="2">
                    <asp:Calendar ID="calFechaDeNacimiento" runat="server" VisibleDate="1990-06-21"></asp:Calendar>
                </td>
                <td class="auto-style25" rowspan="2">
                    <asp:Label ID="lblFechaDeNacimientoValidator" runat="server" ForeColor="#CC3300"></asp:Label>
                </td>
                <td rowspan="2">
                    <asp:GridView ID="gvMedico" runat="server">
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td class="auto-style29">
                    <asp:Label ID="lblAnio" runat="server" Text="Puede saltar a un año específico"></asp:Label>
                    <br />
                    <asp:TextBox ID="txtAnio" runat="server" AutoPostBack="True" MaxLength="4" OnTextChanged="txtAnio_TextChanged" ValidationGroup="g2" Width="32px"></asp:TextBox>
                    <br />
                    <asp:Label ID="lblAnioInvalido" runat="server" ForeColor="#CC3300"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblDireccion" runat="server" Text="Direccion:"></asp:Label>
                </td>
                <td class="auto-style21">
                    <asp:TextBox ID="txtDireccion" runat="server" MaxLength="40" Width="210px"></asp:TextBox>
                </td>
                <td class="auto-style25">
                    <asp:RequiredFieldValidator ID="rfvDireccion" runat="server" ControlToValidate="txtDireccion" Display="Dynamic" ErrorMessage="Dirección requerida." ForeColor="#CC3300" ValidationGroup="g1"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblProvincia" runat="server" Text="Provincia:"></asp:Label>
                </td>
                <td class="auto-style21">
                    <asp:DropDownList ID="ddlProvincia" runat="server" AppendDataBoundItems="True" Width="219px" AutoPostBack="True" OnSelectedIndexChanged="ddlProvincia_SelectedIndexChanged">
                        <asp:ListItem Selected="True" Value="0">--Seleccione Provincia--</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style25">
                    <asp:Label ID="lblProvinciaValidator" runat="server" ForeColor="#CC3300"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblLocalidad" runat="server" Text="Localidad:"></asp:Label>
                </td>
                <td class="auto-style21">
                    <asp:DropDownList ID="ddlLocalidad" runat="server" AppendDataBoundItems="True" Width="219px">
                        <asp:ListItem Value="0">--Seleccione Provincia primero--</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style25">
                    <asp:Label ID="lblLocalidadValidator" runat="server" ForeColor="#CC3300"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblCorreo" runat="server" Text="Correo electrónico:"></asp:Label>
                </td>
                <td class="auto-style21">
                    <asp:TextBox ID="txtCorreo" runat="server" MaxLength="40" Width="210px"></asp:TextBox>
                </td>
                <td class="auto-style25">
                    <asp:RequiredFieldValidator ID="rfvCorreo" runat="server" ControlToValidate="txtCorreo" Display="Dynamic" ErrorMessage="Correo electrónico requerido." ForeColor="#CC3300" ValidationGroup="g1"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revCorreo" runat="server" ControlToValidate="txtCorreo" Display="Dynamic" ErrorMessage="El correo ingresado es inválido." ForeColor="#CC3300" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="g1"></asp:RegularExpressionValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblTelefono" runat="server" Text="Teléfono:"></asp:Label>
                </td>
                <td class="auto-style21">
                    <asp:TextBox ID="txtTelefono1" runat="server" MaxLength="2" Width="16px">11</asp:TextBox>
                    -<asp:TextBox ID="txtTelefono2" runat="server" MaxLength="4" Width="32px"></asp:TextBox>
                    -<asp:TextBox ID="txtTelefono3" runat="server" MaxLength="4" Width="32px"></asp:TextBox>
                </td>
                <td class="auto-style25">
                    <asp:Label ID="lblTelefonoValidator" runat="server" ForeColor="#CC3300"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style18">
                    <asp:Label ID="lblEspecialidad" runat="server" Text="Especialidad:"></asp:Label>
                </td>
                <td class="auto-style24">
                    <asp:DropDownList ID="ddlEspecialidad" runat="server" AppendDataBoundItems="True" Width="219px">
                        <asp:ListItem Selected="True" Value="0">--Seleccione Especialidad--</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style28">
                    <asp:Label ID="lblEspecialidadValidator" runat="server" ForeColor="#CC3300"></asp:Label>
                </td>
                <td class="auto-style20">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblDiasLaborales" runat="server" Text="Días laborales:"></asp:Label>
                </td>
                <td class="auto-style21">
                    <asp:CheckBoxList ID="cblDiasLaborales" runat="server" CausesValidation="True">
                        <asp:ListItem Value="1">Lunes</asp:ListItem>
                        <asp:ListItem Value="2">Martes</asp:ListItem>
                        <asp:ListItem Value="3">Miércoles</asp:ListItem>
                        <asp:ListItem Value="4">Jueves</asp:ListItem>
                        <asp:ListItem Value="5">Viernes</asp:ListItem>
                        <asp:ListItem Value="6">Sábado</asp:ListItem>
                        <asp:ListItem Value="7">Domingo</asp:ListItem>
                    </asp:CheckBoxList>
                </td>
                <td class="auto-style25">
                    <asp:Label ID="lblDiasLaboralesValidator" runat="server" ForeColor="#CC3300"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblHoraDeEntrada" runat="server" Text="Hora de entrada:"></asp:Label>
                </td>
                <td class="auto-style21">
                    <asp:TextBox ID="txtHoraDeEntrada" runat="server" MaxLength="2" Width="16px"></asp:TextBox>
                    <asp:Label ID="lblInstruccionesHora" runat="server" Text="Utilice formato 24 hs"></asp:Label>
                </td>
                <td class="auto-style25">
                    <asp:RequiredFieldValidator ID="rfvHoraDeEntrada" runat="server" ControlToValidate="txtHoraDeEntrada" Display="Dynamic" ErrorMessage="Hora de entrada requerida." ForeColor="#CC3300" ValidationGroup="g1"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblHoraDeEntradaValidator" runat="server" ForeColor="#CC3300"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblHoraDeSalida" runat="server" Text="Horario de salida:"></asp:Label>
                </td>
                <td class="auto-style21">
                    <asp:TextBox ID="txtHoraDeSalida" runat="server" MaxLength="2" Width="16px"></asp:TextBox>
                </td>
                <td class="auto-style25">
                    <asp:RequiredFieldValidator ID="rfvHoraDeSalida" runat="server" ControlToValidate="txtHoraDeSalida" Display="Dynamic" ErrorMessage="Hora de salida requerida." ForeColor="#CC3300" ValidationGroup="g1"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblHoraDeSalidaValidator" runat="server" ForeColor="#CC3300"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblUsuarioMedico" runat="server" Text="Usuario médico:"></asp:Label>
                </td>
                <td class="auto-style21">
                    <asp:TextBox ID="txtUsuarioMedico" runat="server" MaxLength="40" Width="209px"></asp:TextBox>
                </td>
                <td class="auto-style25">
                    <asp:RequiredFieldValidator ID="rfvUsuarioMedico" runat="server" ControlToValidate="txtUsuarioMedico" Display="Dynamic" ErrorMessage="Nombre de usuario requerido." ForeColor="#CC3300" ValidationGroup="g1"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblUsuarioMedicoValidator" runat="server" ForeColor="#CC3300"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblContrasenia" runat="server" Text="Contraseña:"></asp:Label>
                </td>
                <td class="auto-style21">
                    <asp:TextBox ID="txtContrasenia" runat="server" MaxLength="30" TextMode="Password" Width="209px"></asp:TextBox>
                </td>
                <td class="auto-style25">
                    <asp:RequiredFieldValidator ID="rfvContrasenia" runat="server" ControlToValidate="txtContrasenia" Display="Dynamic" ErrorMessage="Contraseña requerida." ForeColor="#CC3300" ValidationGroup="g1"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cvalContrasenia" runat="server" ControlToCompare="txtContrasenia" ControlToValidate="txtContraseniaRepetida" Display="Dynamic" ErrorMessage="Las contraseñas no coinciden." ForeColor="#CC3300" ValidationGroup="g1"></asp:CompareValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblContraseniaRepetida" runat="server" Text="Repita la contraseña:"></asp:Label>
                </td>
                <td class="auto-style21">
                    <asp:TextBox ID="txtContraseniaRepetida" runat="server" MaxLength="30" TextMode="Password" Width="209px"></asp:TextBox>
                </td>
                <td class="auto-style25">
                    <asp:RequiredFieldValidator ID="rfvContraseniaRepetida" runat="server" ControlToValidate="txtContraseniaRepetida" Display="Dynamic" ErrorMessage="Repita la contraseña." ForeColor="#CC3300" ValidationGroup="g1"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style21">
                    <asp:Button ID="btnRegistrar" runat="server" Text="Registrar" OnClick="btnRegistrar_Click" ValidationGroup="g1" />
                </td>
                <td class="auto-style25">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            </table>
    </form>
</body>
</html>
