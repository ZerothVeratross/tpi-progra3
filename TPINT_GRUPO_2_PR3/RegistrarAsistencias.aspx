<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrarAsistencias.aspx.cs" Inherits="TPINT_GRUPO_2_PR3.RegistrarAsistencias" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
    <title>Registrar asistencias</title>
    <style type="text/css">
        /* pequeñas utilidades inline-friendly para mantener consistencia */
        .fs-line-height { line-height: 33px; } /* usa cuando quieras alinear con inputs de 33px */
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div class="Contenedor" style="max-width: 900px;">

            <!-- Usuario arriba (como en tu ejemplo) -->
            <asp:Label ID="lblUsuario" runat="server" Text="Nombre del Médico" CssClass="LabelUsuario"></asp:Label>

            <!-- Título -->
            <div style="clear: both; margin-bottom: 12px;">
                <asp:Label ID="lblRegistrarAsistencias" runat="server" Text="Registrar Asistencias" CssClass="Titulo"></asp:Label>
            </div>

            <!-- FILA 1: Filtrar por día -->
            <div class="Fila" style="overflow: hidden; margin-bottom: 12px;">

                <!-- columna ancho auto-style2 (269px) -->
                <div style="float: left; width: 269px; margin-right: 16px;">
                    <asp:Label ID="lblFiltrarPorDia" runat="server" Text="Filtrar por día:" CssClass="Label" 
                               Style="display:block; margin-bottom:6px; line-height:1;"></asp:Label>
                </div>

                <!-- columna ancho auto-style3 (298px) -->
                <div style="float: left; width: 298px; margin-right: 16px;">
                    <asp:TextBox ID="txtFechaDeTurnos" runat="server" TextMode="Date" CssClass="TextBox"
                                 Style="width:298px; height:33px;"></asp:TextBox>
                </div>

                <!-- columna ancho auto-style7 (110px) -->
                <div style="float: left; width: 110px;">
                    <asp:Button ID="btnFiltrarPorFecha" runat="server" Text="Fecha" 
                                OnClick="btnFiltrarPorFecha_Click"
                                CssClass="Boton"
                                Style="width:110px; height:33px; padding:6px 8px;"></asp:Button>
                </div>

            </div>

            <!-- FILA 2: Buscar por DNI -->
            <div class="Fila" style="overflow: hidden; margin-bottom: 12px;">

                <!-- columna auto-style4 (269px; height:33px) -->
                <div style="float: left; width: 269px; margin-right: 16px;">
                    <asp:Label ID="lblBuscarPorDNI" runat="server" Text="Buscar por DNI:" CssClass="Label"
                               Style="display:block; margin-bottom:6px; line-height:1;"></asp:Label>
                </div>

                <!-- columna auto-style5 (298px; height:33px) -->
                <div style="float: left; width: 298px; margin-right: 16px;">
                    <asp:TextBox ID="txtDNI" runat="server" MaxLength="9" CssClass="TextBox"
                                 Style="width:298px; height:33px;"></asp:TextBox>
                </div>

                <!-- columna auto-style8 (110px x 33px) -->
                <div style="float: left; width: 110px; margin-right: 12px;">
                    <asp:Button ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click"
                                CssClass="Boton"
                                Style="width:110px; height:33px; padding:6px 8px;"></asp:Button>
                </div>

                <!-- label de error -->
                <div style="float: left; height:33px; margin-left:6px;">
                    <asp:Label ID="lblError" runat="server" CssClass="Label" Style="line-height:33px; color: #8e2a2a;"></asp:Label>
                </div>

            </div>

            <!-- BOTÓN MOSTRAR TODOS (ahora arriba del GridView) -->
            <div style="overflow: hidden; margin-top: 8px; margin-bottom: 12px;">
                <div style="float: left; width: 110px;">
                    <asp:Button ID="btnMostrarTodos" runat="server" Text="Mostrar todos" OnClick="btnMostrarTodos_Click"
                                CssClass="Boton" Style="width:110px; height:33px; padding:6px 8px;"></asp:Button>
                </div>
            </div>

            <!-- GRIDVIEW -->
            <div class="Fila" style="overflow: hidden; margin-top: 6px;">
                <div style="float: left; width: 100%;">

                    <asp:GridView ID="gvListadoAsistencia" runat="server"
                                  AutoGenerateColumns="False"
                                  AutoGenerateEditButton="True"
                                  OnRowEditing="gvListadoAsistencia_RowEditing"
                                  OnRowCancelingEdit="gvListadoAsistencia_RowCancelingEdit"
                                  OnRowUpdating="gvListadoAsistencia_RowUpdating"
                                  AllowPaging="True"
                                  PageSize="4"
                                  OnPageIndexChanging="gvListadoAsistencia_PageIndexChanging"
                                  OnRowDataBound="gvListadoAsistencia_RowDataBound"
                                  CssClass="GridView"
                                  Style="width:100%;">

                        <Columns>

                            <asp:TemplateField HeaderText="ID Turno">
                                <EditItemTemplate>
                                    <!-- mantuve Label en EditItemTemplate tal como tenías -->
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
                                    <!-- respeté los espacios EXACTOS en los ListItem -->
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

            <!-- VOLVER AL MENÚ -->
            <div style="clear: both; margin-top: 18px;">
                <asp:HyperLink ID="hlMenuAnterior" runat="server" NavigateUrl="~/MenuMedico.aspx" CssClass="HyperLink">
                    Volver al menú anterior
                </asp:HyperLink>
            </div>

        </div>
    </form>
</body>
</html>