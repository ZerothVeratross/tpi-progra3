<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MenuAdministrador.aspx.cs" Inherits="TPINT_GRUPO_2_PR3.MenuAdministrador" %>

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
            height: 24px;
        }

        .auto-style3 {
            height: 25px;
        }

        .auto-style4 {
            width: 486px;
        }

        .auto-style5 {
            height: 25px;
            width: 486px;
        }

        .auto-style6 {
            height: 24px;
            width: 486px;
        }

        .auto-style7 {
            width: 486px;
            height: 26px;
        }

        .auto-style8 {
            height: 26px;
        }

        .auto-style9 {
            width: 486px;
            height: 29px;
        }

        .auto-style10 {
            height: 29px;
        }

        .auto-style11 {
            margin-left: 40px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td colspan="2">
                        <asp:Label ID="lblAdmin" runat="server" Text="Nombre del Administrador"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style11">
                        <asp:Label ID="lblMenuAdministrador" runat="server" ForeColor="Black" Text="Menu Administrador" Style="font-weight: bold;"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <asp:Label ID="lblGestionPacientes" runat="server" Text="Gestion de Pacientes:"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:DropDownList ID="ddlOpcPacientes" runat="server">
                            <asp:ListItem>-- Selecciona una opción --</asp:ListItem>
                            <asp:ListItem Value="Alta">Alta de paciente</asp:ListItem>
                            <asp:ListItem Value="Modificar ">Modificar Paciente</asp:ListItem>
                            <asp:ListItem Value="Baja">Baja de Paciente</asp:ListItem>
                            <asp:ListItem Value="Listado">Listado de Paciente</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">
                        <asp:Label ID="lblGestionMedicos" runat="server" Text="Gestion de Medicos:"></asp:Label>
                    </td>
                    <td class="auto-style10">
                        <asp:DropDownList ID="ddlOpcMedicos" runat="server">
                            <asp:ListItem>-- Seleccione una opción --</asp:ListItem>
                            <asp:ListItem Value="Alta">Alta Medico</asp:ListItem>
                            <asp:ListItem Value="Modificar">Modificar Medico</asp:ListItem>
                            <asp:ListItem Value="Baja">Baja de Medico</asp:ListItem>
                            <asp:ListItem Value="Listado">Listado de Medico</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6"></td>
                    <td class="auto-style2">
                        <asp:HyperLink ID="hlAsignarTurnos" runat="server" NavigateUrl="~/AsignacionTurnos.aspx">Asignar Turnos</asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7"></td>
                    <td class="auto-style8">
                        <asp:HyperLink ID="hlInformes" runat="server" NavigateUrl="~/InformesYReportes.aspx">Informes y Reportes</asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:HyperLink ID="hlCerrarSesion" runat="server" NavigateUrl="~/Login.aspx">Cerrar Sesión</asp:HyperLink>
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
