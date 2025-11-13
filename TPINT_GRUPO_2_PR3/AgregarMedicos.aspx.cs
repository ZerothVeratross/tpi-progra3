using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using Negocios;

namespace TPINT_GRUPO_2_PR3
{
    public partial class AgregarMedico : System.Web.UI.Page
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
                LocalidadNegocio negocioL = new LocalidadNegocio();
                ProvinciaNegocio negocioP = new ProvinciaNegocio();
                EspecialidadNegocio negocioE = new EspecialidadNegocio();

                ddlLocalidad.DataSource = negocioL.getTablaLocalidad();
                ddlLocalidad.DataTextField = "Descripcion_L";
                ddlLocalidad.DataValueField = "Id_Localidad";
                ddlLocalidad.DataBind();

                ddlProvincia.DataSource = negocioP.getTablaProvincia();
                ddlProvincia.DataTextField = "Descripcion_P";
                ddlProvincia.DataValueField = "Id_Provincia";
                ddlProvincia.DataBind();

                ddlEspecialidad.DataSource = negocioE.getTablaEspecialidades();
                ddlEspecialidad.DataTextField = "Descripcion_E";
                ddlEspecialidad.DataValueField = "ID_Especialidad";
                ddlEspecialidad.DataBind();
            }
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            if (!validarDiasLaborales() || !validarTelefono() || !validarHorario()) {
                return;
            }

        }

        protected bool validarDiasLaborales()
        {
            bool validado = false;
            foreach (ListItem item in cblDiasLaborales.Items)
            {
                validado = item.Selected;
                if (validado)
                {
                    break;
                }
            }
            if (!validado) { lblDiasLaboralesValidator.Text = "Días laborales requerido."; }
            else { lblDiasLaboralesValidator.Text = ""; }
                return validado;
        }

        protected bool validarTelefono()
        {
            bool validado = Regex.IsMatch(txtTelefono1.Text, @"^[0-9]{2}$") &&
                Regex.IsMatch(txtTelefono2.Text, @"^[0-9]{4}$") &&
                Regex.IsMatch(txtTelefono3.Text, @"^[0-9]{4}$");
            if (!validado) { lblTelefonoValidator.Text = "Númerico telefónico inválido."; }
            else { lblTelefonoValidator.Text = ""; }
                return validado;
        }

        protected bool validarHorario()
        {
            bool entradaValidada = Regex.IsMatch(txtHoraDeEntrada.Text, @"^[0-9]{2}$") && Convert.ToInt32(txtHoraDeEntrada.Text) < 24;
            bool salidaValidada = Regex.IsMatch(txtHoraDeSalida.Text, @"^[0-9]{2}$") && Convert.ToInt32(txtHoraDeSalida.Text) < 24;

            if (!entradaValidada) { lblHoraDeEntradaValidator.Text = "Hora de entrada inválida."; }
            else { lblHoraDeEntradaValidator.Text = ""; }
            if (!salidaValidada) { lblHoraDeSalidaValidator.Text = "Hora de salida inválida."; }
            else { lblHoraDeSalidaValidator.Text = ""; }

            if (entradaValidada && salidaValidada)
            {
                int horaEntrada = Convert.ToInt32(txtHoraDeEntrada.Text);
                int horaSalida = Convert.ToInt32(txtHoraDeSalida.Text);
                if (horaEntrada > horaSalida) { horaSalida += 24; }
                if (horaSalida - horaEntrada > 8)
                {
                    lblHoraDeEntradaValidator.Text = "El turno no puede durar más de 8 horas.";
                    return false;
                } else
                {
                    return true;
                }
            } else { return false; }
        }
    }
}