using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace tp_cuatrimestral_goncalves_gines
{
    public partial class Especialidades : System.Web.UI.Page
    {
        public List<Especialidad> ListaEspecialidad { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            EspecialidadNegocio negocio = new EspecialidadNegocio();
            ListaEspecialidad = negocio.listarConSP();
            try
            {
                if (!IsPostBack)
                {
                    dgvEspecialidades.DataSource = ListaEspecialidad;
                    dgvEspecialidades.DataBind();
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