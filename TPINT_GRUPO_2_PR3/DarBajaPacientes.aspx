<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DarBajaPacientes.aspx.cs" Inherits="TPINT_GRUPO_2_PR3.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
    <title>Baja de pacientes</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="CentrarContenido">
            <div class="Contenedor">
                <div class="Fila">
                    <div>
                        <asp:Label ID="lblNombreAdministrador" runat="server" Text="Nombre del Adminitrador" CssClass="LabelUsuario"></asp:Label>
                    </div>
                    <div class="Columna40-Hyperlink">
                        <asp:HyperLink ID="hlVolverMenu" runat="server" NavigateUrl="~/MenuAdministrador.aspx" CssClass="HyperLink">Volver al menú</asp:HyperLink>
                    </div>
                </div>
                <div>
                    <asp:Label ID="lblDarBajaPaciente" runat="server" class="form-title" Text="Dar de baja paciente" CssClass="Titulo"></asp:Label>
                </div>
                <div>
                    <asp:Label ID="lblDNI" runat="server" Text="Ingrese el DNI del paciente que desea dar de baja" CssClass="Label"></asp:Label>
                </div>
                <div>
                    <asp:TextBox ID="txtDNI" runat="server" CssClass="TextBox"></asp:TextBox>
                    <asp:Label ID="lblMsjDNI" runat="server" Text="Ingresar sólo números" CssClass="Label" Font-Bold="True" Font-Size="Small"></asp:Label>
                </div>
                <div>
                    <asp:Button ID="btnDarBaja" runat="server" Text="Dar de baja" OnClick="btnDarBaja_Click" CssClass="Boton" />
                </div>
                <div>
                    <asp:Label ID="lblMensaje" runat="server" CssClass="Label"></asp:Label>
                    <asp:Label ID="lblMensajeConfirmacion" runat="server" CssClass="msg-exito"></asp:Label>
                    <asp:Label ID="lblMensajeError" runat="server" CssClass="msg-error"></asp:Label>
                </div>
                <div>
                    <asp:GridView ID="gvPacienteABorrar" runat="server" Visible="False" CssClass="GridView"></asp:GridView>
                </div>
                <div>
                    <br />
                    <asp:Button ID="btnConfirmar" runat="server" Text="Confirmar" OnClick="btnConfirmar_Click" CssClass="Boton" />
                    <asp:Button ID="btnCerrar" runat="server" Text="Cancelar" OnClick="btnCerrar_Click" CssClass="Boton-danger" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
