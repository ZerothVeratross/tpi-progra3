<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TurnosAsignados.aspx.cs" Inherits="TPINT_GRUPO_2_PR3.TurnosAsignados" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style5 {
            width: 260px;
        }

        .auto-style6 {
            height: 29px;
            width: 260px;
        }

        .auto-style8 {
            width: 260px;
            height: 33px;
        }

        .auto-style9 {
            height: 33px;
        }
        .auto-style10 {
            width: 259px;
        }
        .auto-style11 {
            height: 29px;
            width: 259px;
        }
        .auto-style12 {
            width: 189px;
            height: 33px;
        }
        .auto-style13 {
            width: 189px;
        }
        .auto-style14 {
            height: 29px;
            width: 189px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table class="auto-style1">
            <tr>
                <td class="auto-style13">
                    <asp:Label ID="lblUsuario" runat="server" Text="Nombre del Médico"></asp:Label>
                </td>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style9">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style5">
                    <asp:Label ID="lblTurnosAsignados" runat="server" Font-Bold="True" Font-Size="Large" Text="Turnos Asignados"></asp:Label>
                </td>
                <td class="auto-style9">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style9">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style13">
                    <asp:Label ID="lblBuscar" runat="server" Text="Buscar por Nombre y apellido:"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="txtBuscar" runat="server" Width="244px"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnBuscar" runat="server" OnClick="btnBuscar_Click" Text="Buscar" />
                </td>
                <td class="auto-style9">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style14">
                    <asp:Label ID="Label1" runat="server" Text="Filtrar:"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:DropDownList ID="ddlFiltro" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlFiltro_SelectedIndexChanged">
                        <asp:ListItem Text="Seleccione un filtro" />                            
                        <asp:ListItem Text="Sexo" />
                        <asp:ListItem Text="Provincia" />
                        <asp:ListItem Text="Asistencia" />
                    </asp:DropDownList>
                </td>
                <td class="auto-style10">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style5">
                    <asp:DropDownList ID="ddlFiltro2" runat="server">
                    </asp:DropDownList>
                </td>
                <td class="auto-style9">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style12"></td>
                <td class="auto-style8">
                    <asp:Button ID="btnFiltrar" runat="server" Text="Filtrar" OnClick="btnFiltrar_Click" />
                    <asp:Button ID="btnMostrarTodos" runat="server" Text="Mostrar todos" OnClick="btnMostrarTodos_Click" />
                </td>
                <td class="auto-style11">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style5">
                    <asp:GridView ID="gvTurnosAsignados" runat="server" Width="483px" AutoGenerateColumns="false" Height="189px">
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
                </td>
                <td class="auto-style9">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style13">
                    <asp:Label ID="lblError" runat="server"></asp:Label>
                    <br />
                    <br />
                    <br />
                    <asp:HyperLink ID="hlMenuAnterior" runat="server" NavigateUrl="~/MenuMedico.aspx">Volver al menú anterior</asp:HyperLink>
                    <br />
                </td>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style9">&nbsp;</td>
            </tr>
        </table>
    </div>
</form>
</body>
</html>
