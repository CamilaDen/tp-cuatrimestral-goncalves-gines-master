using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocio;
using dominio;

namespace tp_cuatrimestral_goncalves_gines
{
    public partial class Cobertura : System.Web.UI.Page
    {
        public List<ObraSocial> ListaObraSocial { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            ObraSocialNegocio negocio = new ObraSocialNegocio();
            ListaObraSocial = negocio.listarConSP();
            try
            {
                if (!IsPostBack)
                {
                    dgvCoberturas.DataSource = ListaObraSocial;
                    dgvCoberturas.DataBind();
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
    }
}