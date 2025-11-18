<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InformesYReportes.aspx.cs" Inherits="TPINT_GRUPO_2_PR3.InformesYReportes" %>

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
            height: 26px;
        }

        .auto-style3 {
            width: 718px;
        }

        .auto-style4 {
            height: 26px;
            width: 718px;
        }

        .auto-style5 {
            width: 361px;
        }

        .auto-style6 {
            height: 26px;
            width: 361px;
        }

        .auto-style7 {
            width: 718px;
            height: 92px;
        }

        .auto-style8 {
            width: 361px;
            height: 92px;
        }

        .auto-style9 {
            height: 92px;
        }

        .auto-style10 {
            width: 718px;
            height: 29px;
        }

        .auto-style11 {
            width: 361px;
            height: 29px;
        }

        .auto-style12 {
            height: 29px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="lblNombreAdministrador" runat="server">Nombre del Administrador</asp:Label>
                    </td>
                    <td class="auto-style5">&nbsp;</td>
                    <td>
                        <asp:HyperLink ID="HyperLinkPaciente" runat="server" NavigateUrl="~/MenuAdministrador.aspx">Volver al Menú</asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="lblInformesGenerales" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Informes Generales"></asp:Label>
                    </td>
                    <td class="auto-style5">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4"></td>
                    <td class="auto-style6"></td>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="lblAsistenciaTurnos" runat="server" Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Underline="False" Text="Asistencia general de turnos"></asp:Label>
                    </td>
                    <td class="auto-style5">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style7">
                        <asp:Label ID="lblAsistenciaTurnosEnunciado" runat="server" Text="Desde enero 2024 hasta noviembre 2024 el total de presentes y ausentes, en porcentaje:"></asp:Label>
                        <br />
                        <br />
                        <asp:Label ID="PorcentajePresentes" runat="server"></asp:Label>
                        <br />
                        <asp:Label ID="PorcentajeAusentes" runat="server"></asp:Label>
                    </td>
                    <td class="auto-style8">
                        <asp:Button ID="btnPresentes" runat="server" Text="Ver Presentes" />
                        &nbsp;
                        <asp:Button ID="btnAusentes" runat="server" Text="Ver Ausentes" />
                    </td>
                    <td class="auto-style9"></td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:GridView ID="gvAsistencia" runat="server">
                        </asp:GridView>
                        &nbsp;</td>
                    <td class="auto-style5">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style5">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="lblEspecialidadesRequeridas" runat="server" Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Underline="False" Text="Especialidades más requeridas"></asp:Label>
                    </td>
                    <td class="auto-style5">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="lblEspecialidadesRequeridasEnunciado" runat="server" Text="Desde enero 2025 hasta julio 2025, en porcentaje:"></asp:Label>
                    </td>
                    <td class="auto-style5">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:GridView ID="gvEspecialidadesRequeridas" runat="server">
                        </asp:GridView>
                    </td>
                    <td class="auto-style5">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style5">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="lblReportesConParametros" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Reportes"></asp:Label>
                    </td>
                    <td class="auto-style5">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style5">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="lblCantidadTurnoxMedico" runat="server" Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Underline="False" Text="Cantidad de turnos por médicos"></asp:Label>
                    </td>
                    <td class="auto-style5">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="lblEspecialidadesRequeridasEnunciado0" runat="server" Text="Seleccione el médico y el rango de fechas:"></asp:Label>
                    </td>
                    <td class="auto-style5">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style10">
                        <asp:Label ID="lblDesde" runat="server" Text="Desde:"></asp:Label>
                        &nbsp;<asp:TextBox ID="txtFechaDesdeMedico" runat="server"></asp:TextBox>
                        &nbsp;
                        <asp:Label ID="lblHasta" runat="server" Text="Hasta:"></asp:Label>
                        &nbsp;<asp:TextBox ID="txtFechaHastaMedico" runat="server"></asp:TextBox>
                        &nbsp;
                        <asp:DropDownList ID="ddlMedico" runat="server" AutoPostBack="True">
                            <asp:ListItem Value="0">--Seleccione Médico--</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style11">
                        <asp:Button ID="btnBuscarTurnosxMedico" runat="server" Text="Buscar Turnos" />
                    </td>
                    <td class="auto-style12"></td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:GridView ID="gvTurnosMedico" runat="server">
                        </asp:GridView>
                    </td>
                    <td class="auto-style5">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style5">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="lblAsistenciaEspecialidad" runat="server" Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Underline="False" Text="Asistencia por especialidad"></asp:Label>
                    </td>
                    <td class="auto-style5">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="lblEspecialidadesRequeridasEnunciado1" runat="server" Text="Seleccione especialidad y el rango de fechas:"></asp:Label>
                    </td>
                    <td class="auto-style5">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="lblDesde0" runat="server" Text="Desde:"></asp:Label>
                        &nbsp;<asp:TextBox ID="txtFechaDesdeEsp" runat="server"></asp:TextBox>
                        &nbsp;
                        <asp:Label ID="lblHasta0" runat="server" Text="Hasta:"></asp:Label>
                        &nbsp;<asp:TextBox ID="txtFechaHastaEsp" runat="server"></asp:TextBox>
                        &nbsp;
                        <asp:DropDownList ID="ddlEspecialidad" runat="server" AutoPostBack="True">
                            <asp:ListItem Value="0">--Seleccione Especialidad--</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style5">
                        <asp:Button ID="btnBuscarAsistencia" runat="server" Text="Buscar" />
                        &nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <br />
                        <asp:Label ID="PorcentajeAsistencia" runat="server"></asp:Label>
                    </td>
                    <td class="auto-style5">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:GridView ID="gvTurnosAsistidos" runat="server">
                        </asp:GridView>
                    </td>
                    <td class="auto-style5">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
