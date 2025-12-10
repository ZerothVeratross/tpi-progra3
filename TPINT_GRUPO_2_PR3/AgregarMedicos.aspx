<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgregarMedicos.aspx.cs" Inherits="TPINT_GRUPO_2_PR3.AgregarMedico" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link rel="stylesheet" href="StyleSheet.css" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="ContenedorPequeno">
            <div class="Fila">
                <div>
                    <asp:Label ID="lblUsuario" runat="server" Text="Nombre del usuario" CssClass="LabelUsuario"></asp:Label>
                </div>

                <div class="Columna40-Hyperlink">
                    <asp:HyperLink ID="hlMenu" runat="server" NavigateUrl="~/MenuAdministrador.aspx" CssClass="HyperLink">Volver al menú</asp:HyperLink>
                </div>
            </div>
            <div>
                <asp:Label ID="lblRegistrarMedico" runat="server" Text="Registrar Médico" CssClass="Titulo"></asp:Label>
            </div>
            <br />
            <div class="Fila">
                <div class="Columna12">
                    <asp:Label ID="lblDNI" runat="server" Text="DNI:" CssClass="Label"></asp:Label>
                </div>
                <div class="Columna44">
                    <asp:TextBox ID="txtDNI" runat="server" MaxLength="9" CssClass="TextBox" Width="100px"></asp:TextBox>
                </div>
                <div class="Columna44">
                    <asp:RequiredFieldValidator ID="rfvDNI" runat="server" ControlToValidate="txtDNI" Display="Dynamic" ErrorMessage="DNI requerido." ValidationGroup="g1" CssClass="msg-error"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revDNI" runat="server" ControlToValidate="txtDNI" Display="Dynamic" ErrorMessage="El DNI solo puede contener números." CssClass="msg-error" ValidationExpression="^[0-9]*$" ValidationGroup="g1"></asp:RegularExpressionValidator>
                    <asp:Label ID="lblDNIValidator" runat="server" CssClass="msg-error"></asp:Label>
                </div>
            </div>
            <div class="Fila">
                <div class="Columna12">
                    <asp:Label ID="lblNombre" runat="server" Text="Nombre:" CssClass="Label"></asp:Label>
                </div>
                <div class="Columna44">
                    <asp:TextBox ID="txtNombre" runat="server" MaxLength="40" CssClass="TextBox"></asp:TextBox>
                </div>
                <div class="Columna44">
                    <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre" Display="Dynamic" ErrorMessage="Nombre requerido." CssClass="msg-error" ValidationGroup="g1"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="Fila">
                <div class="Columna12">
                    <asp:Label ID="lblApellido" runat="server" Text="Apellido" CssClass="Label"></asp:Label>
                </div>
                <div class="Columna44">
                    <asp:TextBox ID="txtApellido" runat="server" MaxLength="40" CssClass="TextBox"></asp:TextBox>
                </div>
                <div class="Columna44">
                    <asp:RequiredFieldValidator ID="rfvApellido" runat="server" ControlToValidate="txtApellido" Display="Dynamic" ErrorMessage="Apellido requerido." CssClass="msg-error" ValidationGroup="g1"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="Fila">
                <div class="Columna12">
                    <asp:Label ID="lblSexo" runat="server" Text="Sexo:" CssClass="Label"></asp:Label>
                </div>
                <div class="Columna88">
                    <asp:RadioButtonList ID="rblSexo" runat="server" CssClass="RadioButtonList">
                        <asp:ListItem Selected="True" Value="Masculino">Masculino</asp:ListItem>
                        <asp:ListItem Value="Femenino">Femenino</asp:ListItem>
                    </asp:RadioButtonList>
                </div>
            </div>
            <div class="Fila">
                <div class="Columna12">
                    <asp:Label ID="lblNacionalidad" runat="server" Text="Nacionalidad:" CssClass="Label"></asp:Label>
                </div>
                <div class="Columna44">
                    <asp:TextBox ID="txtNacionalidad" runat="server" MaxLength="40" CssClass="TextBox"></asp:TextBox>
                </div>
                <div class="Columna44">
                    <asp:RequiredFieldValidator ID="rfvNacionalidad" runat="server" ControlToValidate="txtNacionalidad" Display="Dynamic" ErrorMessage="Nacionalidad requerida." CssClass="msg-error" ValidationGroup="g1"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="Fila">
                <div class="Columna12">
                    <asp:Label ID="lblFechaDeNacimiento" runat="server" Text="Fecha de nacimiento:" CssClass="Label"></asp:Label>
                </div>
                <div class="Columna44">
                    <asp:TextBox ID="txtFechaDeNacimiento" runat="server" MaxLength="40" CssClass="TextBoxFecha" TextMode="Date"></asp:TextBox>
                </div>
                <div class="Columna44">
                    <asp:RequiredFieldValidator ID="rfvFechaDeNacimiento" runat="server" ControlToValidate="txtNacionalidad" Display="Dynamic" ErrorMessage="Fecha de nacimiento requerida." CssClass="msg-error" ValidationGroup="g1"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="Fila">
                <div class="Columna12">
                    <asp:Label ID="lblDireccion" runat="server" Text="Dirección:" CssClass="Label"></asp:Label>
                </div>
                <div class="Columna44">
                    <asp:TextBox ID="txtDireccion" runat="server" MaxLength="40" CssClass="TextBox"></asp:TextBox>
                </div>
                <div class="Columna44">
                    <asp:RequiredFieldValidator ID="rfvDireccion" runat="server" ControlToValidate="txtDireccion" Display="Dynamic" ErrorMessage="Dirección requerida." CssClass="msg-error" ValidationGroup="g1"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="Fila">
                <div class="Columna12">
                    <asp:Label ID="lblProvincia" runat="server" Text="Provincia:" CssClass="Label"></asp:Label>
                </div>
                <div class="Columna44">
                    <asp:DropDownList ID="ddlProvincia" runat="server" AppendDataBoundItems="True" CssClass="DropDownList" AutoPostBack="True" OnSelectedIndexChanged="ddlProvincia_SelectedIndexChanged">
                        <asp:ListItem Selected="True" Value="0">--Seleccione Provincia--</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="Columna44">
                    <asp:Label ID="lblProvinciaValidator" runat="server" CssClass="msg-error"></asp:Label>
                </div>
            </div>
            <div class="Fila">
                <div class="Columna12">
                    <asp:Label ID="lblLocalidad" runat="server" Text="Localidad:" CssClass="Label"></asp:Label>
                </div>
                <div class="Columna44">
                    <asp:DropDownList ID="ddlLocalidad" runat="server" AppendDataBoundItems="True" CssClass="DropDownList">
                        <asp:ListItem Value="0">--Seleccione Provincia primero--</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="Columna44">
                    <asp:Label ID="lblLocalidadValidator" runat="server" CssClass="msg-error"></asp:Label>
                </div>
            </div>
            <div class="Fila">
                <div class="Columna12">
                    <asp:Label ID="lblCorreo" runat="server" Text="Correo electrónico:" CssClass="Label"></asp:Label>
                </div>
                <div class="Columna44">
                    <asp:TextBox ID="txtCorreo" runat="server" MaxLength="40" CssClass="TextBox"></asp:TextBox>
                </div>
                <div class="Columna44">
                    <asp:RequiredFieldValidator ID="rfvCorreo" runat="server" ControlToValidate="txtCorreo" Display="Dynamic" ErrorMessage="Correo electrónico requerido." CssClass="msg-error" ValidationGroup="g1"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revCorreo" runat="server" ControlToValidate="txtCorreo" Display="Dynamic" ErrorMessage="El correo ingresado es inválido." CssClass="msg-error" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="g1"></asp:RegularExpressionValidator>
                </div>
            </div>
            <div class="Fila">
                <div class="Columna12">
                    <asp:Label ID="lblTelefono" runat="server" Text="Teléfono:" CssClass="Label"></asp:Label>
                </div>
                <div class="Columna44">
                    <asp:TextBox ID="txtTelefono1" runat="server" MaxLength="2" Width="40px" CssClass="TextBox">11</asp:TextBox>
                    -<asp:TextBox ID="txtTelefono2" runat="server" MaxLength="4" Width="56px" CssClass="TextBox"></asp:TextBox>
                    -<asp:TextBox ID="txtTelefono3" runat="server" MaxLength="4" Width="56px" CssClass="TextBox"></asp:TextBox>
                </div>
                <div class="Columna44">
                    <asp:Label ID="lblTelefonoValidator" runat="server" CssClass="msg-error"></asp:Label>
                </div>
            </div>
            <div class="Fila">
                <div class="Columna12">
                    <asp:Label ID="lblEspecialidad" runat="server" Text="Especialidad:" CssClass="Label"></asp:Label>
                </div>
                <div class="Columna44">
                    <asp:DropDownList ID="ddlEspecialidad" runat="server" AppendDataBoundItems="True" CssClass="DropDownList">
                        <asp:ListItem Selected="True" Value="0">--Seleccione Especialidad--</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="Columna44">
                    <asp:Label ID="lblEspecialidadValidator" runat="server" CssClass="msg-error"></asp:Label>
                </div>
            </div>
            <div class="Fila">
                <div class="Columna12">
                    <asp:Label ID="lblDiasLaborales" runat="server" Text="Días laborales:" CssClass="Label"></asp:Label>
                </div>
                <div class="Columna44">
                    <asp:CheckBoxList ID="cblDiasLaborales" runat="server" CausesValidation="True" CssClass="CheckBoxList" RepeatColumns="2">
                        <asp:ListItem Value="1">Lunes</asp:ListItem>
                        <asp:ListItem Value="2">Martes</asp:ListItem>
                        <asp:ListItem Value="3">Miércoles</asp:ListItem>
                        <asp:ListItem Value="4">Jueves</asp:ListItem>
                        <asp:ListItem Value="5">Viernes</asp:ListItem>
                        <asp:ListItem Value="6">Sábado</asp:ListItem>
                        <asp:ListItem Value="7">Domingo</asp:ListItem>
                    </asp:CheckBoxList>
                </div>
                <div class="Columna44">
                    <asp:Label ID="lblDiasLaboralesValidator" runat="server" CssClass="msg-error"></asp:Label>
                </div>
            </div>
            <div class="Fila">
                <div class="Columna12">
                    <asp:Label ID="lblHoraDeEntrada" runat="server" Text="Hora de entrada:" CssClass="Label"></asp:Label>
                </div>
                <div class="Columna44">
                    <asp:TextBox ID="txtHoraDeEntrada" runat="server" MaxLength="2" CssClass="TextBox" Width="40px"></asp:TextBox>
                    <asp:Label ID="lblInstruccionesHora" runat="server" Text="Utilice formato 24 hs" CssClass="Label"></asp:Label>
                </div>
                <div class="Columna44">
                    <asp:RequiredFieldValidator ID="rfvHoraDeEntrada" runat="server" ControlToValidate="txtHoraDeEntrada" Display="Dynamic" ErrorMessage="Hora de entrada requerida." CssClass="msg-error" ValidationGroup="g1"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblHoraDeEntradaValidator" runat="server" CssClass="msg-error"></asp:Label>
                </div>
            </div>
            <div class="Fila">
                <div class="Columna12">
                    <asp:Label ID="lblHoraDeSalida" runat="server" Text="Horario de salida:" CssClass="Label"></asp:Label>
                </div>
                <div class="Columna44">
                    <asp:TextBox ID="txtHoraDeSalida" runat="server" MaxLength="2" CssClass="TextBox" Width="40px"></asp:TextBox>
                </div>
                <div class="Columna44">
                    <asp:RequiredFieldValidator ID="rfvHoraDeSalida" runat="server" ControlToValidate="txtHoraDeSalida" Display="Dynamic" ErrorMessage="Hora de salida requerida." CssClass="msg-error" ValidationGroup="g1"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblHoraDeSalidaValidator" runat="server" CssClass="msg-error"></asp:Label>
                </div>
            </div>
            <div class="Fila">
                <div class="Columna12">
                    <asp:Label ID="lblUsuarioMedico" runat="server" Text="Usuario médico:" CssClass="Label"></asp:Label>
                </div>
                <div class="Columna44">
                    <asp:TextBox ID="txtUsuarioMedico" runat="server" MaxLength="40" CssClass="TextBox"></asp:TextBox>
                </div>
                <div class="Columna44">
                    <asp:RequiredFieldValidator ID="rfvUsuarioMedico" runat="server" ControlToValidate="txtUsuarioMedico" Display="Dynamic" ErrorMessage="Nombre de usuario requerido." CssClass="msg-error" ValidationGroup="g1"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblUsuarioMedicoValidator" runat="server" CssClass="msg-error"></asp:Label>
                </div>
            </div>
            <div class="Fila">
                <div class="Columna12">
                    <asp:Label ID="lblContrasenia" runat="server" Text="Contraseña:" CssClass="Label"></asp:Label>
                </div>
                <div class="Columna44">
                    <asp:TextBox ID="txtContrasenia" runat="server" MaxLength="30" TextMode="Password" CssClass="TextBox"></asp:TextBox>
                </div>
                <div class="Columna44">
                    <asp:RequiredFieldValidator ID="rfvContrasenia" runat="server" ControlToValidate="txtContrasenia" Display="Dynamic" ErrorMessage="Contraseña requerida." CssClass="msg-error" ValidationGroup="g1"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cvalContrasenia" runat="server" ControlToCompare="txtContrasenia" ControlToValidate="txtContraseniaRepetida" Display="Dynamic" ErrorMessage="Las contraseñas no coinciden." CssClass="msg-error" ValidationGroup="g1"></asp:CompareValidator>
                </div>
            </div>
            <div class="Fila">
                <div class="Columna12">
                    <asp:Label ID="lblContraseniaRepetida" runat="server" Text="Repita la contraseña:" CssClass="Label"></asp:Label>
                </div>
                <div class="Columna44">
                    <asp:TextBox ID="txtContraseniaRepetida" runat="server" MaxLength="30" TextMode="Password" CssClass="TextBox"></asp:TextBox>
                </div>
                <div class="Columna44">
                    <asp:RequiredFieldValidator ID="rfvContraseniaRepetida" runat="server" ControlToValidate="txtContraseniaRepetida" Display="Dynamic" ErrorMessage="Repita la contraseña." CssClass="msg-error" ValidationGroup="g1"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div>
                <div>
                    <asp:Button ID="btnRegistrar" runat="server" Text="Registrar" OnClick="btnRegistrar_Click" ValidationGroup="g1" CssClass="Boton" />
                </div>
            </div>
            <div>
                <asp:Label ID="lblMensaje" runat="server" CssClass="Label"></asp:Label>
            </div>
            <div>
                <asp:GridView ID="gvMedico" runat="server">
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
