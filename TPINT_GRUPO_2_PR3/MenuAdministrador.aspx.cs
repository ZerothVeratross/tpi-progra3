using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPINT_GRUPO_2_PR3
{
    public partial class MenuAdministrador : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((bool)Session["EsAdmin"] == false)
            {
                Response.Redirect("Error.aspx");
            }
            
        }
    }
}