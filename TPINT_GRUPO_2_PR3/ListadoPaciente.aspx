<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListadoPaciente.aspx.cs" Inherits="TPINT_GRUPO_2_PR3.ListadoPaciente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
     <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
    <title>Lista de pacientes</title>    
 
</head>
<body>
    <form id="form1" runat="server">
        <div class="Contenedor">
            <asp:Label ID="lblNombreAdministrador" runat="server" Text="Nombre del Adminitrador" CssClass="LabelUsuario"></asp:Label>
            <div>
                <asp:Label ID="lblListarPacientes" runat="server" class="form-title" Text="Lista de pacientes" CssClass="Titulo"></asp:Label>
            </div>
           <div>
               <asp:Label ID="lblBusqueda" runat="server" Text="Buscar por DNI, nombre, apellido o sexo" CssClass="Label"></asp:Label>
               <asp:TextBox ID="txtBusqueda" runat="server" CssClass="TextBox"></asp:TextBox>
               <asp:Button ID="btnBusqueda" runat="server" Text="Buscar" OnClick="btnBusqueda_Click" CssClass="Boton"/>
           </div>
            <div>
                <asp:Label ID="lblBuscarProvincia" runat="server" Text="Filtrar por Provincia" CssClass="Label"></asp:Label>
                <asp:DropDownList ID="ddlProvincia" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlProvincia_SelectedIndexChanged" CssClass="DropDownList">
                </asp:DropDownList>
                <asp:Label ID="lblBuscarLocalidad" runat="server" Text="Buscar por Localidad:" CssClass="Label"></asp:Label>
               <asp:DropDownList ID="ddlLocalidad" runat="server" CssClass="DropDownList">
               </asp:DropDownList>
            </div>
            <div>
                <asp:Button ID="btnFiltrar" runat="server" Text="Filtrar" OnClick="btnFiltrar_Click" CssClass="Boton"/>
                <asp:Button ID="btnMostrarTodosPacientes" runat="server" Text="Listar todos los pacientes" OnClick="btnMostrarTodosPacientes_Click" CssClass="Boton"/>
            </div>
            <div>
                <asp:GridView ID="gvListaPacientes" runat="server" DataKeyNames="DNI" AllowPaging="True" PageSize="5" OnPageIndexChanging="gvListaPacientes_PageIndexChanging" CssClass="GridView">
                    <Columns>
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