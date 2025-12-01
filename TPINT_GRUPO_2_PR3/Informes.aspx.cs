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
    public partial class WebForm4 : System.Web.UI.Page
    {
        TurnoNegocio negocioT = new TurnoNegocio();
        LocalidadNegocio negocioL = new LocalidadNegocio();
        HorarioMedicoNegocio negocioHM = new HorarioMedicoNegocio();

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
            }
        }

        protected void ddlInforme_SelectedIndexChanged(object sender, EventArgs e)
        {
            switch (Convert.ToInt32(ddlInforme.SelectedValue))
            {
                case 0: //sin eleccion
                    txtFechaMenor.Visible = false;
                    txtFechaMayor.Visible = false;
                    lblSeparador.Visible = false;
                    break;

                case 1: //reporte de asistencias a turnos
                    txtFechaMenor.Visible = true;
                    txtFechaMayor.Visible = true;
                    lblSeparador.Visible = true;
                    lblMensaje.Text = string.Empty;
                    gvInforme.DataSource = null;
                    gvInforme.DataBind();
                    break;

                case 2: //pacientes por localidad
                    txtFechaMenor.Visible = false;
                    txtFechaMayor.Visible = false;
                    lblSeparador.Visible = false;
                    lblMensaje.Text = string.Empty;
                    gvInforme.DataSource = null;
                    gvInforme.DataBind();
                    break;

                case 3: //disponibilidad de médicos
                    txtFechaMenor.Visible = false;
                    txtFechaMayor.Visible = false;
                    lblSeparador.Visible = false;
                    lblMensaje.Text = string.Empty;
                    gvInforme.DataSource = null;
                    gvInforme.DataBind();
                    break;

                default:
                    txtFechaMenor.Visible = false;
                    txtFechaMayor.Visible = false;
                    lblSeparador.Visible = false;
                    lblMensaje.Text = string.Empty;
                    gvInforme.DataSource = null;
                    gvInforme.DataBind();
                    break;
            }
            lblMensaje.Text = string.Empty;
        }

        protected void btnInforme_Click(object sender, EventArgs e)
        {
            try
            {
                switch (Convert.ToInt32(ddlInforme.SelectedValue))
                {
                    case 0: //sin eleccion
                        lblMensaje.Text = "Seleccione un informe";
                        break;

                    case 1: //reporte de asistencias a turnos
                        if (!ValidarFechas()) { return; }
                        string fecha1 = txtFechaMenor.Text;
                        string fecha2 = txtFechaMayor.Text;
                        gvInforme.DataSource = negocioT.GenerarInforme(fecha1, fecha2);
                        gvInforme.DataBind();

                        if (fecha1.Length > 0)
                        {
                            if (fecha2.Length > 0)
                            {
                                lblMensaje.Text = "Reporte de asistencia para los turnos entre las fechas " + fecha1 + " y " + fecha2;
                            }
                            else { lblMensaje.Text = "Reporte de asistencia para los turnos desde la fecha " + fecha1; }
                        }
                        else if (fecha2.Length > 0) { lblMensaje.Text = "Reporte de asistencia para los turnos hasta la fecha " + fecha2; }
                        else { lblMensaje.Text = "Reporte de asistencia para todos los turnos"; }
                        break;

                    case 2: //pacientes por localidad
                        gvInforme.DataSource = negocioL.GenerarInforme();
                        gvInforme.DataBind();
                        lblMensaje.Text = "Informe de pacientes por localidad";
                        break;

                    case 3: //disponibilidad de médicos
                        gvInforme.DataSource = negocioHM.GenerarInforme();
                        gvInforme.DataBind();
                        lblMensaje.Text = "Informe de disponibilidad de médicos por día";
                        break;

                    default:
                        lblMensaje.Text = "Seleccione un informe";
                        break;
            }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }

        protected bool ValidarFechas()
        {
            string fecha1 = txtFechaMenor.Text;
            string fecha2 = txtFechaMayor.Text;
            bool validado = true;

            if (fecha1.Length == 0 || fecha2.Length == 0) { return true; }

            int temp1 = Convert.ToInt32(fecha1.Substring(0, 4));
            int temp2 = Convert.ToInt32(fecha2.Substring(0, 4));

            validado = temp1 < temp2;

            if (!validado && temp1 == temp2)
            {
                temp1 = Convert.ToInt32(fecha1.Substring(5, 2));
                temp2 = Convert.ToInt32(fecha2.Substring(5, 2));
                validado = temp1 < temp2;
            }

            if (!validado && temp1 == temp2)
            {
                temp1 = Convert.ToInt32(fecha1.Substring(8, 2));
                temp2 = Convert.ToInt32(fecha2.Substring(8, 2));
                validado = temp1 <= temp2;
            }

            if (!validado)
            {
                lblMensaje.Text = "Rango de fechas inválido.";
            }

            return validado;
        }
    }
}