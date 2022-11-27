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
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    PersonaNegocio negocio = new PersonaNegocio();
                    Session.Add("listaPersonal", negocio.listarConSP());
                    dgvPersonal.DataSource = Session["listaPersonal"];
                    dgvPersonal.DataBind();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void dgvPersonal_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = dgvPersonal.SelectedDataKey.Value.ToString();
            Response.Redirect("ABMPersonal.aspx?id=" + id);
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void btnCrear_Click(object sender, EventArgs e)
        {
            Response.Redirect("ABMPersonal.aspx");
        }
        protected void btnBuscarRapido_Click(object sender, EventArgs e)
        {
            List<Persona> listaFiltrada = ((List<Persona>)Session["listaPersonal"]);
            listaFiltrada = listaFiltrada.FindAll(x => x.Nombre.ToUpper().Contains(txtFiltro.Text.ToUpper()));
            if (ddlEstado.SelectedItem.ToString() == "Activo")
            {
                listaFiltrada = listaFiltrada.FindAll(x => x.Activo);
            }
            else if (ddlEstado.SelectedItem.ToString() == "Inactivo")
            {
                listaFiltrada = listaFiltrada.FindAll(x => !x.Activo);
            }
            dgvPersonal.DataSource = listaFiltrada;
            dgvPersonal.DataBind();
        }
    }
}