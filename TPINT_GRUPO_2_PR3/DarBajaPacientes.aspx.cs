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
                lblUsuario.Text = "Administrador: " + ((Administrador)Session["admin"]).getNombre() + " " + ((Administrador)Session["admin"]).getApellido();
            }
            btnCerrar.Visible = false;
            btnConfirmar.Visible = false;
        }

        protected void btnDarBaja_Click(object sender, EventArgs e)
        {
            try
            {
                string dniIngresado = txtDNI.Text.Trim();

                if (string.IsNullOrEmpty(dniIngresado))
                {
                    lblMensaje.Text = "No se ingresó ningún DNI.";
                    txtDNI.Text = string.Empty;
                    return;
                }

                PacienteNegocio pacienteNegocio = new PacienteNegocio();
                DataTable paciente = pacienteNegocio.CargarPacienteBaja(dniIngresado);
                if (paciente.Rows.Count == 0)
                {
                    lblMensaje.Text = "No existe un paciente con ese DNI.";
                    txtDNI.Text = string.Empty;
                    return;
                }
                string estado = paciente.Rows[0]["Estado"].ToString();
                if (estado == "No Activo")
                {
                    lblMensaje.Text = "El paciente ya está dado de baja.";
                }
                else
                {
                    lblMensaje.Text = "¿Está seguro que desea dar de baja el paciente?";
                    gvPacienteABorrar.Visible = true;
                    gvPacienteABorrar.DataSource = paciente;
                    gvPacienteABorrar.DataBind();
                    btnCerrar.Visible = true;
                    btnConfirmar.Visible = true;
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

                if (pacienteNegocio.BajaPaciente(paciente))
                {
                    lblMensaje.Text = "Paciente dado de baja correctamente.";
                    gvPacienteABorrar.Visible = false;
                    txtDNI.Text = string.Empty;
                }
                else
                {
                    lblMensaje.Text = "No se pudo eliminar el paciente";
                    txtDNI.Text = string.Empty;
                }
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
            lblMensaje.Text = string.Empty;
        }
    }
}