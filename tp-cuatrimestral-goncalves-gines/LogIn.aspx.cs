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
                //dgvPacientes.DataSource = ListaPaciente;
                DataBind();
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            Usuario usuario;
            UsuarioNegocio negocio = new UsuarioNegocio();

            try
            {
                usuario = new Usuario(txtLogin.Text, txtPassword.Text, false);
                if(negocio.Loguear(usuario)) {
                    Session.Add("usuario", usuario);
                    Response.Redirect("Login.aspx");
                }
                else {
                    Session.Add("error", "user o pass incorrectos");
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