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
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    HorarioNegocio negocio = new HorarioNegocio();
                    Session.Add("listaHorarios", negocio.listarConSP());
                    dgvHorarios.DataSource = Session["listaHorarios"];
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

        protected void btnBuscarRapido_Click(object sender, EventArgs e)
        {
            List<Horario> listaFiltrada = ((List<Horario>)Session["listaHorarios"]);
            listaFiltrada = listaFiltrada.FindAll(x => x.Dia.Nombre.ToUpper().Contains(txtFiltro.Text.ToUpper()));
            if (ddlEstado.SelectedItem.ToString() == "Activo")
            {
                listaFiltrada = listaFiltrada.FindAll(x => x.Activo);
            }
            else if (ddlEstado.SelectedItem.ToString() == "Inactivo")
            {
                listaFiltrada = listaFiltrada.FindAll(x => !x.Activo);
            }
            dgvHorarios.DataSource = listaFiltrada;
            dgvHorarios.DataBind();
        }
    }
}