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
    public partial class ReactivarPaciente : System.Web.UI.Page
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
                    CargarTodosLosPacientesInactivos();

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
        private void CargarTodosLosPacientesInactivos()
        {
            try
            {
                PacienteNegocio pacienteNegocio = new PacienteNegocio();
                gvListaReactivarPacientes.DataSource = pacienteNegocio.ObtenerTablaPacientesInactivos();
                gvListaReactivarPacientes.DataBind();
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }
        protected void ddlProvincia_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlLocalidad.Items.Clear();
            try
            {
                if (ddlProvincia.SelectedValue != "0")
                {
                    ddlLocalidad.DataSource = localidadNegocio.getTablaLocalidad(ddlProvincia.SelectedValue);
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
        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                lblMensajeAConfirmar.Text = string.Empty;
                LimpiarCamposFiltros();
                Session["PacientesFiltrados"] = null;

                string textoBusqueda = txtBusqueda.Text.Trim();
                PacienteNegocio pacienteNegocio = new PacienteNegocio();

                DataTable dtBuscar = pacienteNegocio.BuscarPacienteInactivo(textoBusqueda);
                Session["PacientesBuscar"] = dtBuscar;
                gvListaReactivarPacientes.DataSource = dtBuscar;
                gvListaReactivarPacientes.DataBind();
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
                lblMensajeAConfirmar.Text = string.Empty;
                LimpiarCamposBusqueda();
                Session["PacientesBuscar"] = null;

                PacienteNegocio pacienteNegocio = new PacienteNegocio();
                string idProvincia = ddlProvincia.SelectedValue;
                string idLocalidad = ddlLocalidad.SelectedValue;

                DataTable dtFiltrado = pacienteNegocio.FiltrarPacienteInactivo(idProvincia, idLocalidad);
                Session["PacientesFiltrados"] = dtFiltrado;
                gvListaReactivarPacientes.DataSource = dtFiltrado;
                gvListaReactivarPacientes.DataBind();
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }
        protected void btnLimpiarTodosLosPacientes_Click(object sender, EventArgs e)
        {
            lblMensajeAConfirmar.Text = string.Empty;
            Session["PacientesFiltrados"] = null;
            Session["PacientesBuscar"] = null;
            CargarTodosLosPacientesInactivos();
            LimpiarCamposBusqueda();
            LimpiarCamposFiltros();
        }
        protected void gvListaReactivarPacientes_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                lblMensajeAConfirmar.Text = string.Empty;
                gvListaReactivarPacientes.PageIndex = e.NewPageIndex;
                ActualizarPaginacion();
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }

        protected void gvListaReactivarPacientes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Reactivar")
            {
                lblMensajeAConfirmar.Text = string.Empty;
                string DNISeleccionado = e.CommandArgument.ToString();
                lblMensajeAConfirmar.Text = "¿Está seguro que desea reactivar al paciente con DNI: " + DNISeleccionado + "?";
                btnAceptar.Visible = true;
                btnCancelar.Visible = true;
                Session["DNISeleccionadoReactivar"] = DNISeleccionado;

                btnBuscar.Enabled = false;
                btnFiltrar.Enabled = false;
                btnLimpiarTodosLosPacientes.Enabled = false;
                gvListaReactivarPacientes.Enabled = false;
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                string dni = "";
                if (Session["DNISeleccionadoReactivar"] != null)
                {
                    dni = Session["DNISeleccionadoReactivar"].ToString();
                }
                PacienteNegocio pacienteNegocio = new PacienteNegocio();

                bool Activar = pacienteNegocio.ReactivarPaciente(dni);
                if (Activar)
                {
                    lblMensajeAConfirmar.Text = "Paciente reactivado correctamente.";

                    if (Session["PacientesBuscar"] != null)
                    {
                        DataTable dtBuscar = (DataTable)Session["PacientesBuscar"];
                        QuitarDNIReactivado(dtBuscar, dni);
                        Session["PacientesBuscar"] = dtBuscar;
                        if (dtBuscar.Rows.Count == 0)
                        {
                            Session["PacientesBuscar"] = null;
                            LimpiarCamposBusqueda();
                            CargarTodosLosPacientesInactivos();
                        }
                    }
                    else if (Session["PacientesFiltrados"] != null)
                    {
                        DataTable dtFiltrar = (DataTable)Session["PacientesFiltrados"];
                        QuitarDNIReactivado(dtFiltrar, dni);
                        Session["PacientesFiltrados"] = dtFiltrar;
                        if (dtFiltrar.Rows.Count == 0)
                        {
                            Session["PacientesFiltrados"] = null;
                            LimpiarCamposFiltros();
                            CargarTodosLosPacientesInactivos();
                        }
                    }
                    ActualizarPaginacion();
                }
                else
                {
                    lblMensajeAConfirmar.Text = "El paciente no pudo reactivarse.";
                }
                LimpiarBotonesConfirmacion();
                DesactivarBloqueoAlSeleccionar();
            }
            catch (Exception ex)
            {

                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }
        private void QuitarDNIReactivado(DataTable dataTable, string DNIQuitar)
        {
            foreach (DataRow fila in dataTable.Rows)
            {
                if (fila["DNI"].ToString() == DNIQuitar)
                {
                    dataTable.Rows.Remove(fila);
                    break;
                }
            }
        }
        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            lblMensajeAConfirmar.Text = string.Empty;
            LimpiarBotonesConfirmacion();
            DesactivarBloqueoAlSeleccionar();
        }
        private void ActualizarPaginacion()
        {
            try
            {
                if (Session["PacientesBuscar"] != null)
                {
                    gvListaReactivarPacientes.DataSource = (DataTable)Session["PacientesBuscar"];
                }
                else if (Session["PacientesFiltrados"] != null)
                {
                    gvListaReactivarPacientes.DataSource = (DataTable)Session["PacientesFiltrados"];
                }
                else
                {
                    PacienteNegocio pacienteNegocio = new PacienteNegocio();
                    gvListaReactivarPacientes.DataSource = pacienteNegocio.ObtenerTablaPacientesInactivos();
                }
                gvListaReactivarPacientes.DataBind();
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
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
        private void LimpiarBotonesConfirmacion()
        {
            btnAceptar.Visible = false;
            btnCancelar.Visible = false;
        }

        private void DesactivarBloqueoAlSeleccionar()
        {
            btnBuscar.Enabled = true;
            btnFiltrar.Enabled = true;
            btnLimpiarTodosLosPacientes.Enabled = true;
            gvListaReactivarPacientes.Enabled = true;
        }
    }
}