using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tp_cuatrimestral_goncalves_gines
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ( Session["usuario"] == null) {
                //Session.Add("error", "Debes loguearte para ingresar.");
                Response.Redirect("Login.aspx", false);
            }   
        }

        public bool validarPerfil() { 
            if ( Session["usuario"] != null && ((dominio.Usuario)Session["usuario"]).Perfil.Id == (int)dominio.TipoPerfil.ADMINISTRADOR)
            {

                return true;
            }
            return false;
        }


    }
}