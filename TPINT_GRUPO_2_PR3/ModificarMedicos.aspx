<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModificarMedicos.aspx.cs" Inherits="TPINT_GRUPO_2_PR3.WebForm3" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
    <title>Modificar Médicos</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="CentrarContenido">
            <div class="Contenedor">
                <div class="Fila">
                    <!-- Usuario -->
                    <asp:Label ID="lblNombreDeUsuario" runat="server" CssClass="LabelUsuario"></asp:Label>

                    <!-- Volver al menú -->
                    <div class="Columna40-Hyperlink">
                        <asp:HyperLink ID="hlVolverAlMenu" runat="server" NavigateUrl="~/MenuAdministrador.aspx" CssClass="HyperLink">Volver al menú</asp:HyperLink>
                    </div>
                </div>
                <!-- BUSCAR LEGAJO -->
                <div>
                    <asp:Label ID="lblBuscarLegajo" runat="server" Text="Ingrese el legajo a buscar:" CssClass="Label"></asp:Label>
                    <asp:TextBox ID="txtBuscarLegajo" runat="server" CssClass="TextBox"></asp:TextBox>
                    <asp:Button ID="btnBuscarLegajo" runat="server" Text="Buscar" CssClass="Boton" OnClick="btnBuscarLegajo_Click" ValidationGroup="1" />
                    <asp:RequiredFieldValidator ID="rfvBuscarLegajo" runat="server" ControlToValidate="txtBuscarLegajo" ErrorMessage="Ingrese un legajo para buscar" CssClass="msg-error" ValidationGroup="1"></asp:RequiredFieldValidator>
                </div>

                <!-- RESULTADO LEGAJO -->
                <div>
                    <asp:Label ID="lblLegajo" runat="server" Text="Legajo:" CssClass="Label"></asp:Label>
                    <asp:Label ID="lblLegajoEncontrado" runat="server" CssClass="msg-exito"></asp:Label>
                    <asp:Label ID="lblMensaje" runat="server" CssClass="msg-error"></asp:Label>
                </div>

                <!-- DNI -->
                <div>
                    <asp:Label ID="lblDNI" runat="server" Text="DNI:" CssClass="Label"></asp:Label>
                    <asp:TextBox ID="txtDNI" runat="server" CssClass="TextBox" MaxLength="9"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvDNI" runat="server" ControlToValidate="txtDNI" ErrorMessage="Ingrese un DNI" CssClass="msg-error" ValidationGroup="2"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revDNI" runat="server" ControlToValidate="txtDNI" ErrorMessage="Ingrese un DNI válido" ValidationExpression="^[0-9]+$" CssClass="msg-error" ValidationGroup="2"></asp:RegularExpressionValidator>
                </div>

                <!-- Nombre -->
                <div>
                    <asp:Label ID="lblNombre" runat="server" Text="Nombre:" CssClass="Label"></asp:Label>
                    <asp:TextBox ID="txtNombre" runat="server" CssClass="TextBox" MaxLength="40"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre" ErrorMessage="Ingrese un nombre" CssClass="msg-error" ValidationGroup="2"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revNombre" runat="server" ControlToValidate="txtNombre" ErrorMessage="Solamente letras y espacios" ValidationExpression="^[A-Za-zÁÉÍÓÚáéíóúÑñ ]{1,40}$" CssClass="msg-error" ValidationGroup="2"></asp:RegularExpressionValidator>
                </div>

                <!-- Apellido -->
                <div>
                    <asp:Label ID="lblApellido" runat="server" Text="Apellido:" CssClass="Label"></asp:Label>
                    <asp:TextBox ID="txtApellido" runat="server" CssClass="TextBox" MaxLength="40"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvApellido" runat="server" ControlToValidate="txtApellido" ErrorMessage="Ingrese un apellido" CssClass="msg-error" ValidationGroup="2"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revApellido" runat="server" ControlToValidate="txtApellido" ErrorMessage="Solamente letras y espacios" ValidationExpression="^[A-Za-zÁÉÍÓÚáéíóúÑñ ]{1,40}$" CssClass="msg-error" ValidationGroup="2"></asp:RegularExpressionValidator>
                </div>

                <!-- Sexo -->
                <div>
                    <asp:Label ID="lblSexo" runat="server" Text="Sexo:" CssClass="Label"></asp:Label>
                    <asp:RadioButtonList ID="rblSexo" runat="server" CssClass="RadioButton">
                        <asp:ListItem>Masculino</asp:ListItem>
                        <asp:ListItem>Femenino</asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="rfvSexo" runat="server" ControlToValidate="rblSexo" ErrorMessage="Seleccione un sexo" CssClass="msg-error" ValidationGroup="2"></asp:RequiredFieldValidator>
                </div>

                <!-- Nacionalidad -->
                <div>
                    <asp:Label ID="lblNacionalidad" runat="server" Text="Nacionalidad:" CssClass="Label"></asp:Label>
                    <asp:TextBox ID="txtNacionalidad" runat="server" CssClass="TextBox" MaxLength="40"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvNacionalidad" runat="server" ControlToValidate="txtNacionalidad" ErrorMessage="Ingrese una nacionalidad" CssClass="msg-error" ValidationGroup="2"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revNacionalidad" runat="server" ControlToValidate="txtNacionalidad" ErrorMessage="Solamente letras y espacios" ValidationExpression="^[A-Za-zÁÉÍÓÚáéíóúÑñ ]{1,40}$" CssClass="msg-error" ValidationGroup="2"></asp:RegularExpressionValidator>
                </div>

                <!-- Fecha nacimiento -->
                <div>
                    <asp:Label ID="lblFechaDeNacimiento" runat="server" Text="Fecha de nacimiento:" CssClass="Label"></asp:Label>
                    <asp:TextBox ID="txtFechaDeNacimiento" runat="server" TextMode="Date" CssClass="TextBoxFecha"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvFechaDeNacimiento" runat="server" ControlToValidate="txtFechaDeNacimiento" ErrorMessage="Seleccione fecha" CssClass="msg-error" ValidationGroup="2"></asp:RequiredFieldValidator>
                </div>

                <!-- Dirección -->
                <div>
                    <asp:Label ID="lblDireccion" runat="server" Text="Dirección:" CssClass="Label"></asp:Label>
                    <asp:TextBox ID="txtDireccion" runat="server" CssClass="TextBox" MaxLength="40"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvDireccion" runat="server" ControlToValidate="txtDireccion" ErrorMessage="Ingrese dirección" CssClass="msg-error" ValidationGroup="2"></asp:RequiredFieldValidator>
                </div>

                <!-- Provincia -->
                <div>
                    <asp:Label ID="lblProvincia" runat="server" Text="Provincia:" CssClass="Label"></asp:Label>
                    <asp:DropDownList ID="ddlProvincia" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlProvincia_SelectedIndexChanged" CssClass="DropDownList"></asp:DropDownList>
                </div>

                <!-- Localidad -->
                <div>
                    <asp:Label ID="lblLocalidad" runat="server" Text="Localidad:" CssClass="Label"></asp:Label>

                    <asp:DropDownList ID="ddlLocalidad" runat="server" CssClass="DropDownList"></asp:DropDownList>
                </div>

                <!-- Email -->
                <div>
                    <asp:Label ID="lblCorreoElectronico" runat="server" Text="Correo electrónico:" CssClass="Label"></asp:Label>
                    <asp:TextBox ID="txtCorreoElectronico" runat="server" CssClass="TextBox" MaxLength="40"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvCorreo" runat="server" ControlToValidate="txtCorreoElectronico" ErrorMessage="Ingrese correo" CssClass="msg-error" ValidationGroup="2"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revCorreo" runat="server" ControlToValidate="txtCorreoElectronico" ErrorMessage="Correo inválido" ValidationExpression="^(?=.{1,40}$)[^@\s]+@[^@\s]+\.[^@\s]+$" CssClass="msg-error" ValidationGroup="2"></asp:RegularExpressionValidator>
                </div>

                <!-- Especialidad -->
                <div>
                    <asp:Label ID="lblEspecialidad" runat="server" Text="Especialidad:" CssClass="Label"></asp:Label>
                    <asp:DropDownList ID="ddlEspecialidad" runat="server" CssClass="DropDownList"></asp:DropDownList>
                </div>

                <!-- DIAS LABORALES (CheckBoxList) -->
                <div>
                    <asp:Label ID="lblDiasLaborales" runat="server" Text="Días laborales:" CssClass="Label"></asp:Label>

                    <asp:CheckBoxList ID="cblDiasLaborales" runat="server" CssClass="CheckBoxList">
                        <asp:ListItem Value="1">Lunes</asp:ListItem>
                        <asp:ListItem Value="2">Martes</asp:ListItem>
                        <asp:ListItem Value="3">Miercoles</asp:ListItem>
                        <asp:ListItem Value="4">Jueves</asp:ListItem>
                        <asp:ListItem Value="5">viernes</asp:ListItem>
                        <asp:ListItem Value="6">Sabado</asp:ListItem>
                        <asp:ListItem Value="7">Domingo</asp:ListItem>
                    </asp:CheckBoxList>
                </div>


                <!-- Hora entrada -->
                <div>
                    <asp:Label ID="lblHoraDeEntrada" runat="server" Text="Hora de entrada:" CssClass="Label"></asp:Label>
                    <asp:DropDownList ID="ddlHorarioDeEntrada" runat="server" CssClass="DropDownListHora"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvEntrada" runat="server" ControlToValidate="ddlHorarioDeEntrada" ErrorMessage="Ingrese horario" CssClass="msg-error" ValidationGroup="2"></asp:RequiredFieldValidator>
                </div>

                <!-- Hora salida -->
                <div>
                    <asp:Label ID="lblHoraDeSalida" runat="server" Text="Hora de salida:" CssClass="Label"></asp:Label>
                    <asp:DropDownList ID="ddlHorarioDeSalida" runat="server" CssClass="DropDownListHora"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvSalida" runat="server" ControlToValidate="ddlHorarioDeSalida" ErrorMessage="Ingrese horario" CssClass="msg-error" ValidationGroup="2"></asp:RequiredFieldValidator>
                </div>

                <!-- Usuario -->
                <div>
                    <asp:Label ID="lblUsuario" runat="server" Text="Nombre de usuario:" CssClass="Label"></asp:Label>
                    <asp:TextBox ID="txtNombreDeUsuario" runat="server" CssClass="TextBox" MaxLength="40"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvUsuario" runat="server" ControlToValidate="txtNombreDeUsuario" ErrorMessage="Ingrese usuario" CssClass="msg-error" ValidationGroup="2"></asp:RequiredFieldValidator>
                </div>

                <!-- Contraseña -->
                <div>
                    <asp:Label ID="lblContrasenia" runat="server" Text="Contraseña:" CssClass="Label"></asp:Label>
                    <asp:TextBox ID="txtContrasenia" runat="server" TextMode="Password" CssClass="TextBox" MaxLength="40"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvContrasenia" runat="server" ControlToValidate="txtContrasenia" ErrorMessage="Ingrese contraseña" CssClass="msg-error" ValidationGroup="2"></asp:RequiredFieldValidator>
                </div>
                <!-- Contraseña2 -->
                <div>
                    <asp:Label ID="lblContrasenia2" runat="server" Text="Contraseña:" CssClass="Label"></asp:Label>
                    <asp:TextBox ID="txtContrasenia2" runat="server" TextMode="Password" CssClass="TextBox" MaxLength="40"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvContrasenia2" runat="server" ControlToValidate="txtContrasenia2" ErrorMessage="Ingrese contraseña" CssClass="msg-error" ValidationGroup="2"></asp:RequiredFieldValidator>
                </div>

                <!-- Teléfono -->
                <div>
                    <asp:Label ID="lblTelefono" runat="server" Text="Telefono:" CssClass="Label"></asp:Label>
                    <asp:TextBox ID="txtTelefono" runat="server" CssClass="TextBox" MaxLength="10"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvTelefono" runat="server" ControlToValidate="txtTelefono" ErrorMessage="Ingrese un teléfono" CssClass="msg-error" ValidationGroup="2"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revTelefono" runat="server" ControlToValidate="txtTelefono" ErrorMessage="Ingrese un telefono válido" ValidationExpression="^[0-9]{10}$" CssClass="msg-error" ValidationGroup="2"></asp:RegularExpressionValidator>
                </div>

                <!-- BOTÓN MODIFICAR -->
                <div>
                    <asp:Button ID="btnModificar" runat="server" Text="Modificar" CssClass="Boton" ValidationGroup="2" OnClick="btnModificar_Click" />
                </div>
            </div>
        </div>
    </form>
</body>


</html>
