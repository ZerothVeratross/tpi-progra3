using Entidades;
using Negocios;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPINT_GRUPO_2_PR3
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        LocalidadNegocio localidadNeg = new LocalidadNegocio();
        ProvinciaNegocio ProvinciaNeg = new ProvinciaNegocio();
        EspecialidadNegocio especialidadNeg = new EspecialidadNegocio();
        MedicoNegocio medicoNeg = new MedicoNegocio();
        HorarioMedicoNegocio horarioMedicoNeg = new HorarioMedicoNegocio();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["EsAdmin"] == null || (bool)Session["EsAdmin"] == false)
            {
                Session.Add("Error", "No tiene los permisos necesarios para acceder a esta página.");
                Response.Redirect("Error.aspx");
            }
            if (!IsPostBack)
            {
                lblNombreDeUsuario.Text = "Administrador: " + ((Administrador)Session["admin"]).getNombre() + " " + ((Administrador)Session["admin"]).getApellido();
                try
                {
                    // -----------------> CARGAMOS TODOS LOS DDL <--------------------------------
                    CargarddlEspecialidades();
                    CargarddlProvincias();
                    CargarddlLocalidades();
                    CargarHorarios();
                }
                catch (Exception ex)
                {
                    Session.Add("error", ex.ToString());
                    Response.Redirect("Error.aspx");
                }
            }
        }
        // --------------------------> CARGA DE DATOS EN EL FORMULARIO <-------------------------------------
        protected void CargarHorarios()
        {
            for (int i = 6; i < 20; i++)
            {
                ddlHorarioDeEntrada.Items.Add(i.ToString("D2") + ":00");
                ddlHorarioDeSalida.Items.Add(i.ToString("D2") + ":00");
            }
        }
        protected void CargarddlEspecialidades()
        {
            ddlEspecialidad.DataSource = especialidadNeg.getTablaEspecialidades();
            ddlEspecialidad.DataTextField = "Descripcion_E";
            ddlEspecialidad.DataValueField = "ID_Especialidad";
            ddlEspecialidad.DataBind();
        }
        protected void CargarddlProvincias()
        {
            ddlProvincia.DataSource = ProvinciaNeg.getTablaProvincia();
            ddlProvincia.DataTextField = "Descripcion_P";
            ddlProvincia.DataValueField = "Id_Provincia";
            ddlProvincia.DataBind();
        }
        protected void CargarddlLocalidades()
        {
            ddlLocalidad.DataSource = localidadNeg.GetLocalidadPorProvincia(ddlProvincia.SelectedValue);
            ddlLocalidad.DataTextField = "Descripcion_L";
            ddlLocalidad.DataValueField = "Id_Localidad";
            ddlLocalidad.DataBind();
        }

        protected void btnBuscarLegajo_Click(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsValid) return;
                string legajo = txtBuscarLegajo.Text.Trim();

                Medico medico = ObtenerMedico(legajo);
                if (medico == null)
                {
                    MostrarNoEncontrado();
                    return;
                }

                CargarDatosMedicoEnPantalla(medico);
                CargarHorarioYDias(legajo);
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }
        private Medico ObtenerMedico(string legajo)
        {
            Medico medico = new Medico();
            medico.setLegajo(legajo);
            medico.setLocalidad(new Localidad());
            medico.setEspecialidad(new Especialidad());
            medico.setProvincia(new Provincia());

            return medicoNeg.TraerMedico(medico);
        }
        private void MostrarNoEncontrado()
        {
            lblMensaje.Text = "No se encontró un médico con ese legajo.";
            LimpiarCampos();
        }
        private void CargarDatosMedicoEnPantalla(Medico medico)
        {
            lblMensaje.Text = string.Empty;

            lblLegajoEncontrado.Text = medico.getLegajo();
            txtDNI.Text = medico.getDni();
            txtNombre.Text = medico.getNombre();
            txtApellido.Text = medico.getApellido();
            rblSexo.SelectedValue = medico.getSexo().Trim();
            txtNacionalidad.Text = medico.getNacionalidad();
            txtFechaDeNacimiento.Text = medico.getFechaNacimiento().ToString("yyyy-MM-dd");
            txtDireccion.Text = medico.getDireccion();
            ddlEspecialidad.SelectedValue = medico.getEspecialidad().getIdEspecialidad();
            ddlProvincia.SelectedValue = medico.getProvincia().getIdProvincia();
            txtCorreoElectronico.Text = medico.getCorreoElectronico();
            txtTelefono.Text = medico.getTelefono();

            CargarddlLocalidades();
            ddlLocalidad.SelectedValue = medico.getLocalidad().getIdLocalidad();

            txtNombreDeUsuario.Text = medico.getUsuario();
            txtContrasenia.Text = medico.getContrasenia();
            txtContrasenia.Attributes["value"] = medico.getContrasenia();
        }
        private void LimpiarCampos()
        {
            lblLegajoEncontrado.Text = string.Empty;
            txtDNI.Text = string.Empty;
            txtNombre.Text = string.Empty;
            txtApellido.Text = string.Empty;
            txtDireccion.Text = string.Empty;
            txtCorreoElectronico.Text = string.Empty;
            txtFechaDeNacimiento.Text = string.Empty;
            ddlHorarioDeEntrada.SelectedIndex = 0;
            ddlHorarioDeSalida.SelectedIndex = 0;
            txtNombreDeUsuario.Text = string.Empty;
            txtContrasenia.Text = string.Empty;
            txtNacionalidad.Text = string.Empty;
            txtTelefono.Text = string.Empty;
            rblSexo.ClearSelection();
            cblDiasLaborales.ClearSelection();
        }

        private void CargarHorarioYDias(string legajo)
        {
            HorarioMedico horario = new HorarioMedico();
            horario.setLegajo(legajo);
            horario = horarioMedicoNeg.TraerHorarios(horario);

            ddlHorarioDeEntrada.SelectedValue = TimeSpan.Parse(horario.getHoraInicio()).ToString(@"hh\:mm");/// chequear aca

            ddlHorarioDeSalida.SelectedValue = TimeSpan.Parse(horario.getHoraFin()).ToString(@"hh\:mm"); /// aca tambien

            List<string> dias = horarioMedicoNeg.TraerDiasLaborales(new List<string>(), legajo);

            foreach (ListItem item in cblDiasLaborales.Items)
                item.Selected = dias.Contains(item.Value);
        }

        protected void ddlProvincia_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarddlLocalidades();
        }

        //------------------------------> ENVIO DE DATOS DEL FORMULARIO <--------------------------------
        protected void btnModificar_Click(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsValid) return;

                Medico medico = ConstruirMedicoDesdeCampos();

                string mensaje;
                if (!medicoNeg.ValidarCamposUnicos(medico, out mensaje))
                {
                    lblMensaje.Text = mensaje;
                    return;
                }
                if (!ValidarDiasLaborales())
                {
                    return;
                }
                if (!ValidarHorarios())
                {
                    return;
                }
                ActualizarDiasLaborales(medico.getLegajo());

                if (medicoNeg.ModificarMedico(medico))
                {
                    lblMensaje.Text = "Datos enviados exitosamente";
                    LimpiarCampos();
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }
        private Medico ConstruirMedicoDesdeCampos()
        {
            Medico medico = new Medico();
            medico.setLegajo(lblLegajoEncontrado.Text.Trim());
            medico.setDni(txtDNI.Text.Trim());
            medico.setNombre(txtNombre.Text.Trim());
            medico.setApellido(txtApellido.Text.Trim());
            medico.setSexo(rblSexo.SelectedValue);
            medico.setNacionalidad(txtNacionalidad.Text.Trim());
            medico.setFechaNacimiento(Convert.ToDateTime(txtFechaDeNacimiento.Text));
            medico.setDireccion(txtDireccion.Text.Trim());
            medico.setCorreoElectronico(txtCorreoElectronico.Text.Trim());
            medico.setUsuario(txtNombreDeUsuario.Text.Trim());
            medico.setContrasenia(txtContrasenia.Text.Trim());
            medico.setTelefono(txtTelefono.Text.Trim());

            medico.setLocalidad(new Localidad());
            medico.getLocalidad().setIdLocalidad(ddlLocalidad.SelectedValue);

            medico.setProvincia(new Provincia());
            medico.getProvincia().setIdProvincia(ddlProvincia.SelectedValue);

            medico.setEspecialidad(new Especialidad());
            medico.getEspecialidad().setIdEspecialidad(ddlEspecialidad.SelectedValue);

            return medico;
        }
        private void ActualizarDiasLaborales(string legajo)
        {
            // Borrar todo
            horarioMedicoNeg.EliminarDiasPorLegajo(legajo);

            // Volver a crear según los dias seleccionados
            foreach (ListItem item in cblDiasLaborales.Items)
            {
                if (item.Selected)
                {
                    HorarioMedico horario = new HorarioMedico(
                        legajo,
                        item.Value,
                        ddlHorarioDeEntrada.SelectedValue,
                        ddlHorarioDeSalida.SelectedValue
                    );
                    horarioMedicoNeg.AgregarHorario(horario);
                }
            }
        }
        protected bool ValidarDiasLaborales()
        {
            foreach (ListItem item in cblDiasLaborales.Items)
            {
                if (item.Selected)
                    return true;
            }

            lblMensaje.Text += "Debe seleccionar al menos un día laboral.";
            return false;
        }
        protected bool ValidarHorarios()
        {
            TimeSpan horarioEntrada = TimeSpan.Parse(ddlHorarioDeEntrada.SelectedValue);
            TimeSpan horarioSalidad = TimeSpan.Parse(ddlHorarioDeSalida.SelectedValue);

            if (horarioEntrada == horarioSalidad)
            {
                lblMensaje.Text = "El horario de entrada y salida no pueden ser iguales.";
                return false;
            }

            if (horarioSalidad < horarioEntrada)
            {
                horarioSalidad += TimeSpan.FromHours(24);
            }

            TimeSpan duracionDeJornada = horarioSalidad - horarioEntrada;

            if (duracionDeJornada <= TimeSpan.FromHours(8))
            {
                return true;
            }

            lblMensaje.Text = "El turno no puede durar más de 8 horas.";
            return false;
        }
    }
}