using Entidades;
using Negocios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPINT_GRUPO_2_PR3
{
    public partial class AgregarMedico : System.Web.UI.Page
    {
        MedicoNegocio negocioM = new MedicoNegocio();
        LocalidadNegocio negocioL = new LocalidadNegocio();
        ProvinciaNegocio negocioP = new ProvinciaNegocio();
        EspecialidadNegocio negocioE = new EspecialidadNegocio();
        HorarioMedicoNegocio negocioH = new HorarioMedicoNegocio();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["EsAdmin"] == null || (bool)Session["EsAdmin"] == false)
            {
                Session.Add("Error", "No tiene los permisos necesarios para acceder a esta página.");
                Response.Redirect("Error.aspx");
            }

            if (!IsPostBack)
            {
                lblUsuario.Text = "Administrador: " + ((Administrador)Session["admin"]).getNombre() + " " + ((Administrador)Session["admin"]).getApellido();
                try
                {
                    ddlProvincia.DataSource = negocioP.getTablaProvincia();
                    ddlProvincia.DataTextField = "Descripcion_P";
                    ddlProvincia.DataValueField = "Id_Provincia";
                    ddlProvincia.DataBind();

                    ddlEspecialidad.DataSource = negocioE.getTablaEspecialidades();
                    ddlEspecialidad.DataTextField = "Descripcion_E";
                    ddlEspecialidad.DataValueField = "ID_Especialidad";
                    ddlEspecialidad.DataBind();
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
            try
            {
                if (ddlProvincia.SelectedValue != "0")
                {
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
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }

        protected void txtAnio_TextChanged(object sender, EventArgs e)
        {
            if (!Regex.IsMatch(txtAnio.Text, "^[0-9]{4}$"))
            {
                lblAnioInvalido.Text = "Año inválido.";
                return;
            }
            else
            {
                lblAnioInvalido.Text = "";
            }
            calFechaDeNacimiento.VisibleDate = new DateTime(Convert.ToInt32(txtAnio.Text), 6, 20);
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            try
            {
                if (!validarDiasLaborales() || !validarTelefono() || !validarHorario() || !validarDDLs() || !validarCalendario() ||
                    !validarMedicoNoExiste())
                {
                    return;
                }

                Especialidad especialidad = new Especialidad(ddlEspecialidad.SelectedValue,
                    negocioE.GetEspecialidad(ddlEspecialidad.SelectedValue));

                Provincia provincia = new Provincia(ddlProvincia.SelectedValue,
                    negocioP.GetProvincia(ddlProvincia.SelectedValue));

                Localidad localidad = new Localidad(ddlLocalidad.SelectedValue,
                    negocioL.GetLocalidad(ddlLocalidad.SelectedValue));

                Medico medico = new Medico(negocioM.GetLegajoNuevo(), especialidad, true, txtUsuarioMedico.Text, txtContrasenia.Text, txtDNI.Text,
                    txtNombre.Text, txtApellido.Text, rblSexo.SelectedValue, txtNacionalidad.Text, calFechaDeNacimiento.SelectedDate,
                    txtDireccion.Text, provincia, localidad, txtCorreo.Text, txtTelefono1.Text + txtTelefono2.Text + txtTelefono3.Text);

                negocioM.agregarMedico(medico);

                HorarioMedico horario = new HorarioMedico();

                foreach (ListItem item in cblDiasLaborales.Items)
                {
                    if (item.Selected)
                    {
                        horario = new HorarioMedico(medico.getLegajo(), item.Value, txtHoraDeEntrada.Text + ":00:00", txtHoraDeSalida.Text +
                            ":00:00");
                        negocioH.AgregarHorario(horario);
                    }
                }

                lblMensaje.Text += "Médico agregado.";
                LimpiarCampos();
                gvMedico.DataSource = negocioM.ListarMedicos(medico.getLegajo(), "", "", "", "");
                gvMedico.DataBind();
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }

        protected void LimpiarCampos()
        {
            txtDNI.Text = string.Empty;
            txtNombre.Text = string.Empty;
            txtApellido.Text = string.Empty;
            rblSexo.SelectedIndex = 0;
            txtNacionalidad.Text = string.Empty;
            calFechaDeNacimiento.SelectedDate = DateTime.MinValue;
            txtAnio.Text = string.Empty;
            txtDireccion.Text = string.Empty;
            ddlProvincia.SelectedIndex = 0;
            ddlLocalidad.SelectedIndex = 0;
            txtCorreo.Text = string.Empty;
            txtTelefono1.Text = string.Empty;
            txtTelefono2.Text = string.Empty;
            txtTelefono3.Text = string.Empty;
            ddlEspecialidad.SelectedIndex = 0;
            foreach (ListItem item in cblDiasLaborales.Items)
            {
                item.Selected = false;
            }
            txtHoraDeEntrada.Text = string.Empty;
            txtHoraDeSalida.Text = string.Empty;
            txtUsuarioMedico.Text = string.Empty;
            //contrasenia se limpia siempre en postback
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

        protected bool validarCalendario()
        {
            bool validado = calFechaDeNacimiento.SelectedDate != DateTime.MinValue;
            lblFechaDeNacimientoValidator.Text = calFechaDeNacimiento.SelectedDate.ToString();
            if (!validado) { lblFechaDeNacimientoValidator.Text = "Seleccione fecha de nacimiento."; }
            else { lblFechaDeNacimientoValidator.Text = string.Empty; }

            return validado;
        }

        protected bool validarMedicoNoExiste()
        {
            bool validado = false;

            try
            {
                validado = !negocioM.BuscarUsuario(txtUsuarioMedico.Text);
                if (validado) {
                    validado = !negocioM.BuscarDNI(txtDNI.Text);
                    lblUsuarioMedicoValidator.Text = string.Empty;
                } else
                {
                    lblUsuarioMedicoValidator.Text = "El nombre de usuario ya está en uso.";
                    return false;
                }

                if (!validado) {
                    lblDNIValidator.Text = "El DNI ya está registrado.";
                } else
                {
                    lblDNIValidator.Text = string.Empty;
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
            return validado;
        }
    }
}