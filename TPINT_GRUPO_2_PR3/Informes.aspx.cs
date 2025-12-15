using Entidades;
using Negocios;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPINT_GRUPO_2_PR3
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        TurnoNegocio negocioT = new TurnoNegocio();
        LocalidadNegocio negocioL = new LocalidadNegocio();
        HorarioMedicoNegocio negocioHM = new HorarioMedicoNegocio();
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
                lblNombreAdministrador.Text = "Administrador: " + ((Administrador)Session["admin"]).getNombre() + " " + ((Administrador)Session["admin"]).getApellido();
            }
        }

        protected void ddlInforme_SelectedIndexChanged(object sender, EventArgs e)
        {
            switch (Convert.ToInt32(ddlInforme.SelectedValue))
            {
                case 0: //sin eleccion
                    OrganizarControles(false, false, 0);
                    break;

                case 1: //reporte de asistencias a turnos
                    OrganizarControles(true, true, 0);
                    break;

                case 2: //informe de pacientes por localidad
                    OrganizarControles(true, false, 1);
                    break;

                case 3: //informe de disponibilidad de médicos
                    OrganizarControles(true, false, 2);
                    break;

                case 4: //reporte de turnos por especialidad
                    OrganizarControles(true, true, 0);
                    break;

                case 5: //reporte de turnos por medico
                    OrganizarControles(true, true, 0);
                    break;

                default:
                    OrganizarControles(true, false, 0);
                    break;
            }
        }

        protected void OrganizarControles(bool vaciarTabla, bool mostrarFechas, int tipoCBL)
        {
            if (vaciarTabla)
            {
                gvInforme.DataSource = null;
                gvInforme.DataBind();
                lblMensaje.Text = string.Empty;
                lblMensaje.ForeColor = Color.Black;
            }
            
            txtFechaMenor.Visible = mostrarFechas;
            txtFechaMayor.Visible = mostrarFechas;
            lblSeparador.Visible = mostrarFechas;
            txtFechaMenor.Text = string.Empty;
            txtFechaMayor.Text = string.Empty;

            switch (tipoCBL)
            {
                case 1: //Localidades
                    cblOpciones.DataSource = negocioL.GetLocalidades();
                    cblOpciones.DataTextField = "Descripcion_L";
                    cblOpciones.DataValueField = "Descripcion_L";
                    cblOpciones.Visible = true;
                    break;
                case 2: //Especialidades
                    cblOpciones.DataSource = negocioE.getTablaEspecialidades();
                    cblOpciones.DataTextField = "Descripcion_E";
                    cblOpciones.DataValueField = "Descripcion_E";
                    cblOpciones.Visible = true;
                    break;

                default:
                    cblOpciones.DataSource = null;
                    cblOpciones.Visible = false;
                    break;
            }

            cblOpciones.DataBind();
            cblOpciones.Items.Insert(0, new ListItem("Todos", "0"));
        }

        protected void btnInforme_Click(object sender, EventArgs e)
        {
            try
            {
                switch (Convert.ToInt32(ddlInforme.SelectedValue))
                {
                    case 0: //sin eleccion
                        lblMensaje.Text = "Seleccione un informe";
                        lblMensaje.ForeColor = Color.Black;
                        break;

                    case 1: //reporte de asistencias a turnos
                        if (!ValidarFechas()) { return; }
                        Session.Add("informe", negocioT.GenerarInformeAsistencia(txtFechaMenor.Text, txtFechaMayor.Text));
                        gvInforme.DataSource = Session["informe"];
                        ReportarFechas(txtFechaMenor.Text, txtFechaMayor.Text, "asistencia para los turnos");
                        break;

                    case 2: //informe de pacientes por localidad
                        if (!ValidarCBL()) { return; }
                        Session.Add("informe", negocioL.GenerarInforme(ConvertirListItemsAStrings(cblOpciones.Items)));
                        gvInforme.DataSource = Session["informe"];
                        gvInforme.DataBind();
                        lblMensaje.Text = "Informe de pacientes por localidad";
                        lblMensaje.ForeColor = Color.Black;
                        break;

                    case 3: //informe de disponibilidad de médicos
                        if (!ValidarCBL()) { return; }
                        Session.Add("informe", negocioHM.GenerarInforme(ConvertirListItemsAStrings(cblOpciones.Items)));
                        gvInforme.DataSource = Session["informe"];
                        gvInforme.DataBind();
                        lblMensaje.Text = "Informe de disponibilidad de médicos por día";
                        lblMensaje.ForeColor = Color.Black;
                        break;

                    case 4: //reporte de turnos por especialidad
                        if (!ValidarFechas()) { return; }
                        Session.Add("informe", negocioT.GenerarInformeEspecialidad(txtFechaMenor.Text, txtFechaMayor.Text));
                        gvInforme.DataSource = Session["informe"];
                        ReportarFechas(txtFechaMenor.Text, txtFechaMayor.Text, "especialidad para los turnos");
                        break;

                    case 5: //reporte de turnos por medico
                        if (!ValidarFechas()) { return; }
                        Session.Add("informe", negocioT.GenerarInformeMedico(txtFechaMenor.Text, txtFechaMayor.Text));
                        gvInforme.DataSource = Session["informe"];
                        ReportarFechas(txtFechaMenor.Text, txtFechaMayor.Text, "médico para los turnos");
                        break;

                    default:
                        lblMensaje.Text = "Seleccione un informe";
                        lblMensaje.ForeColor = Color.Black;
                        break;
            }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }

        protected void ReportarFechas(string fechaMenor, string fechaMayor, string reporte)
        {
            gvInforme.DataBind();

            if (fechaMenor.Length > 0)
            {
                if (fechaMayor.Length > 0)
                {
                    lblMensaje.Text = "Reporte de " + reporte + " entre las fechas " + fechaMenor + " y " + fechaMayor;
                }
                else { lblMensaje.Text = "Reporte de " + reporte + " desde la fecha " + fechaMenor; }
            }
            else if (fechaMayor.Length > 0) { lblMensaje.Text = "Reporte de " + reporte + " hasta la fecha " + fechaMayor; }
            else { lblMensaje.Text = "Reporte de " + reporte + " totales"; }
            lblMensaje.ForeColor = Color.Black;
        }

        protected bool ValidarFechas()
        {
            string fecha1 = txtFechaMenor.Text;
            string fecha2 = txtFechaMayor.Text;
            bool validado = true;

            if (fecha1.Length == 0 || fecha2.Length == 0) { return true; }

            int temp1 = Convert.ToInt32(fecha1.Substring(0, 4));
            int temp2 = Convert.ToInt32(fecha2.Substring(0, 4));

            validado = temp1 < temp2;

            if (!validado && temp1 == temp2)
            {
                temp1 = Convert.ToInt32(fecha1.Substring(5, 2));
                temp2 = Convert.ToInt32(fecha2.Substring(5, 2));
                validado = temp1 < temp2;
            }

            if (!validado && temp1 == temp2)
            {
                temp1 = Convert.ToInt32(fecha1.Substring(8, 2));
                temp2 = Convert.ToInt32(fecha2.Substring(8, 2));
                validado = temp1 <= temp2;
            }

            if (!validado)
            {
                lblMensaje.Text = "Rango de fechas inválido.";
                lblMensaje.ForeColor = Color.Red;
            }

            return validado;
        }

        protected bool ValidarCBL()
        {
            bool validado = false;
            foreach (ListItem item in cblOpciones.Items)
            {
                validado = item.Selected;
                if (validado) { break; }
            }

            if (!validado) {
                lblMensaje.Text = "Seleccione una o más opciones";
                lblMensaje.ForeColor = Color.Red;
            }

            return validado;
        }

        protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //la variable __EVENTTARGET contiene informacion sobre el ultimo evento disparado,
            //en el caso de una checkboxlist toma la forma "cblOpciones$<ultimo indice seleccionado del cbl>
            //por ejemplo "cblOpciones$0"
            //aqui se lo separa en dos strings en lugar de tomar el ultimo char por si el indice tiene mas de 1 digito
            string[] evento = Request.Form["__EVENTTARGET"].Split('$');
            int ultimoIndiceSeleccionado = Convert.ToInt32(evento[evento.Length - 1]);

            if (cblOpciones.Items[ultimoIndiceSeleccionado].Value == "0")
            {
                foreach (ListItem item in cblOpciones.Items)
                {
                    if (item.Value != "0")
                    {
                        item.Selected = false;
                    }
                }
            } else
            {
                cblOpciones.Items[0].Selected = false;
            }
        }

        protected string[] ConvertirListItemsAStrings(ListItemCollection items)
        {
            string[] strings = new string[items.Count];
            int i = 0;
            foreach (ListItem item in items)
            {
                if (item.Selected)
                {
                    strings[i] = item.Value;
                }
                else { strings[i] = string.Empty; }
                i++;
            }
            return strings;
        }

        protected void gvInforme_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvInforme.PageIndex = e.NewPageIndex;
            gvInforme.DataSource = Session["Informe"];
            gvInforme.DataBind();
        }
    }
}