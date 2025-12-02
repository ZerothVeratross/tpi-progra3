<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MenuMedico.aspx.cs" Inherits="TPINT_GRUPO_2_PR3.MenuMedico" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Menú Médico</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="CentrarContenido">
            <div class="Contenedor">

                <asp:Label ID="lblUsuario" runat="server" Text="Nombre del Médico" CssClass="LabelUsuario"></asp:Label>
                <div>
                    <asp:Label ID="lblMenuMedico" runat="server" Font-Bold="True" Text="Menú Médico" CssClass="Titulo"></asp:Label>
                </div>
                <div>
                    <br />
                    <asp:HyperLink ID="hlTurnosAsignados" runat="server" NavigateUrl="~/TurnosAsignados.aspx" CssClass="HyperLink">Ver turnos asignados</asp:HyperLink>
                </div>
                <div>
                    <br />
                    <asp:HyperLink ID="hlRegistrarAsistencias" runat="server" NavigateUrl="~/RegistrarAsistencias.aspx" CssClass="HyperLink">Registrar asistencias</asp:HyperLink>
                </div>
                <div>
                    <br />
                    <asp:LinkButton ID="btnCerrarSession" Text="text" runat="server" OnClick="btnCerrarSession_Click" CssClass="LinkButton">Cerrar Sesión</asp:LinkButton>
                </div>
            </div>
      </div>

    </form>
</body>
</html>
