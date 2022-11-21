using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tp_cuatrimestral_goncalves_gines
{
    public partial class LogIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                DataBind();
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            Usuario usuario;
            UsuarioNegocio negocio = new UsuarioNegocio();

            try
            {
                usuario = new Usuario(txtLogin.Text, txtPassword.Text);
                if(negocio.Loguear(usuario)) {
                    Session.Add("usuario", usuario);
                    Response.Redirect("Default.aspx");
                }
                else {
                    Session.Add("error", "Usuario o contraseña incorrecto.");
                    Response.Redirect("Error.aspx");
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}