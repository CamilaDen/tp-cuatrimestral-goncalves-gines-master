using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocio;

namespace tp_cuatrimestral_goncalves_gines
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Seguridad.sesionActiva(Session["usuario"]))
                Response.Redirect("Login.aspx", false);

        }

        protected void btnDeslogear_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx", false);
        }

        protected void CambiarPass_Click(object sender, EventArgs e)
        {
            Response.Redirect("CambiarPass.aspx", false);
        }
    }
}