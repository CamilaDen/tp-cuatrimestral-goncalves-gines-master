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
    public partial class Medicos : System.Web.UI.Page
    {
        public List<Medico> ListaMedico { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            MedicoNegocio negocio = new MedicoNegocio();
            ListaMedico = negocio.listarConSP();
            try
            {
                if (!IsPostBack)
                {
                    dgvMedicos.DataSource = ListaMedico;
                    dgvMedicos.DataBind();
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {

        }
    }
}