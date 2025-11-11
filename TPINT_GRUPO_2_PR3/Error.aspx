<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="TPINT_GRUPO_2_PR3.Error" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <h2 style="color:red;">No tiene los permisos necesarios para acceder a esta página.</h2>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HyperLink ID="hlVolverMenuMedicos" runat="server" NavigateUrl="~/MenuMedico.aspx">Volver al menu</asp:HyperLink>
        </div>
    </form>
</body>
</html>
