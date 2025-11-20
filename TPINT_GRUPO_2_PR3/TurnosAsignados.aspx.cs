using Entidades;
using Negocios;
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
        ProvinciaNegocio provinciaNegocio = new ProvinciaNegocio();
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
                cargarGvPacientes();
            }
        }
        protected void cargarGvPacientes()
        {
            try
            {
                Medico medico = new Medico();
                medico = (Medico)Session["medico"];
                TurnoNegocio turnoNegocio = new TurnoNegocio();
                Session.Add("listaTurnos", turnoNegocio.listarTurnos(medico));
                gvTurnosAsignados.DataSource = Session["listaTurnos"];
                gvTurnosAsignados.DataBind();
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }

        protected void ddlFiltro_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (ddlFiltro.SelectedIndex == 0)
                    ddlFiltro2.Items.Clear();
                switch (ddlFiltro.SelectedItem.ToString())
                {
                    case "Sexo":
                        ddlFiltro2.Items.Clear();
                        ddlFiltro2.Items.Add("Masculino");
                        ddlFiltro2.Items.Add("Femenino");
                        break;

                    case "Provincia":
                        ddlFiltro2.Items.Clear();
                        ddlFiltro2.DataSource = provinciaNegocio.getTablaProvincia();
                        ddlFiltro2.DataTextField = "Descripcion_P";
                        ddlFiltro2.DataValueField = "Id_Provincia";
                        ddlFiltro2.DataBind();
                        break;

                    case "Asistencia":
                        ddlFiltro2.Items.Clear();
                        ddlFiltro2.Items.Add("Asistio");
                        ddlFiltro2.Items.Add("No asistio");
                        ddlFiltro2.Items.Add("A confirmar");
                        break;
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
            List<Turno> listaTurnos = (List<Turno>)Session["listaTurnos"];
            List<Turno> listaTurnosFiltrada = listaTurnos.FindAll(t => t.Nombre.ToUpper().Contains(txtBuscar.Text.ToUpper()) || t.Apellido.ToUpper().Contains(txtBuscar.Text.ToUpper()));
            gvTurnosAsignados.DataSource = listaTurnosFiltrada;
            gvTurnosAsignados.DataBind();
            txtBuscar.Text = string.Empty;
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            try
            {
                TurnoNegocio turnoNegocio = new TurnoNegocio();
                List<Turno> turnosFiltrados = null;
                {
                    turnosFiltrados = turnoNegocio.FiltrarTurno(ddlFiltro.SelectedItem.ToString(), ddlFiltro2.SelectedItem.ToString(), ((Medico)Session["medico"]).getLegajo());
                    gvTurnosAsignados.DataSource = turnosFiltrados;
                    gvTurnosAsignados.DataBind();
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }

        protected void btnMostrarTodos_Click(object sender, EventArgs e)
        {
            cargarGvPacientes();
        }
    }
}