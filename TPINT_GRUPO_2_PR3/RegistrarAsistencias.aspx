<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrarAsistencias.aspx.cs" Inherits="TPINT_GRUPO_2_PR3.RegistrarAsistencias" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
    <title>Registrar asistencias</title>
</head>

<body>
    <form id="form1" runat="server">
        <div class="CentrarContenido">
            <div class="Contenedor">
                <asp:Label ID="lblUsuario" runat="server" Text="Nombre del Médico" CssClass="LabelUsuario"></asp:Label>
                <div>
                    <asp:Label ID="lblRegistrarAsistencias" runat="server" Text="Registrar Asistencias" CssClass="Titulo"></asp:Label>
                </div>
                <br />
                <div>
                    <div>
                        <asp:Label ID="lblFiltrarPorDia" runat="server" Text="Filtrar por día:" CssClass="Label"></asp:Label>
                        <asp:TextBox ID="txtFechaDeTurnos" runat="server" TextMode="Date" CssClass="TextBoxFecha"></asp:TextBox>
                        <asp:Button ID="btnFiltrarPorFecha" runat="server" Text="Fecha" OnClick="btnFiltrarPorFecha_Click" CssClass="Boton"></asp:Button>
                    </div>
                </div>

                <div>
                    <div>
                        <asp:Label ID="lblBuscarPorDNI" runat="server" Text="Buscar por DNI:" CssClass="Label"></asp:Label>
                        <asp:TextBox ID="txtDNI" runat="server" MaxLength="9" CssClass="TextBox"></asp:TextBox>
                        <asp:Button ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click" CssClass="Boton"></asp:Button>
                    </div>
                    <div style="float: left; height: 33px; margin-left: 6px;">
                        <asp:Label ID="lblError" runat="server" CssClass="Label" Style="line-height: 33px; color: #8e2a2a;"></asp:Label>
                    </div>

                </div>
                <div>
                    <asp:Button ID="btnMostrarTodos" runat="server" Text="Mostrar todos" OnClick="btnMostrarTodos_Click" CssClass="Boton"></asp:Button>
                </div>
                <div>
                    <div>
                        <asp:GridView ID="gvListadoAsistencia" runat="server" AutoGenerateColumns="False" AutoGenerateEditButton="True" OnRowEditing="gvListadoAsistencia_RowEditing" OnRowCancelingEdit="gvListadoAsistencia_RowCancelingEdit" OnRowUpdating="gvListadoAsistencia_RowUpdating" AllowPaging="True"
                            PageSize="4" OnPageIndexChanging="gvListadoAsistencia_PageIndexChanging" OnRowDataBound="gvListadoAsistencia_RowDataBound" CssClass="GridView">
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
                    </div>
                </div>
                <br />
                <div>
                    <asp:HyperLink ID="hlMenuAnterior" runat="server" NavigateUrl="~/MenuMedico.aspx" CssClass="HyperLink"> Volver al menú</asp:HyperLink>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
