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
    public partial class Horarios : System.Web.UI.Page
    {
        public List<Horario> ListaHorario { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            HorarioNegocio negocio = new HorarioNegocio();
            ListaHorario = negocio.listarConSP();
            try
            {
                if (!IsPostBack)
                {
                    dgvHorarios.DataSource = ListaHorario;
                    dgvHorarios.DataBind();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void dgvHorarios_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = dgvHorarios.SelectedDataKey.Value.ToString();
            Response.Redirect("ABMHorarios.aspx?id=" + id);
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void btnCrear_Click(object sender, EventArgs e)
        {
            Response.Redirect("ABMHorarios.aspx");
        }
    }
}