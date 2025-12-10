<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="TPINT_GRUPO_2_PR3.Error" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
    <title>Error</title>

</head>
<body>
    <form id="form1" runat="server">
        <div class="Contenedor">
            <h2 style="color: red;">Error.</h2>
            <br />
            <div>
                <asp:Label ID="lblError" runat="server" Text="" CssClass="msg-error"></asp:Label>
            </div>
            <br />
            <div>
                <asp:HyperLink ID="hlVolver" runat="server" NavigateUrl="~/Login.aspx" CssClass="HyperLink">Volver</asp:HyperLink>
            </div>
        </div>

    </form>
</body>
</html>
