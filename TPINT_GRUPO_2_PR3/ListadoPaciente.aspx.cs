using Entidades;
using Negocios;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPINT_GRUPO_2_PR3
{
    public partial class ListadoPaciente : System.Web.UI.Page
    {

        ProvinciaNegocio provinciaNegocio = new ProvinciaNegocio();
        LocalidadNegocio localidadNegocio = new LocalidadNegocio();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["EsAdmin"] == null || (bool)Session["EsAdmin"] == false)
            {
                Session.Add("Error", "No tiene los permisos necesarios para acceder a esta página.");
                Response.Redirect("Error.aspx");
            }

            if (!IsPostBack)
            {
                lblNombreAdministrador.Text = "Administrador: " + ((Administrador)Session["admin"]).getNombre() + " " + ((Administrador)Session["admin"]).getApellido();
                try
                {
                    CargarTodosLosPacientes();

                    ddlProvincia.DataSource = provinciaNegocio.getTablaProvincia();
                    ddlProvincia.DataTextField = "Descripcion_P";
                    ddlProvincia.DataValueField = "Id_Provincia";
                    ddlProvincia.DataBind();

                    ddlProvincia.Items.Insert(0, new ListItem("--Seleccione Provincia--", "0"));
                    ddlProvincia.SelectedIndex = 0;
                }
                catch (Exception ex)
                {
                    Session.Add("error", ex.ToString());
                    Response.Redirect("Error.aspx");
                }
            }
        }
        protected void ddlProvincia_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlLocalidad.Items.Clear();
            try
            {
                if (ddlProvincia.SelectedValue != "0")
                {
                    ddlLocalidad.DataSource = localidadNegocio.GetLocalidadPorProvincia(ddlProvincia.SelectedValue);
                    ddlLocalidad.DataTextField = "Descripcion_L";
                    ddlLocalidad.DataValueField = "Id_Localidad";
                    ddlLocalidad.DataBind();

                    ddlLocalidad.Items.Insert(0, new ListItem("--Seleccione Localidad--", "0"));
                    ddlLocalidad.SelectedIndex = 0;
                }
                else
                {
                    ddlLocalidad.Items.Clear();
                    ddlLocalidad.Items.Insert(0, new ListItem("--Seleccione Provincia Primero--", "0"));
                    ddlLocalidad.SelectedIndex = 0;
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }
        private void CargarTodosLosPacientes()
        {
            try
            {
                PacienteNegocio pacienteNegocio = new PacienteNegocio();
                gvListaPacientes.DataSource = pacienteNegocio.getTablaPacientes();
                gvListaPacientes.DataBind();
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }
        protected void btnBusqueda_Click(object sender, EventArgs e)
        {
            try
            {
                LimpiarCamposFiltros();
                Session["PacientesFiltrados"] = null;

                string textoBusqueda = txtBusqueda.Text.Trim();
                PacienteNegocio pacienteNegocio = new PacienteNegocio();

                DataTable dtBuscar = pacienteNegocio.BusquedaPaciente(textoBusqueda);
                Session["PacientesBuscar"] = dtBuscar;
                gvListaPacientes.DataSource = dtBuscar;
                gvListaPacientes.DataBind();
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }
        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            try
            {
                LimpiarCamposBusqueda();
                Session["PacientesBuscar"] = null;

                string textoBusqueda = txtBusqueda.Text.Trim();
                PacienteNegocio pacienteNegocio = new PacienteNegocio();
                string idProvincia = ddlProvincia.SelectedValue;
                string idLocalidad = ddlLocalidad.SelectedValue;

                DataTable dtFiltrado = pacienteNegocio.FiltrarPaciente(idProvincia, idLocalidad);
                Session["PacientesFiltrados"] = dtFiltrado;
                gvListaPacientes.DataSource = dtFiltrado;
                gvListaPacientes.DataBind();
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }
        protected void btnMostrarTodosPacientes_Click(object sender, EventArgs e)
        {
            Session["PacientesFiltrados"] = null;
            Session["PacientesBuscar"] = null;
            CargarTodosLosPacientes();
            LimpiarCamposBusqueda();
            LimpiarCamposFiltros();
        }
        private void LimpiarCamposBusqueda()
        {
            txtBusqueda.Text = string.Empty;
        }
        private void LimpiarCamposFiltros()
        {
            ddlProvincia.SelectedIndex = 0;
            ddlLocalidad.Items.Clear();
        }
        protected void gvListaPacientes_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                gvListaPacientes.PageIndex = e.NewPageIndex;
                if (Session["PacientesBuscar"] != null)
                {
                    gvListaPacientes.DataSource = (DataTable)Session["PacientesBuscar"];
                }
                else if (Session["PacientesFiltrados"] != null)
                {
                    gvListaPacientes.DataSource = (DataTable)Session["PacientesFiltrados"];
                }
                else
                {
                    PacienteNegocio pacienteNegocio = new PacienteNegocio();
                    gvListaPacientes.DataSource = pacienteNegocio.getTablaPacientes();
                }
                gvListaPacientes.DataBind();
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }
    }
}