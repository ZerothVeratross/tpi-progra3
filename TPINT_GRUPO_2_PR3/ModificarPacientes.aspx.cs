using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocios;
using Entidades;

namespace TPINT_GRUPO_2_PR3
{
    public partial class WebForm2 : System.Web.UI.Page
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
                    cargarLocalidad();
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
        private void cargarLocalidad()
        {
            try
            {
                ddlLocalidad.DataSource = localidadNegocio.GetLocalidadPorProvincia(ddlProvincia.SelectedValue);
                ddlLocalidad.DataTextField = "Descripcion_L";
                ddlLocalidad.DataValueField = "Id_Localidad";
                ddlLocalidad.DataBind();

                ddlLocalidad.Items.Insert(0, new ListItem("--Seleccione Localidad--", "0"));
                ddlLocalidad.SelectedIndex = 0;
            }
            catch (Exception ex)
            {

                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }

        protected void btnBuscarDNI_Click(object sender, EventArgs e)
        {
            try
            {
                string dni = txtDNI.Text.Trim();

                LimpiarLabelErrorExito();
                LimpiarLabelDeConfirmacion();
                LimpiarCampos();

                if (string.IsNullOrEmpty(dni))
                {
                    lblError.Text = "Debe ingresar un DNI para poder modificar.";
                    return;
                }

                PacienteNegocio pacienteNegocio = new PacienteNegocio();
                Paciente paciente = new Paciente();
                paciente = pacienteNegocio.GetPacientePorDNI(dni);

                if (paciente == null)
                {
                    lblError.Text = "No se encontró un paciente activo con ese DNI.";
                    btnModificar.Enabled = false;
                    return;
                }
                lblExito.Text = "Puede ingresar los datos que desee modificar.";
                CargarDatosPacienteEnPantalla(paciente);
                btnModificar.Enabled = true;
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            try
            {
                string dni = txtDNI.Text.Trim();

                PacienteNegocio pacienteNegocio = new PacienteNegocio();
                Paciente paciente = new Paciente();
                paciente = pacienteNegocio.GetPacientePorDNI(dni);

                LimpiarLabelDeConfirmacion();
                if (paciente == null)
                {
                    LimpiarCampos();
                    LimpiarLabelErrorExito();
                    lblError.Text = "No se encontro un paciente activo con ese DNI.";
                    btnModificar.Enabled = false;
                    return;
                }
                bool HuboAlgunCambio = false;

                if (!txtNombre.Text.Trim().Equals(paciente.getNombre().Trim(), StringComparison.OrdinalIgnoreCase))
                {
                    paciente.setNombre(txtNombre.Text.Trim());
                    HuboAlgunCambio = true;

                }
                if (!txtApellido.Text.Trim().Equals(paciente.getApellido().Trim(), StringComparison.OrdinalIgnoreCase))
                {
                    paciente.setApellido(txtApellido.Text.Trim());
                    HuboAlgunCambio = true;
                }
                if (!rblSexo.SelectedValue.Trim().Equals(paciente.getSexo().Trim(), StringComparison.OrdinalIgnoreCase))
                {
                    paciente.setSexo(rblSexo.SelectedValue);
                    HuboAlgunCambio = true;
                }
                if (!txtNacionalidad.Text.Trim().Equals(paciente.getNacionalidad().Trim(), StringComparison.OrdinalIgnoreCase))
                {
                    paciente.setNacionalidad(txtNacionalidad.Text.Trim());
                    HuboAlgunCambio = true;
                }
                try
                {
                    DateTime fechaSeleccionada = DateTime.Parse(calNacimiento.Text);
                    DateTime fechaActual = DateTime.Today;
                    if (fechaSeleccionada > fechaActual)
                    {
                        lblMensajeFecha.Text = "No puede ser una fecha posterior al día actual.";
                        return;
                    }
                    if (fechaSeleccionada != paciente.getFechaNacimiento())
                    {
                        paciente.setFechaNacimiento(fechaSeleccionada);
                        HuboAlgunCambio = true;
                    }
                }
                catch (Exception)
                {
                    throw;
                }
                if (!txtDireccion.Text.Trim().Equals(paciente.getDireccion().Trim(), StringComparison.OrdinalIgnoreCase))
                {
                    paciente.setDireccion(txtDireccion.Text.Trim());
                    HuboAlgunCambio = true;
                }
                if (!txtCorreo.Text.Trim().Equals(paciente.getCorreoElectronico().Trim(), StringComparison.OrdinalIgnoreCase))
                {
                    paciente.setCorreoElectronico(txtCorreo.Text.Trim());
                    HuboAlgunCambio = true;
                }
                if (!txtTelefono.Text.Trim().Equals(paciente.getTelefono().Trim(), StringComparison.OrdinalIgnoreCase))
                {
                    paciente.setTelefono(txtTelefono.Text.Trim());
                    HuboAlgunCambio = true;
                }

                Provincia provincia = new Provincia();
                provincia.setIdProvincia(ddlProvincia.SelectedValue);
                paciente.setProvincia(provincia);

                if (ddlLocalidad.SelectedValue != paciente.getLocalidad().getIdLocalidad())
                {
                    Localidad localidad = new Localidad();
                    localidad.setIdLocalidad(ddlLocalidad.SelectedValue);
                    paciente.setLocalidad(localidad);
                    HuboAlgunCambio = true;
                }
                if (!HuboAlgunCambio)
                {
                    lblConfirmacionError.Text = "No hubo modificación nueva de ningún dato.";
                    return;
                }
                bool modificado = pacienteNegocio.modificarPaciente(paciente);

                if (modificado)
                {
                    lblConfirmacionExito.Text = "Paciente modificado correctamente.";
                    btnModificar.Enabled = false;
                }
                else
                {
                    lblConfirmacionError.Text = "No se pudo modificar el paciente.";
                }
                LimpiarCampos();
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }

        private void CargarDatosPacienteEnPantalla(Paciente paciente)
        {
            txtDNI.Text = paciente.getDni().Trim();
            txtNombre.Text = paciente.getNombre().Trim();
            txtApellido.Text = paciente.getApellido().Trim();
            rblSexo.SelectedValue = paciente.getSexo().Trim();
            txtNacionalidad.Text = paciente.getNacionalidad().Trim();
            calNacimiento.Text = paciente.getFechaNacimiento().ToString("yyyy-MM-dd");
            txtDireccion.Text = paciente.getDireccion().Trim();
            ddlProvincia.SelectedValue = paciente.getProvincia().getIdProvincia();
            txtCorreo.Text = paciente.getCorreoElectronico().Trim();
            txtTelefono.Text = paciente.getTelefono().Trim();

            cargarLocalidad();
            ddlLocalidad.SelectedValue = paciente.getLocalidad().getIdLocalidad();
        }
        private void LimpiarLabelDeConfirmacion()
        {
            lblConfirmacionError.Text = string.Empty;
            lblConfirmacionExito.Text = string.Empty;
        }
        private void LimpiarLabelErrorExito()
        {

            lblError.Text = string.Empty;
            lblExito.Text = string.Empty;
        }
        public void LimpiarCampos()
        {
            LimpiarLabelErrorExito();
            lblMensajeFecha.Text = "";
            txtDNI.Text = string.Empty;
            txtNombre.Text = string.Empty;
            txtApellido.Text = string.Empty;
            txtNacionalidad.Text = string.Empty;
            txtDireccion.Text = string.Empty;
            txtCorreo.Text = string.Empty;
            txtTelefono.Text = string.Empty;
            ddlProvincia.SelectedIndex = 0;
            ddlLocalidad.Items.Clear();
            rblSexo.ClearSelection();
            calNacimiento.Text = string.Empty;
        }
    }
}