using Negocios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPINT_GRUPO_2_PR3
{
    public partial class ReactivarMedico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //if (Session["EsAdmin"] == null || (bool)Session["EsAdmin"] == false)
            //{
            //    Session.Add("Error", "No tiene los permisos necesarios para acceder a esta página.");
            //    Response.Redirect("Error.aspx");
            //}
            if (!IsPostBack)
            {
                //lblAdministrador.Text = "Administrador: " + ((Administrador)Session["admin"]).getNombre() + " " + ((Administrador)Session["admin"]).getApellido();
                try
                {
                    CargarMedicosInactivos();
                }
                catch (Exception ex)
                {
                    Session.Add("error", ex.ToString());
                    Response.Redirect("Error.aspx");
                }
            }
        }

        private void CargarMedicosInactivos()
        {
            try
            {
                Session["Buscar"] = null;
                MedicoNegocio medicoNegocio = new MedicoNegocio();
                gvMedicos.DataSource = medicoNegocio.TablaMedicosInactivos();
                gvMedicos.DataBind();
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }

        protected void btnMostrarMedicos_Click(object sender, EventArgs e)
        {
            OcultarBotones();
            CargarMedicosInactivos();
            limpiarTxt();
        }

        protected void limpiarTodo()
        {
            txtBuscar.Text = string.Empty;
            lblMensaje.Text = string.Empty;
        }

        protected void limpiarTxt()
        {
            txtBuscar.Text = string.Empty;
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                OcultarBotones();
                MedicoNegocio medicoNegocio = new MedicoNegocio();
                string text = txtBuscar.Text.Trim();
                Session["Buscar"] = medicoNegocio.TablaMedicosInactivosBuscar(text);
                gvMedicos.DataSource = Session["Buscar"];
                gvMedicos.DataBind();
                limpiarTodo();
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }

        protected void gvMedicos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvMedicos.PageIndex = e.NewPageIndex;
            if (Session["Buscar"] != null)
            {
                gvMedicos.DataSource = Session["Buscar"];
                gvMedicos.DataBind();
            }
            else
            {
                CargarMedicosInactivos();
            }

        }

        protected void gvMedicos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "eventoSeleccionar")
            {
                int fila = Convert.ToInt32(e.CommandArgument);
                string legajo = ((Label)gvMedicos.Rows[fila].FindControl("lbl_it_Legajo")).Text;
                string nombre = ((Label)gvMedicos.Rows[fila].FindControl("lbl_it_Nombre")).Text;
                lblMensaje.Text = "Quieres reactivar al medico " + nombre + " con legajo " + legajo + "?";
                btnConfirmar.Visible = true;
                btnCancelar.Visible = true;
                Session["legajo"] = legajo;
            }
        }

        private void OcultarBotones()
        {
            btnConfirmar.Visible = false;
            btnCancelar.Visible = false;
        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            OcultarBotones();
            MedicoNegocio medicoNegocio = new MedicoNegocio();
            if (medicoNegocio.ReactivarMedico((string)Session["legajo"]) == true)
            {
                lblMensaje.Text = "Se reactivo al medico con exito!";
            }
            else
            {
                lblMensaje.Text = "No se pudo reactivar al medico.";
            }
            Session["legajo"] = null;
            CargarMedicosInactivos();
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Session["legajo"] = null;
            OcultarBotones();
            limpiarTodo();
        }
    }
}
