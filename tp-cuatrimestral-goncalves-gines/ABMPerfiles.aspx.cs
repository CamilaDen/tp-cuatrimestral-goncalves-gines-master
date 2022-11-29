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
    public partial class ABMPerfil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Seguridad.esAdmin(Session["usuario"]))
            {
                Session.Add("error", "Se requiere permisos de admin para acceder a esta página");
                Response.Redirect("Error.aspx", false);
            }
            txtId.Enabled = false;
            btnActivacion.Visible = false;
            try
            {
                string id = Request.QueryString["id"] != null ? Request.QueryString["id"].ToString() : "";
                if (id != "" && !IsPostBack)
                {
                    PerfilNegocio negocio = new PerfilNegocio();
                    Perfil perfilSeleccionado = (negocio.listarConSP(id))[0];

                    txtId.Text = id;
                    txtNombre.Text = perfilSeleccionado.Nombre;

                    //Guardo en session para conocer luego el estado de activación o inactivación
                    Session.Add("PerfilSeleccionado", perfilSeleccionado);

                    if (!perfilSeleccionado.Activo)
                    {
                        btnActivacion.Text = "Reactivar";
                        btnActivacion.CssClass = "btn btn-warning";
                    }
                    btnActivacion.Visible = true;

                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Perfiles.aspx", false);
        }

        protected void btnActivacion_Click(object sender, EventArgs e)
        {
            try
            {
                PerfilNegocio negocio = new PerfilNegocio();
                Perfil seleccionada = (Perfil)Session["PerfilSeleccionado"];

                negocio.eliminarLogico(seleccionada.Id, !seleccionada.Activo);
                Response.Redirect("Perfiles.aspx", false);

            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                Perfil perfil = new Perfil();
                PerfilNegocio negocio = new PerfilNegocio();

                perfil.Nombre = txtNombre.Text;

                if (Request.QueryString["id"] != null)
                {
                    perfil.Id = int.Parse(txtId.Text);
                    negocio.modificar(perfil);
                }
                else negocio.agregar(perfil);
                Response.Redirect("Perfiles.aspx", false);
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}