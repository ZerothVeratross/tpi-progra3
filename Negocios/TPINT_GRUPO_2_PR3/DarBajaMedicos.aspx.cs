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
    public partial class DarBajaMedico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["EsAdmin"] == null || (bool)Session["EsAdmin"] == false)
            {
                Session.Add("Error", "No tiene los permisos necesarios para acceder a esta página.");
                Response.Redirect("Error.aspx");
            }
        }

        protected void btnBuscarMedico_Click(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsValid)
                {
                    ///lblMensaje.Text = "Ingrese un DNI válido (solo números).";
                    LimpiarGV();
                    OcultarBotones();
                    return;
                }
                string dni = txtDNI.Text.Trim();

                if (!string.IsNullOrWhiteSpace(dni))
                {
                    MedicoNegocio medicoNegocio = new MedicoNegocio();
                    DataTable dataTable = medicoNegocio.BuscarMedicoTabla(dni);
                    if (dataTable.Rows.Count > 0)
                    {
                        int estado = Convert.ToInt32(dataTable.Rows[0]["Estado"]);
                        if (estado == 1)
                        {
                            gvEliminarMedico.DataSource = dataTable;
                            gvEliminarMedico.DataBind();
                            btnEliminar.Visible = true;
                            lblMensaje.Text = string.Empty;
                        }
                        else
                        {
                            lblMensaje.Text = "Este medico no esta Activo";
                        }
                    }
                    else
                    {
                        lblMensaje.Text = "No existe un Medico con ese DNI";
                        LimpiarGV();
                        OcultarBotones();
                    }
                }
                else
                {
                    lblMensaje.Text = "Ingrese un numero";
                    LimpiarGV();
                    OcultarBotones();
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
            
        }
        private void LimpiarGV()
        {
            gvEliminarMedico.DataSource = null;
            gvEliminarMedico.DataBind();
        }
        private void OcultarBotones()
        {
            btnEliminar.Visible = false;
            btnCancelar.Visible = false;
            btnConfirmar.Visible = false;
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            btnCancelar.Visible = true;
            btnConfirmar.Visible = true;
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            lblMensaje.Text = "Eliminacion cancelada";
            LimpiarGV();
            OcultarBotones();
        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            try
            {
                string dni = txtDNI.Text.Trim();
                MedicoNegocio medicoNegocio = new MedicoNegocio();
                if (medicoNegocio.BajaLogicaMedico(dni) == true)
                {
                    txtDNI.Text = string.Empty;
                    lblMensaje.Text = "Medico eliminado con exito";
                    LimpiarGV();
                    OcultarBotones();
                }
                else
                {
                    lblMensaje.Text = "Hubo un error con la eliminacion del medico";
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