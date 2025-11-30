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
    public partial class AsignacionTurnos : System.Web.UI.Page
    {

        EspecialidadNegocio negocioE = new EspecialidadNegocio();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["EsAdmin"] == null || (bool)Session["EsAdmin"] == false)
            {
                Session.Add("Error", "No tiene los permisos necesarios para acceder a esta página.");
                Response.Redirect("Error.aspx");
            }
            if (!IsPostBack)
            {
                lblAdmin.Text = "Administrador: " + ((Administrador)Session["admin"]).getNombre() + " " + ((Administrador)Session["admin"]).getApellido();
            }

            if (!IsPostBack)
            {
                try
                {

                    ddlEspecialidad.DataSource = negocioE.getTablaEspecialidades();
                    ddlEspecialidad.DataTextField = "Descripcion_E";
                    ddlEspecialidad.DataValueField = "ID_Especialidad";
                    ddlEspecialidad.DataBind();

                    ddlEspecialidad.Items.Insert(0, new ListItem("--Seleccione Especialidad--", "0"));
                }
                catch (Exception ex)
                {
                    Session.Add("error", ex.ToString());
                    Response.Redirect("Error.aspx");
                }
            }

        }

        protected void btnRegistrarTurno_Click(object sender, EventArgs e)
        {
            LimpiarValidaciones();
            if (AllValidaciones())
            {
                try
                {
                    
                    TurnoNegocio negocio = new TurnoNegocio();
                    Turno nuevoTurno = new Turno();

                    nuevoTurno.ID = negocio.ObtenerProximoId();
                    nuevoTurno.Legajo = ddlMedico.SelectedValue;
                    nuevoTurno.DNI = txtDni.Text.Trim();
                    nuevoTurno.Fecha = CalendarFecha.SelectedDate;
                    nuevoTurno.Hora = ddlHorarios.SelectedValue;
                    nuevoTurno.Asistencia = "A confirmar";
                    nuevoTurno.Observaciones = "Diagnostico por realizar";
                    nuevoTurno.Estado = true;

                    bool resultado = negocio.RegistrarTurno(nuevoTurno);

                    if (resultado)
                    {
                        lblMensaje.Text = "Turno registrado exitosamente.";
                        LimpiarFormulario();
                        LimpiarValidaciones();
                    }
                    else
                    {
                        lblMensaje.Text = "Error al registrar el turno.";
                    }
                }
                catch (Exception ex)
                {
                    Session.Add("error", ex.ToString());
                    Response.Redirect("Error.aspx");
                }
            }
            else
            {
                lblMensaje.Text = "Algún dato está mal o el paciente no existe";
            }
        }

        private void LimpiarFormulario()
        {
            txtDni.Text = "";
            ddlEspecialidad.SelectedIndex = 0;
            CalendarFecha.SelectedDate = DateTime.MinValue;
            ddlHorarios.SelectedIndex = 0;
            ddlMedico.Items.Clear();
            ddlMedico.Items.Add(new ListItem("--Seleccione Médico--", "0"));
        }

        private void LimpiarValidaciones()
        {
            lblValidacionMedico.Text = string.Empty;
            lblValidacionHorario.Text = string.Empty;
            lblValidacionFecha.Text = string.Empty;
            lblValidacionEspecialidad.Text = string.Empty;
            lblValidacionDni.Text = string.Empty;

        }


        private bool AllValidaciones()

        {
            DateTime fechaTurno = CalendarFecha.SelectedDate;

            bool checkTextboxs = false;
            bool checkDDLs = false;
            bool checkFechaTurno = false;
            int contDDLs = 0;

            if (validarIngresoNumerico(txtDni.Text.Trim()))
            {
                PacienteNegocio negocio = new PacienteNegocio();
                if (negocio.existePaciente(txtDni.Text.Trim()))
                {
                    checkTextboxs = true;
                }
            }
            else { lblValidacionDni.Text = "*"; }
            if (fechaTurno >= DateTime.Today) {
                checkFechaTurno = true;
            }
            else { lblValidacionFecha.Text = "*"; }

            if (ddlEspecialidad.SelectedIndex != 0)
            {
                contDDLs++;
            }
            else { lblValidacionEspecialidad.Text = "*"; }

            if (ddlHorarios.SelectedIndex != 0)
            {
                contDDLs++;
            }
            else { lblValidacionHorario.Text = "*"; }

            if (ddlMedico.SelectedIndex != 0)
            {
                contDDLs++;
            }
            else {lblValidacionMedico.Text = "*"; }

            if (contDDLs == 3)
            {
                checkDDLs = true;
            }


            if (checkTextboxs == true && checkFechaTurno == true && checkDDLs == true)
            {
                return true;
            }
            else
            {
                return false;
            }

        }

        private bool validarIngresoNumerico(string ingreso)
        {

            if (string.IsNullOrEmpty(ingreso))
            {
                return false;
            }

            if (ingreso.Contains(".") || ingreso.Contains(",") || ingreso.Contains(" ") || ingreso.Contains("-"))
            {
                return false;
            }
            return ingreso.All(char.IsDigit);
        }

        protected void ddlHorarios_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEspecialidad.SelectedIndex == 0 || CalendarFecha.SelectedDate == DateTime.MinValue)
            {
                return;
            }

            TurnoNegocio negocio = new TurnoNegocio();
            DateTime fecha = CalendarFecha.SelectedDate;
            TimeSpan hora = TimeSpan.Parse(ddlHorarios.SelectedValue);

            var lista = negocio.ObtenerMedicosDisponibles(
                ddlEspecialidad.SelectedValue,
                fecha,
                hora
            );

            ddlMedico.Items.Clear();
            ddlMedico.Items.Add(new ListItem("--Seleccione Médico--", "0"));

            foreach (var medico in lista)
            {
                ListItem item = new ListItem(
                    medico.NombreCompleto.Trim(),
                    medico.Legajo.Trim()
                );
                ddlMedico.Items.Add(item);
            }
            ddlMedico.DataBind();
        }

        protected void ddlEspecialidad_SelectedIndexChanged(object sender, EventArgs e)
        {
            CalendarFecha.SelectedDate = DateTime.MinValue;
            ddlHorarios.SelectedIndex = 0;
            ddlMedico.Items.Clear();
            ddlMedico.Items.Add(new ListItem("--Seleccione Médico--", "0"));
        }

        protected void CalendarFecha_SelectionChanged(object sender, EventArgs e)
        {
            ddlHorarios.SelectedIndex = 0;
            ddlMedico.Items.Clear();
            ddlMedico.Items.Add(new ListItem("--Seleccione Médico--", "0"));
        }
    }

}