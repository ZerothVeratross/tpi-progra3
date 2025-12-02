<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MenuAdministrador.aspx.cs" Inherits="TPINT_GRUPO_2_PR3.MenuAdministrador" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Menú Administrador</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="CentrarContenido">
            <div class="Contenedor">
                <asp:Label ID="lblAdmin" runat="server" Text="Nombre del Administrador" CssClass="LabelUsuario"></asp:Label>
                <div>
                    <asp:Label ID="lblMenuAdministrador" runat="server" Text="Menu Administrador" CssClass="Titulo" ></asp:Label>
                </div>
                <div>
                     <br />
                    <asp:Label ID="lblGestionPacientes" runat="server" Text="Gestion de Pacientes:" CssClass="Label"></asp:Label>
                    <asp:DropDownList ID="ddlOpcPacientes" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlOpcPacientes_SelectedIndexChanged" CssClass="DropDownList">
                        <asp:ListItem>-- Selecciona una opción --</asp:ListItem>
                        <asp:ListItem Value="Alta">Alta de paciente</asp:ListItem>
                        <asp:ListItem Value="Modificar">Modificar Paciente</asp:ListItem>
                        <asp:ListItem Value="Baja">Baja de Paciente</asp:ListItem>
                        <asp:ListItem Value="Listado">Listado de Paciente</asp:ListItem>
                        <asp:ListItem Value="Reactivar">Reactivar Paciente</asp:ListItem>
                    </asp:DropDownList>
                     <br />
                </div>
                <div>
                     <br />
                    <asp:Label ID="lblGestionMedicos" runat="server" Text="Gestion de Medicos:" CssClass="Label"></asp:Label>
                    <asp:DropDownList ID="ddlOpcMedicos" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlOpcMedicos_SelectedIndexChanged" CssClass="DropDownList">
                        <asp:ListItem>-- Seleccione una opción --</asp:ListItem>
                        <asp:ListItem Value="Alta">Alta Medico</asp:ListItem>
                        <asp:ListItem Value="Modificar">Modificar Medico</asp:ListItem>
                        <asp:ListItem Value="Baja">Baja de Medico</asp:ListItem>
                        <asp:ListItem Value="Listado">Listado de Medico</asp:ListItem>
                    </asp:DropDownList>
                     <br />
                </div>
                <div>
                     <br />
                    <asp:HyperLink ID="hlAsignarTurnos" runat="server" NavigateUrl="~/AsignacionTurnos.aspx" CssClass="HyperLink">Asignar Turnos</asp:HyperLink>
                    <br />
                </div>
                <div>
                     <br />
                    <asp:HyperLink ID="hlInformes" runat="server" NavigateUrl="~/InformesYReportes.aspx" CssClass="HyperLink">Informes y Reportes</asp:HyperLink>
                    <br />
                </div>
                <div>
                     <br />
                    <asp:LinkButton ID="btnCerrarSesion" runat="server" OnClick="btnCerrarSesion_Click" CssClass="LinkButton">Cerrar Sesión</asp:LinkButton>
                    <br />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
