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
    public partial class RegistrarAsistencias : System.Web.UI.Page
    {
        TurnoNegocio turnoNegocio = new TurnoNegocio();
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

        protected void btnMostrarTodos_Click(object sender, EventArgs e)
        {
            Session["FiltroActual"] = "todos";
            CargarGridview();
        }

        protected void gvListadoAsistencia_RowEditing(object sender, GridViewEditEventArgs e)
        {

            gvListadoAsistencia.EditIndex = e.NewEditIndex;
            CargarGridview();
        }

        private void CargarGridview()
        {
            string filtro = Session["FiltroActual"]?.ToString();

            switch (filtro)
            {
                case "todos":
                    gvListadoAsistencia.DataSource = turnoNegocio.TraerTodosLosTurnos(((Medico)Session["medico"]).getLegajo());
                    gvListadoAsistencia.DataBind();
                    break;

                case "fecha":
                    gvListadoAsistencia.DataSource = turnoNegocio.TraerTurnosPorFecha(((Medico)Session["medico"]).getLegajo(), txtFechaDeTurnos.Text);
                    gvListadoAsistencia.DataBind();
                    break;

                case "dni":
                    gvListadoAsistencia.DataSource = turnoNegocio.TraerTurnosPorDNI(((Medico)Session["medico"]).getLegajo(), txtDNI.Text);
                    gvListadoAsistencia.DataBind();
                    break;

            }

        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            Session["FiltroActual"] = "dni";
            CargarGridview();
        }

        protected void btnFiltrarPorFecha_Click(object sender, EventArgs e)
        {
            Session["FiltroActual"] = "fecha";
            CargarGridview();
        }

        protected void gvListadoAsistencia_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvListadoAsistencia.EditIndex = -1;
            CargarGridview();
        }

        protected void gvListadoAsistencia_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string id = ((Label)gvListadoAsistencia.Rows[e.RowIndex].FindControl("lblIDTurno")).Text;
            string asistencia = ((DropDownList)gvListadoAsistencia.Rows[e.RowIndex].FindControl("ddlAsistencia")).Text;
            string observaciones = ((TextBox)gvListadoAsistencia.Rows[e.RowIndex].FindControl("txtObservaciones")).Text;


            int filasAfectasdas = turnoNegocio.ModificarAsistencia(id, asistencia,observaciones);
            gvListadoAsistencia.EditIndex = -1;
            CargarGridview();
        }

        protected void gvListadoAsistencia_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvListadoAsistencia.PageIndex = e.NewPageIndex;
            CargarGridview();
        }

        protected void gvListadoAsistencia_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            // Solo actuamos en filas que están en modo edición
            if (e.Row.RowType == DataControlRowType.DataRow && (e.Row.RowState & DataControlRowState.Edit) > 0)
            {
                // Valor original tomado del DataItem
                string asistenciaOriginal = DataBinder.Eval(e.Row.DataItem, "Asistencia_T").ToString().Trim();

                DropDownList ddl = (DropDownList)e.Row.FindControl("ddlAsistencia");
                TextBox txtObs = (TextBox)e.Row.FindControl("txtObservaciones");

                // 1) Solo permitir cambiar asistencia si estaba en "A confirmar"
                if (asistenciaOriginal != "A confirmar")
                {
                    ddl.Enabled = false;
                }

                // 2) Solo permitir escribir observaciones si estaba en "Asistio"
                if (asistenciaOriginal != "Asistio")
                {
                    txtObs.Enabled = false;
                }
            }
        }
    }
}