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
    public partial class Perfiles : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Seguridad.esAdmin(Session["usuario"]))
                {
                    Session.Add("error", "Se requiere permisos de admin para acceder a esta página");
                    Response.Redirect("Error.aspx", false);
                }
                if (!IsPostBack)
                {
                    PerfilNegocio negocio = new PerfilNegocio();
                    Session.Add("listaPerfiles", negocio.listarConSP());
                    dgvPerfiles.DataSource = Session["listaPerfiles"];
                    dgvPerfiles.DataBind();
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
            Response.Redirect("Default.aspx", false);
        }

        protected void btnCrear_Click(object sender, EventArgs e)
        {
            Response.Redirect("ABMPerfiles.aspx", false);
        }

        protected void dgvPerfiles_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = dgvPerfiles.SelectedDataKey.Value.ToString();
            Response.Redirect("ABMPerfiles.aspx?id=" + id, false);
        }
        protected void btnBuscarRapido_Click(object sender, EventArgs e)
        {
            List<Perfil> listaFiltrada = ((List<Perfil>)Session["listaPerfiles"]);
            listaFiltrada = listaFiltrada.FindAll(x => x.Nombre.ToUpper().Contains(txtFiltro.Text.ToUpper()));
            if (ddlEstado.SelectedItem.ToString() == "Activo")
            {
                listaFiltrada = listaFiltrada.FindAll(x => x.Activo);
            }
            else if (ddlEstado.SelectedItem.ToString() == "Inactivo")
            {
                listaFiltrada = listaFiltrada.FindAll(x => !x.Activo);
            }
            dgvPerfiles.DataSource = listaFiltrada;
            dgvPerfiles.DataBind();
        }

    }
}