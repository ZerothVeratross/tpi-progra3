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
        <div class="Contenedor">

            <!-- Usuario -->
            <asp:Label ID="lblNombreDeUsuario" runat="server" CssClass="LabelUsuario"></asp:Label>

            <!-- Volver al menú -->
            <div style="text-align: right; margin-bottom: 20px;">
                <asp:HyperLink ID="hlVolverAlMenu" runat="server" NavigateUrl="~/MenuAdministrador.aspx" CssClass="HyperLink">
                    Volver al menú
                </asp:HyperLink>
            </div>

            <!-- BUSCAR LEGAJO -->
            <div class="Fila" style="overflow: hidden; margin-bottom: 10px;">
                <asp:Label ID="lblBuscarLegajo" runat="server"
                    Text="Ingrese el legajo a buscar:"
                    Style="float: left; width: 220px; margin-right: 15px; line-height: 38px;">
                </asp:Label>

                <asp:TextBox ID="txtBuscarLegajo" runat="server"
                    Style="float: left; width: 220px; height: 38px; margin-right: 15px;">
                </asp:TextBox>

                <asp:Button ID="btnBuscarLegajo" runat="server"
                    Text="Buscar"
                    CssClass="Boton"
                    Style="float: left; height: 38px; margin-right: 15px;"
                    OnClick="btnBuscarLegajo_Click"
                    ValidationGroup="1" />

                <asp:RequiredFieldValidator
                    ID="rfvBuscarLegajo"
                    runat="server"
                    ControlToValidate="txtBuscarLegajo"
                    ErrorMessage="Ingrese un legajo para buscar"
                    CssClass="msg-error"
                    Style="float: left; line-height: 38px;"
                    ValidationGroup="1">
                </asp:RequiredFieldValidator>
            </div>

            <!-- RESULTADO LEGAJO -->
            <div class="Fila" style="overflow: hidden;">
                <asp:Label ID="lblLegajo" runat="server"
                    Text="Legajo:"
                    Style="float: left; width: 220px; margin-right: 15px; line-height: 38px;">
                </asp:Label>

                <asp:Label ID="lblLegajoEncontrado" runat="server"
                    Style="float: left; width: 220px; line-height: 38px;">
                </asp:Label>

                <asp:Label ID="lblMensaje" runat="server"
                    Style="float: left; line-height: 38px; margin-left: 15px;">
                </asp:Label>
            </div>

            <!-- DNI -->
            <div class="Fila" style="overflow: hidden;">
                <asp:Label ID="lblDNI" runat="server" Text="DNI:"
                    Style="float: left; width: 220px; margin-right: 15px; line-height: 38px;"></asp:Label>

                <asp:TextBox ID="txtDNI" runat="server"
                    Style="float: left; width: 220px; height: 38px; margin-right: 15px;"></asp:TextBox>

                <asp:RequiredFieldValidator ID="rfvDNI" runat="server"
                    ControlToValidate="txtDNI"
                    ErrorMessage="Ingrese un DNI"
                    CssClass="msg-error"
                    Style="float: left; line-height: 38px;"
                    ValidationGroup="2">
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator
                    ID="revDNI"
                    runat="server"
                    ControlToValidate="txtDNI"
                    ErrorMessage="Ingrese un DNI válido"
                    ValidationExpression="^[0-9]+$"
                    CssClass="msg-error" 
                    ValidationGroup="2">
                </asp:RegularExpressionValidator>
            </div>

            <!-- Nombre -->
            <div class="Fila" style="overflow: hidden;">
                <asp:Label ID="lblNombre" runat="server" Text="Nombre:"
                    Style="float: left; width: 220px; margin-right: 15px; line-height: 38px;"></asp:Label>

                <asp:TextBox ID="txtNombre" runat="server"
                    Style="float: left; width: 220px; height: 38px; margin-right: 15px;"></asp:TextBox>

                <asp:RequiredFieldValidator ID="rfvNombre" runat="server"
                    ControlToValidate="txtNombre"
                    ErrorMessage="Ingrese un nombre"
                    CssClass="msg-error"
                    Style="float: left; line-height: 38px;"
                    ValidationGroup="2"></asp:RequiredFieldValidator>
            </div>

            <!-- Apellido -->
            <div class="Fila" style="overflow: hidden;">
                <asp:Label ID="lblApellido" runat="server" Text="Apellido:"
                    Style="float: left; width: 220px; margin-right: 15px; line-height: 38px;"></asp:Label>

                <asp:TextBox ID="txtApellido" runat="server"
                    Style="float: left; width: 220px; height: 38px; margin-right: 15px;"></asp:TextBox>

                <asp:RequiredFieldValidator ID="rfvApellido" runat="server"
                    ControlToValidate="txtApellido"
                    ErrorMessage="Ingrese un apellido"
                    CssClass="msg-error"
                    Style="float: left; line-height: 38px;"
                    ValidationGroup="2"></asp:RequiredFieldValidator>
            </div>

            <!-- Sexo -->
            <div class="Fila" style="overflow: hidden;">
                <asp:Label ID="lblSexo" runat="server" Text="Sexo:"
                    Style="float: left; width: 220px; margin-right: 15px; line-height: 38px;"></asp:Label>

                <asp:RadioButtonList ID="rblSexo" runat="server"
                    Style="float: left; margin-right: 15px;">
                    <asp:ListItem>Masculino</asp:ListItem>
                    <asp:ListItem>Femenino</asp:ListItem>
                </asp:RadioButtonList>

                <asp:RequiredFieldValidator ID="rfvSexo" runat="server"
                    ControlToValidate="rblSexo"
                    ErrorMessage="Seleccione un sexo"
                    CssClass="msg-error"
                    Style="float: left; line-height: 38px;"
                    ValidationGroup="2"></asp:RequiredFieldValidator>
            </div>

            <!-- Nacionalidad -->
            <div class="Fila" style="overflow: hidden;">
                <asp:Label ID="lblNacionalidad" runat="server" Text="Nacionalidad:"
                    Style="float: left; width: 220px; margin-right: 15px; line-height: 38px;"></asp:Label>

                <asp:TextBox ID="txtNacionalidad" runat="server"
                    Style="float: left; width: 220px; height: 38px; margin-right: 15px;"></asp:TextBox>

                <asp:RequiredFieldValidator ID="rfvNacionalidad" runat="server"
                    ControlToValidate="txtNacionalidad"
                    ErrorMessage="Ingrese una nacionalidad"
                    CssClass="msg-error"
                    Style="float: left; line-height: 38px;"
                    ValidationGroup="2"></asp:RequiredFieldValidator>
            </div>

            <!-- Fecha nacimiento -->
            <div class="Fila" style="overflow: hidden;">
                <asp:Label ID="lblFechaDeNacimiento" runat="server" Text="Fecha de nacimiento:"
                    Style="float: left; width: 220px; margin-right: 15px; line-height: 38px;"></asp:Label>

                <asp:TextBox ID="txtFechaDeNacimiento" runat="server" TextMode="Date"
                    Style="float: left; width: 220px; height: 38px; margin-right: 15px;"></asp:TextBox>

                <asp:RequiredFieldValidator ID="rfvFechaDeNacimiento" runat="server"
                    ControlToValidate="txtFechaDeNacimiento"
                    ErrorMessage="Seleccione fecha"
                    CssClass="msg-error"
                    Style="float: left; line-height: 38px;"
                    ValidationGroup="2"></asp:RequiredFieldValidator>
            </div>

            <!-- Dirección -->
            <div class="Fila" style="overflow: hidden;">
                <asp:Label ID="lblDireccion" runat="server" Text="Dirección:"
                    Style="float: left; width: 220px; margin-right: 15px; line-height: 38px;"></asp:Label>

                <asp:TextBox ID="txtDireccion" runat="server"
                    Style="float: left; width: 220px; height: 38px; margin-right: 15px;"></asp:TextBox>

                <asp:RequiredFieldValidator ID="rfvDireccion" runat="server"
                    ControlToValidate="txtDireccion"
                    ErrorMessage="Ingrese dirección"
                    CssClass="msg-error"
                    Style="float: left; line-height: 38px;"
                    ValidationGroup="2"></asp:RequiredFieldValidator>
            </div>

            <!-- Provincia -->
            <div class="Fila" style="overflow: hidden;">
                <asp:Label ID="lblProvincia" runat="server" Text="Provincia:"
                    Style="float: left; width: 220px; margin-right: 15px; line-height: 38px;"></asp:Label>

                <asp:DropDownList ID="ddlProvincia" runat="server"
                    AutoPostBack="True"
                    OnSelectedIndexChanged="ddlProvincia_SelectedIndexChanged"
                    Style="float: left; width: 220px; height: 38px; margin-right: 15px;">
                </asp:DropDownList>
            </div>

            <!-- Localidad -->
            <div class="Fila" style="overflow: hidden;">
                <asp:Label ID="lblLocalidad" runat="server" Text="Localidad:"
                    Style="float: left; width: 220px; margin-right: 15px; line-height: 38px;"></asp:Label>

                <asp:DropDownList ID="ddlLocalidad" runat="server"
                    Style="float: left; width: 220px; height: 38px; margin-right: 15px;">
                </asp:DropDownList>
            </div>

            <!-- Email -->
            <div class="Fila" style="overflow: hidden;">
                <asp:Label ID="lblCorreoElectronico" runat="server" Text="Correo electrónico:"
                    Style="float: left; width: 220px; margin-right: 15px; line-height: 38px;"></asp:Label>

                <asp:TextBox ID="txtCorreoElectronico" runat="server"
                    Style="float: left; width: 220px; height: 38px; margin-right: 15px;"></asp:TextBox>

                <asp:RequiredFieldValidator ID="rfvCorreo" runat="server"
                    ControlToValidate="txtCorreoElectronico"
                    ErrorMessage="Ingrese correo"
                    CssClass="msg-error"
                    Style="float: left; line-height: 38px;"
                    ValidationGroup="2"></asp:RequiredFieldValidator>
            </div>

            <!-- Especialidad -->
            <div class="Fila" style="overflow: hidden;">
                <asp:Label ID="lblEspecialidad" runat="server" Text="Especialidad:"
                    Style="float: left; width: 220px; margin-right: 15px; line-height: 38px;"></asp:Label>

                <asp:DropDownList ID="ddlEspecialidad" runat="server"
                    Style="float: left; width: 220px; height: 38px; margin-right: 15px;">
                </asp:DropDownList>
            </div>

            <!-- DIAS LABORALES (CheckBoxList) -->
            <div class="Fila" style="overflow: hidden; margin-bottom: 5px;">
                <asp:Label ID="lblDiasLaborales" runat="server" Text="Días laborales:"
                    Style="float: left; width: 220px; margin-right: 15px; line-height: 38px;"></asp:Label>

                <asp:CheckBoxList ID="cblDiasLaborales" runat="server"
                    Style="float: left; margin-right: 15px;">
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
            <div class="Fila" style="overflow: hidden;">
                <asp:Label ID="lblHoraDeEntrada" runat="server" Text="Hora de entrada:"
                    Style="float: left; width: 220px; margin-right: 15px; line-height: 38px;"></asp:Label>

                <asp:DropDownList ID="ddlHorarioDeEntrada" runat="server"
                    Style="float: left; width: 220px; height: 38px; margin-right: 15px;">
                </asp:DropDownList>

                <asp:RequiredFieldValidator ID="rfvEntrada" runat="server"
                    ControlToValidate="ddlHorarioDeEntrada"
                    ErrorMessage="Ingrese horario"
                    CssClass="msg-error"
                    Style="float: left; line-height: 38px;"
                    ValidationGroup="2"></asp:RequiredFieldValidator>
            </div>

            <!-- Hora salida -->
            <div class="Fila" style="overflow: hidden;">
                <asp:Label ID="lblHoraDeSalida" runat="server" Text="Hora de salida:"
                    Style="float: left; width: 220px; margin-right: 15px; line-height: 38px;"></asp:Label>

                <asp:DropDownList ID="ddlHorarioDeSalida" runat="server"
                    Style="float: left; width: 220px; height: 38px; margin-right: 15px;">
                </asp:DropDownList>

                <asp:RequiredFieldValidator ID="rfvSalida" runat="server"
                    ControlToValidate="ddlHorarioDeSalida"
                    ErrorMessage="Ingrese horario"
                    CssClass="msg-error"
                    Style="float: left; line-height: 38px;"
                    ValidationGroup="2"></asp:RequiredFieldValidator>
            </div>

            <!-- Usuario -->
            <div class="Fila" style="overflow: hidden;">
                <asp:Label ID="lblUsuario" runat="server" Text="Nombre de usuario:"
                    Style="float: left; width: 220px; margin-right: 15px; line-height: 38px;"></asp:Label>

                <asp:TextBox ID="txtNombreDeUsuario" runat="server"
                    Style="float: left; width: 220px; height: 38px; margin-right: 15px;"></asp:TextBox>

                <asp:RequiredFieldValidator ID="rfvUsuario" runat="server"
                    ControlToValidate="txtNombreDeUsuario"
                    ErrorMessage="Ingrese usuario"
                    CssClass="msg-error"
                    Style="float: left; line-height: 38px;"
                    ValidationGroup="2"></asp:RequiredFieldValidator>
            </div>

            <!-- Contraseña -->
            <div class="Fila" style="overflow: hidden;">
                <asp:Label ID="lblContrasenia" runat="server" Text="Contraseña:"
                    Style="float: left; width: 220px; margin-right: 15px; line-height: 38px;"></asp:Label>

                <asp:TextBox ID="txtContrasenia" runat="server"
                    Style="float: left; width: 220px; height: 38px; margin-right: 15px;" TextMode="Password"></asp:TextBox>

                <asp:RequiredFieldValidator ID="rfvContrasenia" runat="server"
                    ControlToValidate="txtContrasenia"
                    ErrorMessage="Ingrese contraseña"
                    CssClass="msg-error"
                    Style="float: left; line-height: 38px;"
                    ValidationGroup="2"></asp:RequiredFieldValidator>
            </div>

            <!-- Teléfono -->
            <div class="Fila" style="overflow: hidden;">
                <asp:Label ID="lblTelefono" runat="server" Text="Telefono:"
                    Style="float: left; width: 220px; margin-right: 15px; line-height: 38px;"></asp:Label>

                <asp:TextBox ID="txtTelefono" runat="server"
                    Style="float: left; width: 220px; height: 38px; margin-right: 15px;"></asp:TextBox>

                <asp:RequiredFieldValidator ID="rfvTelefono" runat="server"
                    ControlToValidate="txtTelefono"
                    ErrorMessage="Ingrese un teléfono"
                    CssClass="msg-error"
                    Style="float: left; line-height: 38px;"
                    ValidationGroup="2">
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator
                    ID="revTelefono"
                    runat="server"
                    ControlToValidate="txtTelefono"
                    ErrorMessage="Ingrese un telefono válido"
                    ValidationExpression="^[0-9]+$"
                    CssClass="msg-error" 
                    ValidationGroup="2">
                </asp:RegularExpressionValidator>
            </div>

            <!-- BOTÓN MODIFICAR -->
            <div style="margin-top: 20px;">
                <asp:Button ID="btnModificar" runat="server"
                    Text="Modificar"
                    CssClass="Boton"
                    ValidationGroup="2"
                    OnClick="btnModificar_Click" />
            </div>

        </div>
    </form>
</body>


</html>
