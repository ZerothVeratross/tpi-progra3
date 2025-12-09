<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReactivarPaciente.aspx.cs" Inherits="TPINT_GRUPO_2_PR3.ReactivarPaciente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
     <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
    <title>Reactivar Pacientes</title>

</head>
<body>
    <form id="form1" runat="server">
            <div class="Contenedor">
                    <asp:Label ID="lblNombreAdministrador" runat="server" Text="Nombre del Adminitrador" CssClass="LabelUsuario"></asp:Label>
                <div>
                    <asp:Label ID="lblReactivarPacientes" runat="server" class="form-title" Text="Reactivar Pacientes" CssClass="Titulo"></asp:Label>
                </div>
                <div>
                    <asp:Label ID="lblBusqueda" runat="server" Text="Buscar por DNI, nombre o apellido" CssClass="Label"></asp:Label>
                    <asp:TextBox ID="txtBusqueda" runat="server" CssClass="TextBox"></asp:TextBox>
                    <asp:Button ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click" CssClass="Boton"/>
                </div>
                <div>
                    <asp:Label ID="lblBuscarProvincia" runat="server" Text="Filtrar por Provincia" CssClass="Label"></asp:Label>
                    <asp:DropDownList ID="ddlProvincia" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlProvincia_SelectedIndexChanged" CssClass="DropDownList">
                    </asp:DropDownList>
                     <asp:Label ID="lblBuscarPorLocalidad" runat="server" Text="Filtrar por Localidad" CssClass="Label"></asp:Label>
                    <asp:DropDownList ID="ddlLocalidad" runat="server" CssClass="DropDownList">
                    </asp:DropDownList>
                 </div>
                <div>
                   <asp:Button ID="btnFiltrar" runat="server" Text="Filtrar" OnClick="btnFiltrar_Click" CssClass="Boton"/>
                   <asp:Button ID="btnLimpiarTodosLosPacientes" runat="server" Text="Mostrar todos los pacientes" OnClick="btnLimpiarTodosLosPacientes_Click" CssClass="Boton"/>
                </div>
                <div>
                    <asp:Label ID="lblMensajeAConfirmar" runat="server" CssClass="Label" Font-Bold="True"></asp:Label>
                    <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" Visible="False" OnClick="btnAceptar_Click" CssClass="Boton"/>
                    <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" Visible="False" OnClick="btnCancelar_Click" CssClass="Boton-danger"/>
                    <asp:Label ID="lblExisto" runat="server" CssClass="msg-exito"></asp:Label>
                    <asp:Label ID="lblError" runat="server" CssClass="msg-error"></asp:Label>
                </div>
                <div>
                    <asp:GridView ID="gvListaReactivarPacientes" runat="server" AllowPaging="True" PageSize="4" DataKeyNames="DNI" OnPageIndexChanging="gvListaReactivarPacientes_PageIndexChanging" OnRowCommand="gvListaReactivarPacientes_RowCommand" CssClass="GridView">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="btnReactivar" runat="server" Text="Reactivar" CommandName="Reactivar" CommandArgument='<%# Eval("DNI") %>' CssClass="Boton" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
                <div>
                    <br />
                    <asp:HyperLink ID="hlVolverMenu" runat="server" NavigateUrl="~/MenuAdministrador.aspx" CssClass="HyperLink">Volver al menú anterior</asp:HyperLink>
                </div>
            </div>
    </form>
</body>
</html>
