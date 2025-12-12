<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TurnosAsignados.aspx.cs" Inherits="TPINT_GRUPO_2_PR3.TurnosAsignados" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
    <title>Turnos Asignados</title>

</head>
<body>
    <form id="form1" runat="server">
        <div class="CentrarContenido">
            <div class="Contenedor">
                <asp:Label ID="lblUsuario" runat="server" Text="Nombre del Médico" CssClass="LabelUsuario"></asp:Label>
                <div>
                    <asp:Label ID="lblTurnosAsignados" runat="server" class="form-title" Text="Turnos Asignados" CssClass="Titulo"></asp:Label>
                </div>
                <div>
                    <asp:Label ID="lblBuscar" runat="server" Text="Buscar por Nombre y apellido:" CssClass="Label"></asp:Label>
                    <asp:TextBox ID="txtBuscar" runat="server" CssClass="TextBox"></asp:TextBox>
                    <asp:Button ID="btnBuscar" runat="server" OnClick="btnBuscar_Click" Text="Buscar" CssClass="Boton" />
                </div>
                <div>
                    <asp:Label ID="Label1" runat="server" Text="Filtrar:" CssClass="Label"></asp:Label>
                    <asp:DropDownList ID="ddlFiltro" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlFiltro_SelectedIndexChanged" CssClass="DropDownList">
                        <asp:ListItem Text="Seleccione un filtro" />
                        <asp:ListItem Text="Sexo" />
                        <asp:ListItem Text="Provincia" />
                        <asp:ListItem Text="Asistencia" />
                    </asp:DropDownList>
                    <asp:DropDownList ID="ddlFiltro2" runat="server" CssClass="DropDownList">
                    </asp:DropDownList>
                </div>
                <div>
                    <asp:Button ID="btnFiltrar" runat="server" Text="Filtrar" OnClick="btnFiltrar_Click" CssClass="Boton" />
                    <asp:Button ID="btnMostrarTodos" runat="server" Text="Mostrar todos" OnClick="btnMostrarTodos_Click" CssClass="Boton" />
                </div>
                <div>
                    <asp:GridView ID="gvTurnosAsignados" runat="server" AutoGenerateColumns="false" OnPageIndexChanging="gvTurnosAsignados_PageIndexChanging" PageSize="5" AllowPaging="True" CssClass="GridView">
                        <Columns>
                            <asp:BoundField HeaderText="ID" DataField="ID" />
                            <asp:BoundField HeaderText="DNI" DataField="DNI" />
                            <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                            <asp:BoundField HeaderText="Apellido" DataField="Apellido" />
                            <asp:BoundField HeaderText="Sexo" DataField="Sexo" />
                            <asp:BoundField HeaderText="Fecha de nacimiento" DataField="FechaNacimiento" />
                            <asp:BoundField HeaderText="Provincia" DataField="Provincia" />
                            <asp:BoundField HeaderText="Fecha del turno" DataField="Fecha" />
                            <asp:BoundField HeaderText="Hora del turno" DataField="Hora" />
                            <asp:BoundField HeaderText="Asistencia" DataField="Asistencia" />
                            <asp:BoundField HeaderText="Observaciones" DataField="Observaciones" />
                        </Columns>
                    </asp:GridView>
                    <br />
                </div>
                <div>
                    <br />
                    <asp:HyperLink ID="hlMenuAnterior" runat="server" NavigateUrl="~/MenuMedico.aspx" CssClass="HyperLink">Volver al menú anterior</asp:HyperLink>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
