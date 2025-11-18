using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocios;

namespace TPINT_GRUPO_2_PR3
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            Medico medico = new Medico();

        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            try
            {
                bool EsAdmin = true;
                AdministradorNegocio administradorNegocio = new AdministradorNegocio();
                MedicoNegocio medicoNegocio = new MedicoNegocio();
                Administrador administrador = new Administrador(txtUsuario.Text.Trim(), txtContrasenia.Text.Trim());
                if (administradorNegocio.Login(administrador) == true)
                {
                    Session.Add("admin", administrador);
                    Session.Add("EsAdmin", EsAdmin);
                    Response.Redirect("MenuAdministrador.aspx", false);
                }
                else
                {
                    Medico medico = new Medico(txtUsuario.Text.Trim(), txtContrasenia.Text.Trim());
                    if (medicoNegocio.LoginMedico(medico) == true)
                    {
                        EsAdmin = false;
                        Session.Add("medico", medico);
                        Session.Add("EsAdmin", EsAdmin);
                        Response.Redirect("MenuMedico.aspx", false);
                    }
                    else
                    {
                        lblMensaje.Text = "Usuario y/o contraseña incorrecta";
                    }
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }
    }
}