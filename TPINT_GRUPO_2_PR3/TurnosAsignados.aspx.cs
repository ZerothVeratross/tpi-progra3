using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPINT_GRUPO_2_PR3
{
    public partial class TurnosAsignados : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["medico"] == null || Session["admin"] != null)
            {
                Session.Add("Error", "No tiene los permisos necesarios para acceder a esta página.");
                Response.Redirect("Error.aspx");
            }
            if (!IsPostBack)
            {
                lblUsuario.Text = "Medico: " + ((Medico)Session["medico"]).getNombre() + " " + ((Medico)Session["medico"]).getApellido();
            }
        }
    }
}