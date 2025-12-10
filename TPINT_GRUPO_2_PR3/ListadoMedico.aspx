<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListadoMedico.aspx.cs" Inherits="TPINT_GRUPO_2_PR3.ListadoMedico" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link rel="stylesheet" href="StyleSheet.css" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="Contenedor" width="1485px">
            <div class="Fila">
                <div class="Columna20">
                    <asp:Label ID="lblNombreAdministrador" runat="server" CssClass="LabelUsuario">Nombre del Administrador</asp:Label>
                </div>
                <div class="Columna40"></div>
                <div class="Columna40-Hyperlink">
                    <asp:HyperLink ID="HyperLinkPaciente" runat="server" NavigateUrl="~/MenuAdministrador.aspx" CssClass="HyperLink">Volver al Menú</asp:HyperLink>
                </div>
            </div>
            <div>
                <asp:Label ID="lblListaDeMedicos" runat="server" Text="Lista de Médicos" CssClass="Titulo"></asp:Label>
            </div>
            <div>
                <asp:Label ID="lblInstrucciones" runat="server" Text="Deje vacío los campos que no necesita para filtrar." CssClass="Label"></asp:Label>
            </div>
            <div class="Fila">
                <div class="Columna12">
                    <asp:Label ID="lblBuscarLegajo" runat="server" Text="Buscar por Legajo:" CssClass="Label"></asp:Label>
                </div>
                <div class="Columna88">
                    <asp:TextBox ID="txtLegajo" runat="server" MaxLength="5" ValidationGroup="group1" CssClass="TextBoxFecha"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="revLegajo" runat="server" ErrorMessage="Ingrese un legajo válido, por ejemplo 'M0001'" ControlToValidate="txtLegajo" ValidationExpression="^M[0-9]{4}$" ValidationGroup="group1" CssClass="msg-error"></asp:RegularExpressionValidator>
                </div>
            </div>
            <div class="Fila">
                <div class="Columna12">
                    <asp:Label ID="lblBuscarNombre" runat="server" Text="Buscar por Nombre:" CssClass="Label"></asp:Label>
                </div>
                <div class="Columna88">
                    <asp:TextBox ID="txtNombre" runat="server" MaxLength="40" CssClass="TextBox"></asp:TextBox>
                </div>
            </div>
            <div class="Fila">
                <div class="Columna12">
                    <asp:Label ID="lblBuscarApellido" runat="server" Text="Buscar por Apellido:" CssClass="Label"></asp:Label>
                </div>
                <div class="Columna88">
                    <asp:TextBox ID="txtApellido" runat="server" MaxLength="40" CssClass="TextBox"></asp:TextBox>
                </div>
            </div>
            <div class="Fila">
                <div class="Columna12">
                    <asp:Label ID="lblBuscarDias" runat="server" Text="Buscar por días laborales:" CssClass="Label"></asp:Label>
                </div>
                <div class="Columna88">
                    <asp:RadioButtonList ID="rblDiasLaborales" runat="server" AutoPostBack="True" Width="194px" CssClass="RadioButtonList" RepeatColumns="2">
                        <asp:ListItem Value="0" Selected="True">No filtrar</asp:ListItem>
                        <asp:ListItem Value="1">Lunes</asp:ListItem>
                        <asp:ListItem Value="2">Martes</asp:ListItem>
                        <asp:ListItem Value="3">Miercoles</asp:ListItem>
                        <asp:ListItem Value="4">Jueves</asp:ListItem>
                        <asp:ListItem Value="5">Viernes</asp:ListItem>
                        <asp:ListItem Value="6">Sabado</asp:ListItem>
                        <asp:ListItem Value="7">Domingo</asp:ListItem>
                    </asp:RadioButtonList>
                </div>
            </div>
            <div class="Fila">
                <div class="Columna12">
                    <asp:Label ID="lblBuscarEspecialidad" runat="server" Text="Buscar por Especialidad:" CssClass="Label"></asp:Label>
                </div>
                <div class="Columna44">
                    <asp:DropDownList ID="ddlEspecialidad" runat="server" AutoPostBack="True" AppendDataBoundItems="True" CssClass="DropDownList">
                        <asp:ListItem Value="0" Selected="True">No filtrar</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="Columna44">
                    <asp:Button ID="btnFiltrar" runat="server" Text="Filtrar" OnClick="btnFiltrar_Click" ValidationGroup="group1" CssClass="Boton" />
                    <asp:Button ID="btnMostrarTodosMedicos" runat="server" Text="Listar todos los medicos" OnClick="btnMostrarTodosMedicos_Click" CssClass="Boton" />
                </div>
            </div>
            <div>
                <asp:GridView ID="gvListaMedicos" runat="server" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" PageSize="2" CssClass="GridView">
                    <AlternatingRowStyle BackColor="Gainsboro" />
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#0000A9" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#000065" />
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
