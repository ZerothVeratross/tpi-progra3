<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReactivarMedico.aspx.cs" Inherits="TPINT_GRUPO_2_PR3.ReactivarMedico" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Reactivar Médico</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="CentrarContenido">
            <div class="Contenedor">
                <asp:Label ID="lblAdministrador" CssClass="LabelUsuario" runat="server"></asp:Label>
                <div>
                    <asp:Label ID="lblTitulo" runat="server" CssClass="Titulo" Text="Reactivar Medico"></asp:Label>
                </div>
                <br />

                <asp:Label ID="lblBusqueda" runat="server" CssClass="Label" Text="Buscar por Legajo, Dni, Nombre o Apellido"></asp:Label>

                <asp:TextBox ID="txtBuscar" CssClass="TextBox" runat="server"></asp:TextBox>

                <asp:Button ID="btnBuscar" CssClass="Boton" runat="server" Text="Buscar" OnClick="btnBuscar_Click" />


                <asp:Button ID="btnMostrarMedicos" CssClass="Boton" runat="server" Text="Mostrar todos los medicos" OnClick="btnMostrarMedicos_Click" />

                <asp:GridView ID="gvMedicos" runat="server" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None" OnPageIndexChanging="gvMedicos_PageIndexChanging" OnRowCommand="gvMedicos_RowCommand" CssClass="GridViewBtnField" PageSize="5" AutoGenerateColumns="False">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:ButtonField ButtonType="Button" CommandName="eventoSeleccionar" Text="Seleccionar" ControlStyle-CssClass="Boton-ButtonField" />
                        <asp:TemplateField HeaderText="Legajo">
                            <ItemTemplate>
                                <asp:Label ID="lbl_it_Legajo" CssClass="Label" runat="server" Text='<%# Bind("Legajo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="DNI">
                            <ItemTemplate>
                                <asp:Label ID="lbl_it_Dni" CssClass="Label" runat="server" Text='<%# Bind("DNI") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Nombre">
                            <ItemTemplate>
                                <asp:Label ID="lbl_it_Nombre" CssClass="Label" runat="server" Text='<%# Bind("Nombre") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Apellido">
                            <ItemTemplate>
                                <asp:Label ID="lbl_it_Apellido" CssClass="Label" runat="server" Text='<%# Bind("Apellido") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Sexo">
                            <ItemTemplate>
                                <asp:Label ID="lbl_it_Sexo" CssClass="Label" runat="server" Text='<%# Bind("Sexo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Nacionalidad">
                            <ItemTemplate>
                                <asp:Label ID="lbl_it_Nacionalidad" CssClass="Label" runat="server" Text='<%# Bind("Nacionalidad") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Fecha de Nacimiento">
                            <ItemTemplate>
                                <asp:Label ID="lbl_it_FechaNac" CssClass="Label" runat="server" Text='<%# Bind("Nacimiento") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Direccion">
                            <ItemTemplate>
                                <asp:Label ID="lbl_it_Direccion" CssClass="Label" runat="server" Text='<%# Bind("Direccion") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Provincia">
                            <ItemTemplate>
                                <asp:Label ID="lbl_it_Provincia" CssClass="Label" runat="server" Text='<%# Bind("Provincia") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Localidad">
                            <ItemTemplate>
                                <asp:Label ID="lbl_it_Localidad" CssClass="Label" runat="server" Text='<%# Bind("Localidad") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Correo Electronico">
                            <ItemTemplate>
                                <asp:Label ID="lbl_it_CorreoElec" CssClass="Label" runat="server" Text='<%# Bind("Correo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Telefono">
                            <ItemTemplate>
                                <asp:Label ID="lbl_it_Telefono" CssClass="Label" runat="server" Text='<%# Bind("Telefono") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Especialidad">
                            <ItemTemplate>
                                <asp:Label ID="lbl_it_Especialidad" CssClass="Label" runat="server" Text='<%# Bind("Especialidad") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <SortedAscendingCellStyle BackColor="#FDF5AC" />
                    <SortedAscendingHeaderStyle BackColor="#4D0000" />
                    <SortedDescendingCellStyle BackColor="#FCF6C0" />
                    <SortedDescendingHeaderStyle BackColor="#820000" />
                </asp:GridView>
                <div>
                    <br />
                    <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" CssClass="Boton-danger" Visible="False" />
                    <asp:Button ID="btnConfirmar" runat="server" Text="Confirmar" OnClick="btnConfirmar_Click" CssClass="Boton" Visible="False" />
                </div>
                <div>
                    <br />
                    <asp:Label ID="lblMensaje" CssClass="msg-exito" runat="server"></asp:Label>
                </div>
                <br />
                <asp:HyperLink ID="hlMenu" runat="server" CssClass="HyperLink" NavigateUrl="~/MenuAdministrador.aspx">Volver al Menú</asp:HyperLink>
            </div>
        </div>
    </form>
</body>
</html>
