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

        public List<Perfil> ListaPerfil { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            PerfilNegocio negocio = new PerfilNegocio();
            ListaPerfil = negocio.listarConSP();
            try
            {
                if (!IsPostBack)
                {
                    dgvPerfiles.DataSource = ListaPerfil;
                    dgvPerfiles.DataBind();
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {

        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void btnCrear_Click(object sender, EventArgs e)
        {
            Response.Redirect("ABMPerfiles.aspx");
        }
    }
}