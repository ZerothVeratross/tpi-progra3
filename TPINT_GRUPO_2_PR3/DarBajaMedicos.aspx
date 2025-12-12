<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DarBajaMedicos.aspx.cs" Inherits="TPINT_GRUPO_2_PR3.DarBajaMedico" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
    <title>Dar Baja Médico</title>
</head>

<body>
    <form id="form1" runat="server">
        <div class="CentrarContenido">
            <div class="Contenedor">
                <div class="Fila">
                    <!-- Usuario arriba -->
                    <div>
                        <asp:Label ID="lblUsuario" runat="server" Text="Nombre de usuario" CssClass="LabelUsuario"></asp:Label>
                    </div>
                    <!-- Volver al menú -->
                    <div class="Columna40-Hyperlink">
                        <asp:HyperLink ID="hlMenu" runat="server" NavigateUrl="~/MenuAdministrador.aspx" CssClass="HyperLink">Volver al menú</asp:HyperLink>
                    </div>
                </div>
                <!-- Título -->
                <div>
                    <asp:Label ID="lblTitulo" runat="server" Text="Dar de baja a un médico" CssClass="Titulo"></asp:Label>
                </div>
                <!-- DNI -->
                <br />
                <div>
                    <asp:Label ID="lblDNI" runat="server" Text="Ingrese el DNI del médico:" CssClass="Label" ></asp:Label>
                    <asp:TextBox ID="txtDNI" runat="server" MaxLength="9" CssClass="TextBox"></asp:TextBox>
                    <asp:Button ID="btnBuscarMedico" runat="server" Text="Buscar Médico" CssClass="Boton" OnClick="btnBuscarMedico_Click"></asp:Button>
                </div>
                <!-- Validación -->
                <div>
                    <asp:Label ID="lblMensaje" runat="server" CssClass="msg-exito"></asp:Label>
                    <asp:RegularExpressionValidator ID="revDNI" runat="server" ControlToValidate="txtDNI" ErrorMessage="Ingrese un DNI válido" ValidationExpression="^[0-9]+$" CssClass="msg-error">               </asp:RegularExpressionValidator>
                </div>
                <!-- Botones Eliminar / Confirmar -->
                <div class="Fila">
                    <asp:Button ID="btnEliminar" runat="server" Text="Eliminar Médico" CssClass="Boton" Visible="False" OnClick="btnEliminar_Click" />
                    <asp:Button ID="btnConfirmar" runat="server" Text="Confirmar" CssClass="Boton" Visible="False" OnClick="btnConfirmar_Click" />
                    <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="Boton-danger" Visible="False" OnClick="btnCancelar_Click" />
                </div>
                <!-- GRIDVIEW -->
                <div class="Fila">
                    <asp:GridView ID="gvEliminarMedico" runat="server" CssClass="GridView"></asp:GridView>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
