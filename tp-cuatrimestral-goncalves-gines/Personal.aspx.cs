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
    public partial class Personal : System.Web.UI.Page
    {
        public List<Persona> ListaPersonal { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            PersonaNegocio negocio = new PersonaNegocio();
            ListaPersonal = negocio.listarConSP();
            try
            {
                if (!IsPostBack)
                {
                    dgvPersonal.DataSource = ListaPersonal;
                    dgvPersonal.DataBind();
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