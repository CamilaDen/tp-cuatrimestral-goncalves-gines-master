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
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    ObraSocialNegocio negocio = new ObraSocialNegocio();
                    Session.Add("listaObraSocial", negocio.listarConSP());
                    dgvCoberturas.DataSource = Session["listaObraSocial"];
                    dgvCoberturas.DataBind();
                    ddlCriterio.Items.Add("Contiene");
                    ddlCriterio.Items.Add("Comienza con");
                    ddlCriterio.Items.Add("Termina con");
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
            Response.Redirect("ABMCoberturas.aspx");
        }

        protected void dgvCoberturas_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = dgvCoberturas.SelectedDataKey.Value.ToString();
            Response.Redirect("ABMCoberturas.aspx?id=" + id);
        }

        protected void btnBuscarRapido_Click(object sender, EventArgs e)
        {
            List<ObraSocial> listaFiltrada = ((List<ObraSocial>)Session["listaObraSocial"]);
            listaFiltrada = listaFiltrada.FindAll(x => x.Nombre.ToUpper().Contains(txtFiltro.Text.ToUpper()));
            if (ddlEstado.SelectedItem.ToString() == "Activo")
            {
                listaFiltrada = listaFiltrada.FindAll(x => x.Activo);
            }
            else if (ddlEstado.SelectedItem.ToString() == "Inactivo")
            {
                listaFiltrada = listaFiltrada.FindAll(x => !x.Activo);
            }
            dgvCoberturas.DataSource = listaFiltrada;
            dgvCoberturas.DataBind();
        }

        protected void chkFiltroAvanzado_CheckedChanged(object sender, EventArgs e)
        {
            txtFiltro.Enabled = !chkFiltroAvanzado.Checked;
            txtFiltro.Text = "";
            ddlEstado.Enabled = !chkFiltroAvanzado.Checked;
            ddlEstado.Text = "Todos";
            btnBuscarRapido.Visible = !chkFiltroAvanzado.Checked;
        }

        protected void btnBuscarAvanzado_Click(object sender, EventArgs e)
        {

            string campo = ddlCampo.SelectedItem.ToString();
            string criterio = ddlCriterio.SelectedItem.ToString();
            List<ObraSocial> listaFiltrada = ((List<ObraSocial>)Session["listaObraSocial"]);
            switch (campo)
            {
                case "Nombre":
                    switch (criterio)
                    {
                        case ("Contiene"):
                            listaFiltrada = listaFiltrada.FindAll(x => x.Nombre.ToUpper().Contains(txtFiltroAvanzado.Text.ToUpper()));
                            break;
                        case ("Comienza con"):
                            listaFiltrada = listaFiltrada.FindAll(x => x.Nombre.ToUpper().StartsWith(txtFiltroAvanzado.Text.ToUpper()));
                            break;
                        case ("Termina con"):
                            listaFiltrada = listaFiltrada.FindAll(x => x.Nombre.ToUpper().EndsWith(txtFiltroAvanzado.Text.ToUpper()));
                            break;
                    }
                    break;
                case "Sigla":
                    switch (criterio)
                    {
                        case ("Contiene"):
                            listaFiltrada = listaFiltrada.FindAll(x => x.Sigla.ToUpper().Contains(txtFiltroAvanzado.Text.ToUpper()));
                            break;
                        case ("Comienza con"):
                            listaFiltrada = listaFiltrada.FindAll(x => x.Sigla.ToUpper().StartsWith(txtFiltroAvanzado.Text.ToUpper()));
                            break;
                        case ("Termina con"):
                            listaFiltrada = listaFiltrada.FindAll(x => x.Sigla.ToUpper().EndsWith(txtFiltroAvanzado.Text.ToUpper()));
                            break;
                    }
                    break;
                case "CUIT":
                    switch (criterio)
                    {
                        case ("Contiene"):
                            listaFiltrada = listaFiltrada.FindAll(x => x.Cuit.ToUpper().Contains(txtFiltroAvanzado.Text.ToUpper()));
                            break;
                        case ("Comienza con"):
                            listaFiltrada = listaFiltrada.FindAll(x => x.Cuit.ToUpper().StartsWith(txtFiltroAvanzado.Text.ToUpper()));
                            break;
                        case ("Termina con"):
                            listaFiltrada = listaFiltrada.FindAll(x => x.Cuit.ToUpper().EndsWith(txtFiltroAvanzado.Text.ToUpper()));
                            break;
                    }
                    break;
                case "Teléfono":
                    switch (criterio)
                    {
                        case ("Contiene"):
                            listaFiltrada = listaFiltrada.FindAll(x => x.Telefono.ToUpper().Contains(txtFiltroAvanzado.Text.ToUpper()));
                            break;
                        case ("Comienza con"):
                            listaFiltrada = listaFiltrada.FindAll(x => x.Telefono.ToUpper().StartsWith(txtFiltroAvanzado.Text.ToUpper()));
                            break;
                        case ("Termina con"):
                            listaFiltrada = listaFiltrada.FindAll(x => x.Telefono.ToUpper().EndsWith(txtFiltroAvanzado.Text.ToUpper()));
                            break;
                    }
                    break;
                case "Dirección":
                    switch (criterio)
                    {
                        case ("Contiene"):
                            listaFiltrada = listaFiltrada.FindAll(x => x.Direccion.ToUpper().Contains(txtFiltroAvanzado.Text.ToUpper()));
                            break;
                        case ("Comienza con"):
                            listaFiltrada = listaFiltrada.FindAll(x => x.Direccion.ToUpper().StartsWith(txtFiltroAvanzado.Text.ToUpper()));
                            break;
                        case ("Termina con"):
                            listaFiltrada = listaFiltrada.FindAll(x => x.Direccion.ToUpper().EndsWith(txtFiltroAvanzado.Text.ToUpper()));
                            break;
                    }
                    break;
                case "Mail":
                    switch (criterio)
                    {
                        case ("Contiene"):
                            listaFiltrada = listaFiltrada.FindAll(x => x.Mail.ToUpper().Contains(txtFiltroAvanzado.Text.ToUpper()));
                            break;
                        case ("Comienza con"):
                            listaFiltrada = listaFiltrada.FindAll(x => x.Mail.ToUpper().StartsWith(txtFiltroAvanzado.Text.ToUpper()));
                            break;
                        case ("Termina con"):
                            listaFiltrada = listaFiltrada.FindAll(x => x.Mail.ToUpper().EndsWith(txtFiltroAvanzado.Text.ToUpper()));
                            break;
                    }
                    break;
                default:
                    break;
            }
            dgvCoberturas.DataSource = listaFiltrada;
            dgvCoberturas.DataBind();
        }


    }

}