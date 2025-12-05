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
    public partial class WebForm1 : System.Web.UI.Page
    {
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
            btnCerrar.Visible = false;
            btnConfirmar.Visible = false;
        }

        protected void btnDarBaja_Click(object sender, EventArgs e)
        {
            try
            {
                string dniIngresado = txtDNI.Text.Trim();

                LimpiarLabels();
                if (string.IsNullOrEmpty(dniIngresado))
                {
                    lblMensajeError.Text = "No se ingresó ningún DNI.";
                    txtDNI.Text = string.Empty;
                    return;
                }

                PacienteNegocio pacienteNegocio = new PacienteNegocio();
                DataTable paciente = pacienteNegocio.CargarPacienteBaja(dniIngresado);
                if (paciente.Rows.Count == 0)
                {
                    lblMensajeError.Text = "No existe un paciente con ese DNI.";
                    txtDNI.Text = string.Empty;
                    return;
                }
                string estado = paciente.Rows[0]["Estado"].ToString();
                if (estado == "No Activo")
                {
                    lblMensajeError.Text = "El paciente ya está dado de baja.";
                }
                else
                {
                    lblMensaje.Text = "¿Está seguro que desea dar de baja el paciente?";
                    gvPacienteABorrar.Visible = true;
                    gvPacienteABorrar.DataSource = paciente;
                    gvPacienteABorrar.DataBind();
                    btnCerrar.Visible = true;
                    btnConfirmar.Visible = true;
                    btnDarBaja.Enabled = false;
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            try
            {
                string dniIngresado = txtDNI.Text.Trim();
                Paciente paciente = new Paciente();
                paciente.setDni(dniIngresado);

                PacienteNegocio pacienteNegocio = new PacienteNegocio();

                LimpiarLabels();
                if (pacienteNegocio.BajaPaciente(paciente))
                {
                    lblMensajeConfirmacion.Text = "Paciente dado de baja correctamente.";
                    gvPacienteABorrar.Visible = false;
                    txtDNI.Text = string.Empty;
                }
                else
                {
                    lblMensajeError.Text = "No se pudo eliminar el paciente.";
                    txtDNI.Text = string.Empty;
                }
                btnDarBaja.Enabled = true;
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }

        protected void btnCerrar_Click(object sender, EventArgs e)
        {
            gvPacienteABorrar.Visible = false;
            btnCerrar.Visible = false;
            btnConfirmar.Visible = false;
            txtDNI.Text = string.Empty;
            LimpiarLabels();
            btnDarBaja.Enabled = true;
        }

        private void LimpiarLabels()
        {
            lblMensaje.Text = string.Empty;
            lblMensajeConfirmacion.Text = string.Empty;
            lblMensajeError.Text = string.Empty;
        }
    }
}