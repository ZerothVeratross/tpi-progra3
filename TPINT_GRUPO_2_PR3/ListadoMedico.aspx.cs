using Negocios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPINT_GRUPO_2_PR3
{
    public partial class ListadoMedico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["EsAdmin"] == null || (bool)Session["EsAdmin"] == false)
            {
                Session.Add("Error", "No tiene los permisos necesarios para acceder a esta página.");
                Response.Redirect("Error.aspx");
            }

            if (!IsPostBack)
            {
                MedicoNegocio negocioM = new MedicoNegocio();
                gvListaMedicos.DataSource = negocioM.ListarMedicos("", "", "", "", "");
                gvListaMedicos.DataBind();

                EspecialidadNegocio negocioE = new EspecialidadNegocio();
                ddlEspecialidad.DataSource = negocioE.getTablaEspecialidades();
                ddlEspecialidad.DataTextField = "Descripcion_E";
                ddlEspecialidad.DataValueField = "Descripcion_E";
                ddlEspecialidad.DataBind();
            }
        }

        protected void btnMostrarTodosMedicos_Click(object sender, EventArgs e)
        {
            MedicoNegocio negocio = new MedicoNegocio();
            gvListaMedicos.DataSource = negocio.ListarMedicos("", "", "", "", "");
            gvListaMedicos.DataBind();

            txtApellido.Text = string.Empty;
            txtLegajo.Text = string.Empty;
            txtNombre.Text = string.Empty;
            ddlEspecialidad.SelectedIndex = 0;
            rblDiasLaborales.SelectedIndex = -1;
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            MedicoNegocio negocio = new MedicoNegocio();
            string especialidad = "";
            string dia = "";
            if (rblDiasLaborales.SelectedValue != "0")
            {
                dia = rblDiasLaborales.SelectedValue;
            }
            if (ddlEspecialidad.SelectedValue != "0")
            {
                especialidad = ddlEspecialidad.SelectedValue;
            }

            gvListaMedicos.DataSource = negocio.ListarMedicos(txtLegajo.Text, txtNombre.Text, txtApellido.Text,
                dia, especialidad);
            gvListaMedicos.DataBind();

            txtApellido.Text = string.Empty;
            txtLegajo.Text = string.Empty;
            txtNombre.Text = string.Empty;
            ddlEspecialidad.SelectedIndex = 0;
            rblDiasLaborales.SelectedIndex = -1;
        }
    }
}