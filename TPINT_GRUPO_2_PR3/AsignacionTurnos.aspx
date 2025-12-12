<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AsignacionTurnos.aspx.cs" Inherits="TPINT_GRUPO_2_PR3.AsignacionTurnos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Asinación de turnos</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="Contenedor">
            <div class="Fila">
                <div>
                    <asp:Label ID="lblAdmin" runat="server" Text="Nombre del Administrador" CssClass="LabelUsuario"></asp:Label>
                </div>
                <div class="Columna40-Hyperlink">
                    <asp:HyperLink ID="hlVolverMenu" runat="server" NavigateUrl="~/MenuAdministrador.aspx" CssClass="HyperLink">Volver al Menú</asp:HyperLink>
                </div>
            </div>
            <div class="contenedor-flex">
                <div class="columna-izquierda">
                    <div>
                        <asp:Label ID="lblAsignarTurno" runat="server" Text="Asignar Turno" CssClass="Titulo"></asp:Label>
                    </div>
                    <div>
                        <asp:Label ID="lblDniPaciente" runat="server" Text="Ingrese el DNI del paciente:" CssClass="Label"></asp:Label>
                        <asp:TextBox ID="txtDni" runat="server" MaxLength="9" CssClass="TextBox"></asp:TextBox>
                        <asp:Label ID="lblValidacionDni" runat="server" ForeColor="#FF3300" CssClass="msg-error"></asp:Label>
                    </div>
                    <div>
                        <asp:Label ID="lblEspecialidad" runat="server" Text="Ingrese la especialidad:" CssClass="Label"></asp:Label>
                        <asp:DropDownList ID="ddlEspecialidad" runat="server" OnSelectedIndexChanged="ddlEspecialidad_SelectedIndexChanged" CssClass="DropDownList">
                            <asp:ListItem Selected="True" Value="0">--Seleccione Especialidad--</asp:ListItem>
                        </asp:DropDownList>
                        <asp:Label ID="lblValidacionEspecialidad" runat="server" ForeColor="#FF3300" CssClass="msg-error"></asp:Label>
                    </div>
                    <div>
                        <asp:Label ID="lblCalendarioDia" runat="server" Text="Seleccione el día:" CssClass="Label"></asp:Label>
                        <asp:Calendar ID="CalendarFecha" runat="server" OnSelectionChanged="CalendarFecha_SelectionChanged" CssClass="Calendario"></asp:Calendar>
                        <asp:Label ID="lblValidacionFecha" runat="server" ForeColor="#FF3300" CssClass="msg-error"></asp:Label>
                    </div>
                    <br />
                    <div>
                        <asp:Label ID="lblHorario" runat="server" Text="Seleccione el horario:" CssClass="Label"></asp:Label>
                        <asp:DropDownList ID="ddlHorarios" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlHorarios_SelectedIndexChanged" CssClass="DropDownList">
                            <asp:ListItem Selected="True" Value="0">--Seleccione Horario--</asp:ListItem>
                            <asp:ListItem>06:00</asp:ListItem>
                            <asp:ListItem>07:00</asp:ListItem>
                            <asp:ListItem>08:00</asp:ListItem>
                            <asp:ListItem>09:00</asp:ListItem>
                            <asp:ListItem>10:00</asp:ListItem>
                            <asp:ListItem>11:00</asp:ListItem>
                            <asp:ListItem>12:00</asp:ListItem>
                            <asp:ListItem>13:00</asp:ListItem>
                            <asp:ListItem>14:00</asp:ListItem>
                            <asp:ListItem>16:00</asp:ListItem>
                            <asp:ListItem>17:00</asp:ListItem>
                            <asp:ListItem>18:00</asp:ListItem>
                        </asp:DropDownList>
                        <asp:Label ID="lblValidacionHorario" runat="server" ForeColor="#FF3300" CssClass="msg-error"></asp:Label>
                    </div>

                    <div>
                        <asp:Label ID="lblMedico" runat="server" Text="Seleccione al medico:" CssClass="Label"></asp:Label>
                        <asp:DropDownList ID="ddlMedico" runat="server" EnableViewState="true" CssClass="DropDownList">
                            <asp:ListItem Selected="True" Value="0">--Seleccione Medico--</asp:ListItem>
                        </asp:DropDownList>
                        <asp:Label ID="lblValidacionMedico" runat="server" ForeColor="#FF3300" CssClass="msg-error"></asp:Label>
                    </div>
                    <div>
                        <asp:Label ID="lblMensaje" runat="server" CssClass="msg-exito"></asp:Label>
                        <asp:Button ID="btnRegistrarTurno" runat="server" Text="Registrar Turno" OnClick="btnRegistrarTurno_Click" CssClass="Boton" />
                    </div>
                </div>
                <div class="columna-derecha">
                    <strong>
                        <asp:Label ID="lblListaMedicos" runat="server" CssClass="Titulo">Horarios y Médicos disponibles</asp:Label>
                    </strong>
                    <asp:GridView ID="gvListadoMedico" runat="server" CssClass="GridViewLateral" AllowPaging="True" PageSize="10" OnPageIndexChanging="gvListadoMedico_PageIndexChanging">
                    </asp:GridView>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
