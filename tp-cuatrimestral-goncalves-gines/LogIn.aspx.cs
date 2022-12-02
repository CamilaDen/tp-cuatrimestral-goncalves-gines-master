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
            try
            {
                UsuarioNegocio negocio = new UsuarioNegocio();
                Usuario usuario = new Usuario(txtMailLogin.Text, txtPassword.Text);
                if(negocio.Loguear(usuario)) {
                    Session.Add("usuario", usuario);
                    Response.Redirect("Default.aspx", false);
                }
                else {
                    Session.Add("error", "Usuario o contraseña incorrecto.");
                    Response.Redirect("Error.aspx", false);
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void bntOlvidar_Click(object sender, EventArgs e)
        {
            try
            {
                EmailService emailService = new EmailService();
                UsuarioNegocio usuarioNegocio = new UsuarioNegocio();
                Usuario usuario = usuarioNegocio.buscarPorMail(txtMailLogin.Text);
                if (usuario != null)
                {
                    string nuevaPass = Seguridad.reiniciarPass();
                    usuarioNegocio.cambiarPass(usuario.Id, nuevaPass);
                    emailService.armarCorreo(usuario.Mail, "Password reiniciada", " Hola " + usuario.Nombre + usuario.Apellido + " tu nueva password es: " + nuevaPass);
                    emailService.enviarMail();
                    Response.Redirect("Login.aspx", false);
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}