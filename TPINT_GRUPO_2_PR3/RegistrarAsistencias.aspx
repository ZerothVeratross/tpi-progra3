<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrarAsistencias.aspx.cs" Inherits="TPINT_GRUPO_2_PR3.RegistrarAsistencias" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Registrar asistencias</title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            width: 269px;
        }

        .auto-style3 {
            width: 298px;
        }

        .auto-style4 {
            width: 269px;
            height: 33px;
        }

        .auto-style5 {
            width: 298px;
            height: 33px;
        }

        .auto-style6 {
            height: 33px;
        }

        .auto-style7 {
            width: 110px;
        }

        .auto-style8 {
            height: 33px;
            width: 110px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblUsuario" runat="server" Text="Nombre del Médico"></asp:Label>
                    </td>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">
                        <asp:Label ID="lblRegistrarAsistencias" runat="server" Font-Bold="True" Font-Size="Large" Text="Registrar Asistencias"></asp:Label>
                    </td>
                    <td class="auto-style7">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblFiltrarPorDia" runat="server" Text="Filtrar por día:"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtFechaDeTurnos" runat="server" TextMode="Date"></asp:TextBox>
                    </td>
                    <td class="auto-style7">
                        <asp:Button ID="btnFiltrarPorFecha" runat="server" Text="Filtrar por fecha" OnClick="btnFiltrarPorFecha_Click" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:Label ID="lblBuscarPorDNI" runat="server" Text="Buscar por DNI:"></asp:Label>
                    </td>
                    <td class="auto-style5">
                        <asp:TextBox ID="txtDNI" runat="server" MaxLength="9"></asp:TextBox>
                    </td>
                    <td class="auto-style8">
                        <asp:Button ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click" />
                    </td>
                    <td class="auto-style6">
                        <asp:Label ID="lblError" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">
                        <asp:GridView ID="gvListadoAsistencia" runat="server" AutoGenerateColumns="False" AutoGenerateEditButton="True" OnRowEditing="gvListadoAsistencia_RowEditing" OnRowCancelingEdit="gvListadoAsistencia_RowCancelingEdit" OnRowUpdating="gvListadoAsistencia_RowUpdating" AllowPaging="True" OnPageIndexChanging="gvListadoAsistencia_PageIndexChanging" PageSize="4" OnRowDataBound="gvListadoAsistencia_RowDataBound">
                            <Columns>
                                <asp:TemplateField HeaderText="ID Turno">
                                    <EditItemTemplate>
                                        <asp:Label ID="lblIDTurno" runat="server" Text='<%# Bind("Id_Turno") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblID" runat="server" Text='<%# Bind("Id_Turno") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="DNI Paciente">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDNIPaciente" runat="server" Text='<%# Bind("Dni_Paciente_T") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Fecha">
                                    <ItemTemplate>
                                        <asp:Label ID="lblFecha" runat="server" Text='<%# Bind("Fecha_T") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Horario">
                                    <ItemTemplate>
                                        <asp:Label ID="lblHorario" runat="server" Text='<%# Bind("Hora_T") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Asistencia">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="ddlAsistencia" runat="server" AutoPostBack="True" SelectedValue='<%# Bind("Asistencia_T") %>'>
                                            <asp:ListItem>Asistio             </asp:ListItem>
                                            <asp:ListItem>A confirmar         </asp:ListItem>
                                            <asp:ListItem>No asistio          </asp:ListItem>
                                        </asp:DropDownList>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblAsistencia" runat="server" Text='<%# Bind("Asistencia_T") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Observaciones">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtObservaciones" runat="server" MaxLength="1000" Text='<%# Bind("Observaciones") %>' TextMode="MultiLine"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblObservaciones" runat="server" Text='<%# Bind("Observaciones") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </td>
                    <td class="auto-style7">
                        <asp:Button ID="btnMostrarTodos" runat="server" Text="Mostrar todos" OnClick="btnMostrarTodos_Click" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:HyperLink ID="hlMenuAnterior" runat="server" NavigateUrl="~/MenuMedico.aspx">Volver al menú anterior</asp:HyperLink>
                    </td>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>

