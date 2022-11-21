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
    public partial class Pacientes : System.Web.UI.Page
    {
        public List<Paciente> ListaPaciente { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            PacienteNegocio negocio = new PacienteNegocio();
            ListaPaciente = negocio.listarConSP();
            try
            {
                if (!IsPostBack)
                {
                    dgvPacientes.DataSource = ListaPaciente;
                    dgvPacientes.DataBind();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }


        protected void btnCrear_Click(object sender, EventArgs e)
        {
            Response.Redirect("ABMPacientes.aspx");
        }

        protected void dgvPacientes_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = dgvPacientes.SelectedDataKey.Value.ToString();
            Response.Redirect("ABMPacientes.aspx?id=" + id);
        }
    }
}