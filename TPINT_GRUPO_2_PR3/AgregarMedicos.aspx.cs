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
                ProvinciaNegocio negocioP = new ProvinciaNegocio();
                EspecialidadNegocio negocioE = new EspecialidadNegocio();

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
            if (!validarDiasLaborales() || !validarTelefono() || !validarHorario() || !validarDDLs() || !validarCalendario()) {
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
            else { lblDiasLaboralesValidator.Text = string.Empty; }
            return validado;
        }

        protected bool validarTelefono()
        {
            bool validado = Regex.IsMatch(txtTelefono1.Text, @"^[0-9]{2}$") &&
                Regex.IsMatch(txtTelefono2.Text, @"^[0-9]{4}$") &&
                Regex.IsMatch(txtTelefono3.Text, @"^[0-9]{4}$");
            if (!validado) { lblTelefonoValidator.Text = "Númerico telefónico inválido."; }
            else { lblTelefonoValidator.Text = string.Empty; }
            return validado;
        }

        protected bool validarHorario()
        {
            bool entradaValidada = Regex.IsMatch(txtHoraDeEntrada.Text, @"^[0-9]{2}$") && Convert.ToInt32(txtHoraDeEntrada.Text) < 24;
            bool salidaValidada = Regex.IsMatch(txtHoraDeSalida.Text, @"^[0-9]{2}$") && Convert.ToInt32(txtHoraDeSalida.Text) < 24;

            if (!entradaValidada) { lblHoraDeEntradaValidator.Text = "Hora de entrada inválida."; }
            else { lblHoraDeEntradaValidator.Text = string.Empty; }
            if (!salidaValidada) { lblHoraDeSalidaValidator.Text = "Hora de salida inválida."; }
            else { lblHoraDeSalidaValidator.Text = string.Empty; }

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

        protected bool validarDDLs() {
            bool validado = true;
            validado = ddlEspecialidad.SelectedValue != "0";
            if (!validado) { lblEspecialidadValidator.Text = "Seleccione una especialidad."; }
            else { lblEspecialidadValidator.Text = string.Empty; }
            validado = ddlProvincia.SelectedValue != "0";
            if (!validado) { lblProvinciaValidator.Text = "Seleccione una provincia."; }
            else { lblProvinciaValidator.Text = string.Empty; }
            validado = ddlLocalidad.SelectedValue != "0";
            if (!validado) { lblLocalidadValidator.Text = "Seleccione una localidad."; }
            else { lblLocalidadValidator.Text = string.Empty; }
            return validado;
        }

        protected void ddlProvincia_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlProvincia.SelectedValue != "0")
            {
                LocalidadNegocio negocioL = new LocalidadNegocio();
                ddlLocalidad.Items.Clear();
                ddlLocalidad.Items.Add(new ListItem("--Seleccione Localidad--", "0"));
                ddlLocalidad.DataSource = negocioL.getTablaLocalidad(ddlProvincia.SelectedValue);
                ddlLocalidad.DataTextField = "Descripcion_L";
                ddlLocalidad.DataValueField = "Id_Localidad";
                ddlLocalidad.DataBind();
                ddlLocalidad.SelectedIndex = 0;
            }
            else
            {
                ddlLocalidad.Items.Clear();
                ddlLocalidad.Items.Add(new ListItem("--Seleccione Provincia primero--", "0"));
                ddlLocalidad.SelectedIndex = 0;
            }
        }

        protected bool validarCalendario()
        {
            bool validado = calFechaDeNacimiento.SelectedDate != DateTime.MinValue;
            lblFechaDeNacimientoValidator.Text = calFechaDeNacimiento.SelectedDate.ToString();
            if (!validado) { lblFechaDeNacimientoValidator.Text = "Seleccione fecha de nacimiento."; }
            else { lblFechaDeNacimientoValidator.Text = string.Empty; }

            return validado;
        }
    }
}