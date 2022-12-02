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
    public partial class CambiarPass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                EmailService emailService = new EmailService();
                UsuarioNegocio usuarioNegocio = new UsuarioNegocio();
                Usuario usuario = (Usuario)Session["usuario"];
                if( usuario.Password == txtPasswordOld.Text && txtPasswordNew1.Text == txtPasswordNew2.Text)
                {
                    string nuevaPass = txtPasswordNew1.Text;
                    usuarioNegocio.cambiarPass(usuario.Id, nuevaPass);
                    emailService.armarCorreo(usuario.Mail,"Password modificada", " Hola " + usuario.Nombre + usuario.Apellido + " tu nueva password es: " + nuevaPass);
                    emailService.enviarMail();
                    Response.Redirect("Login.aspx", false);
                }
            }
            catch (Exception ex) {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx", false);
        }
    }
}