using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPINT_GRUPO_2_PR3
{
    public partial class MenuAdministrador : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["EsAdmin"] == null || (bool)Session["EsAdmin"] == false)
            {
                Session.Add("Error", "No tiene los permisos necesarios para acceder a esta página.");
                Response.Redirect("Error.aspx");
            }
            if(!IsPostBack)
            {
                lblAdmin.Text = "Administrador: " + ((Administrador)Session["admin"]).getNombre() + " " + ((Administrador)Session["admin"]).getApellido();
            }
        }

        protected void ddlOpcPacientes_SelectedIndexChanged(object sender, EventArgs e)
        {
            string redir = "";
            switch (ddlOpcPacientes.SelectedValue)
            {
                case "Alta":
                    redir = "AgregarPacientes.aspx";
                    break;
                case "Modificar":
                    redir = "ModificarPacientes.aspx";
                    break;
                case "Baja":
                    redir = "DarBajaPacientes.aspx";
                    break;
                case "Listado":
                    redir = "ListadoPaciente.aspx";
                    break;
                case "Reactivar":
                    redir = "ReactivarPaciente.aspx";
                    break;
                default:
                    break;
            }

            if (redir.Length != 0)
            {
                Response.Redirect(redir);
            }
        }

        protected void ddlOpcMedicos_SelectedIndexChanged(object sender, EventArgs e)
        {
            string redir = "";
            switch (ddlOpcMedicos.SelectedValue)
            {
                case "Alta":
                    redir = "AgregarMedicos.aspx";
                    break;
                case "Modificar":
                    redir = "ModificarMedicos.aspx";
                    break;
                case "Baja":
                    redir = "DarBajaMedicos.aspx";
                    break;
                case "Listado":
                    redir = "ListadoMedico.aspx";
                    break;
                default:
                    break;
            }

            if (redir.Length != 0)
            {
                Response.Redirect(redir);
            }
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }
    }
}