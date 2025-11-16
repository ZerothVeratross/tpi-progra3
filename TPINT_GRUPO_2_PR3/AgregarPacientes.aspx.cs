using Entidades;
using Negocios;
using System;
using System.Collections.Generic;
using System.Diagnostics.Eventing.Reader;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPINT_GRUPO_2_PR3
{
    public partial class AgregarPacientes : System.Web.UI.Page
    {

        ProvinciaNegocio negocioP = new ProvinciaNegocio();
        LocalidadNegocio negocioL = new LocalidadNegocio();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["EsAdmin"] == null || (bool)Session["EsAdmin"] == false)
            {
                Session.Add("Error", "No tiene los permisos necesarios para acceder a esta página.");
                Response.Redirect("Error.aspx");
            }

            if (!IsPostBack)
            {
                ddlProvincia.DataSource = negocioP.getTablaProvincia();
                ddlProvincia.DataTextField = "Descripcion_P";
                ddlProvincia.DataValueField = "Id_Provincia";
                ddlProvincia.DataBind();

                ddlProvincia.Items.Insert ( 0, new ListItem("--Seleccione Provincia--", "0"));
                ddlProvincia.SelectedIndex =0;
            }
        }

        protected void ddlProvincia_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlLocalidad.Items.Clear();

            if (ddlProvincia.SelectedValue != "0")
            {
                
               
                ddlLocalidad.DataSource = negocioL.getTablaLocalidad(ddlProvincia.SelectedValue);
                ddlLocalidad.DataTextField = "Descripcion_L";
                ddlLocalidad.DataValueField = "Id_Localidad";
                ddlLocalidad.DataBind();

                ddlLocalidad.Items.Insert(0, new ListItem("--Seleccione Localidad--", "0"));
                ddlLocalidad.SelectedIndex = 0;

            }
            else
            {
                ddlLocalidad.Items.Clear();
                ddlLocalidad.Items.Insert(0, new ListItem("--Seleccione Provincia Primero--", "0"));
                ddlLocalidad.SelectedIndex = 0;
            }
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)//Miguel: faltaria el try y catch
        {
            DateTime fechaNacimiento = DateTime.MinValue;

            if (AllValidaciones())
            {
                Paciente paciente = new Paciente();
                paciente.setDni(txtDNI.Text.Trim());
                paciente.setNombre(txtNombre.Text.Trim());
                paciente.setApellido(txtApellido.Text.Trim());
                paciente.setNacionalidad(txtNacionalidad.Text.Trim());
                paciente.setDireccion(txtDireccion.Text.Trim());
                paciente.setCorreoElectronico(txtCorreo.Text.Trim());
                paciente.setTelefono(txtTelefono.Text.Trim());
                if (rblSexo.SelectedIndex == 0)
                {
                    string sexo = "Mujer";
                    paciente.setSexo(sexo);
                }
                else
                {
                    string sexo = "Hombre";
                    paciente.setSexo(sexo);
                }
                DateTime.TryParse(txtFechaNacimiento.Text, out fechaNacimiento);
                paciente.setFechaNacimiento(fechaNacimiento);
                Localidad localidad = new Localidad();
                localidad.setIdLocalidad(ddlLocalidad.SelectedValue);
                paciente.setLocalidad(localidad);

                PacienteNegocio negocio = new PacienteNegocio();
                bool resultado = negocio.agregarPaciente(paciente);

                if (resultado)
                {
                    lblError.Text = "Paciente registrado exitosamente.";
                    LimpiarCampos();
                }
                else
                {
                    lblError.Text = "Error: El DNI ya se encuentra registrado en el sistema.";

                }

            }
            else
            {
                lblError.Text = "Por favor, revisa que todos los campos estén completos y tengan ingresos válidos.";
            }

        }

        private bool AllValidaciones() {

            DateTime fechaNacimiento = DateTime.MinValue;

            bool checkTextboxs = false;
            bool checkDDLs = false;
            bool checkRBL = false;
            bool checkFechaNac = false;


            if (validarIngresoNumerico(txtDNI.Text.Trim()) &&
                validarIngresoDeLetras(txtNombre.Text.Trim()) &&
                validarIngresoDeLetras(txtApellido.Text.Trim()) &&
                validarIngresoDeLetras(txtNacionalidad.Text.Trim()) &&
                validarIngresoDeLetrasConNumeros(txtDireccion.Text.Trim()) &&
                validarIngresoNumerico(txtTelefono.Text.Trim()) &&
                validarMail(txtCorreo.Text.Trim()))
            {
                checkTextboxs = true;
            }

            if (ddlProvincia.SelectedValue != "0" && ddlLocalidad.SelectedValue != "0")

            {
                checkDDLs = true;
            }

            if (rblSexo.SelectedIndex > -1)
            {
                checkRBL = true;
            }



            if (!string.IsNullOrEmpty(txtFechaNacimiento.Text) &&
                DateTime.TryParse(txtFechaNacimiento.Text, out fechaNacimiento) &&
                fechaNacimiento < DateTime.Today)
            {
                checkFechaNac = true;
            }

            if (checkFechaNac && checkDDLs && checkRBL && checkTextboxs)
            {
                return true;
            }

            else {
                return false;
            }
        }

        private void LimpiarCampos()
        {

            txtDNI.Text = "";
            txtNombre.Text = "";
            txtApellido.Text = "";
            txtNacionalidad.Text = "";
            txtDireccion.Text = "";
            txtCorreo.Text = "";
            txtTelefono.Text = "";
            ddlProvincia.SelectedIndex = 0;
            ddlLocalidad.SelectedIndex = 0;
            rblSexo.ClearSelection();
            txtFechaNacimiento.Text = "";

        }

        private bool validarMail(string email)
        {
            try
            {
                var addr = new System.Net.Mail.MailAddress(email);
                return addr.Address == email;
            }
            catch
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

        private bool validarIngresoDeLetras(string ingreso)
        {

            if (string.IsNullOrEmpty(ingreso) || !EsTexto(ingreso))
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        private bool validarIngresoDeLetrasConNumeros(string ingreso)
        {

            if (string.IsNullOrEmpty(ingreso) || !EsTextoConNumeros(ingreso))
            {
                return false;
            }
            else
            {
                return true;
            }
        }


        private bool EsTexto(string valor)
        {

            foreach (char caracter in valor)
            {
                if (!char.IsLetter(caracter) && !char.IsWhiteSpace(caracter))
                {
                    return false;
                }
            }
            return true;
        }

        private bool EsTextoConNumeros(string valor)
        {

            foreach (char caracter in valor)
            {
                if (!char.IsLetter(caracter) && !char.IsWhiteSpace(caracter) && !char.IsDigit(caracter))
                {
                    return false;
                }
            }
            return true;
        }
    }
}