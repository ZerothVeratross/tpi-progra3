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
    public partial class RecuperarContraseña : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (!IsPostBack)
                deshabilitarTextBox();
        }
        private void deshabilitarTextBox()
        {
            txtEnviarCodigo.Enabled = false;
            btnIngresarCodigo.Enabled = false;
            txtContrasenia.Enabled = false;
            txtRepetirContrasenia.Enabled = false;
            btnGuardar.Enabled = false;
        }

        protected void btnEnviarCodigo_Click(object sender, EventArgs e)
        {
            try
            {
                MedicoNegocio medicoNegocio = new MedicoNegocio();
                Medico medico = new Medico();
                if (medicoNegocio.VerificarCorreo(txtEmail.Text.Trim(), medico))
                {
                    btnEnviarCodigo.Enabled = false;
                    txtEmail.Enabled = false;
                    txtEnviarCodigo.Enabled = true;
                    btnIngresarCodigo.Enabled = true;
                    lblMensaje.Text = "Se envio el codigo a su email.";

                    int codigo = medicoNegocio.EnviarCodigo(txtEmail.Text.Trim());
                    Session["CodigoEnviado"] = codigo;
                    Session.Add("Medico", medico);
                }
                else
                {
                    lblMensaje.Text = "El email no esta registrado en el sistema.";
                }
            }
            catch (Exception ex)
            {

                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
            
        }

        protected void btnIngresarCodigo_Click(object sender, EventArgs e)
        {
            int codigo = (int)Session["CodigoEnviado"];
            if (codigo == Convert.ToInt32(txtEnviarCodigo.Text.Trim()))
            {
                txtContrasenia.Enabled = true;
                txtRepetirContrasenia.Enabled = true;
                btnGuardar.Enabled = true;
                txtEnviarCodigo.Enabled = false;
                btnIngresarCodigo.Enabled = false;
            }
            else
            {
                lblMensaje.Text = "El codigo no coincide con el enviado al email.";
                txtEnviarCodigo.Text = string.Empty;
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                MedicoNegocio medicoNegocio = new MedicoNegocio();
                Medico medico = (Medico)Session["Medico"];
                if (txtContrasenia.Text.Trim() == txtRepetirContrasenia.Text.Trim())
                {
                    if (medicoNegocio.CambiarContrasenia(txtContrasenia.Text.Trim(), medico))
                    {
                        lblMensaje.Text = "Contraseña cambiada con exito.";
                        txtContrasenia.Text = string.Empty;
                        txtRepetirContrasenia.Text = string.Empty;
                        txtContrasenia.Enabled = false;
                        txtRepetirContrasenia.Enabled = false;
                        btnGuardar.Enabled = false;
                        Response.Redirect("Login.aspx", false);
                    }
                    else
                    {
                        lblMensaje.Text = "No se pudo cambiar la contraseña.";
                        txtContrasenia.Text = string.Empty;
                        txtRepetirContrasenia.Text = string.Empty;
                    }
                }
                else
                {
                    lblMensaje.Text = "Las contraseñas ingresadas no coinciden.";
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
            
        }
    }
}