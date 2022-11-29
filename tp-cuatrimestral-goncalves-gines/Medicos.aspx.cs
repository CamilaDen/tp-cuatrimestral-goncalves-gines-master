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
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!(Seguridad.esAdmin(Session["usuario"]) || Seguridad.esRecepcionista(Session["usuario"])))
                {
                    Session.Add("error", "Se requiere permisos de admin o recepcionista para acceder a esta página");
                    Response.Redirect("Error.aspx", false);
                }
                if (!IsPostBack)
                {
                    MedicoNegocio negocio = new MedicoNegocio();
                    Session.Add("listaMedicos", negocio.listarConSP());
                    dgvMedicos.DataSource = Session["listaMedicos"];
                    dgvMedicos.DataBind();
                    ddlCriterio.Items.Add("Contiene");
                    ddlCriterio.Items.Add("Comienza con");
                    ddlCriterio.Items.Add("Termina con");
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx", false);
        }

        protected void btnCrear_Click(object sender, EventArgs e)
        {
            Response.Redirect("ABMMedicos.aspx", false);
        }

        protected void dgvMedicos_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = dgvMedicos.SelectedDataKey.Value.ToString();
            Response.Redirect("ABMMedicos.aspx?id=" + id, false);
        }

        protected void chkFiltroAvanzado_CheckedChanged(object sender, EventArgs e)
        {
            txtFiltro.Enabled = !chkFiltroAvanzado.Checked;
            txtFiltro.Text = "";
            ddlEstado.Enabled = !chkFiltroAvanzado.Checked;
            ddlEstado.Text = "Todos";
            btnBuscarRapido.Visible = !chkFiltroAvanzado.Checked;
        }
        protected void ddlCampo_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlCriterio.Items.Clear();
            txtFiltroAvanzado.Text = "";
            switch (ddlCampo.SelectedItem.ToString())
            {
                case "DNI":
                    ddlCriterio.Items.Add("Igual a");
                    ddlCriterio.Items.Add("Mayor a");
                    ddlCriterio.Items.Add("Menor a");
                    txtFiltroAvanzado.TextMode = TextBoxMode.Number;
                    txtFiltroAvanzado.Attributes["required"] = "true";
                    break;
                case "Fecha de Nacimiento":
                    ddlCriterio.Items.Add("Igual a");
                    ddlCriterio.Items.Add("Mayor a");
                    ddlCriterio.Items.Add("Menor a");
                    txtFiltroAvanzado.TextMode = TextBoxMode.Date;
                    txtFiltroAvanzado.Attributes["required"] = "true";
                    break;
                default:
                    ddlCriterio.Items.Add("Contiene");
                    ddlCriterio.Items.Add("Comienza con");
                    ddlCriterio.Items.Add("Termina con");
                    txtFiltroAvanzado.TextMode = TextBoxMode.SingleLine;
                    txtFiltroAvanzado.Attributes.Clear();
                    break;
            }

        }

        protected void btnBuscarRapido_Click(object sender, EventArgs e)
        {
            List<Medico> listaFiltrada = ((List<Medico>)Session["listaMedicos"]);
            listaFiltrada = listaFiltrada.FindAll(x => x.Nombre.ToUpper().Contains(txtFiltro.Text.ToUpper()) || x.Apellido.ToUpper().Contains(txtFiltro.Text.ToUpper()));
            if (ddlEstado.SelectedItem.ToString() == "Activo")
            {
                listaFiltrada = listaFiltrada.FindAll(x => x.Activo);
            }
            else if (ddlEstado.SelectedItem.ToString() == "Inactivo")
            {
                listaFiltrada = listaFiltrada.FindAll(x => !x.Activo);
            }
            dgvMedicos.DataSource = listaFiltrada;
            dgvMedicos.DataBind();
        }

        protected void btnBuscarAvanzado_Click(object sender, EventArgs e)
        {
            string campo = ddlCampo.SelectedItem.ToString();
            string criterio = ddlCriterio.SelectedItem.ToString();
            List<Medico> listaFiltrada = ((List<Medico>)Session["listaMedicos"]);
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
                case "Apellido":
                    switch (criterio)
                    {
                        case ("Contiene"):
                            listaFiltrada = listaFiltrada.FindAll(x => x.Apellido.ToUpper().Contains(txtFiltroAvanzado.Text.ToUpper()));
                            break;
                        case ("Comienza con"):
                            listaFiltrada = listaFiltrada.FindAll(x => x.Apellido.ToUpper().StartsWith(txtFiltroAvanzado.Text.ToUpper()));
                            break;
                        case ("Termina con"):
                            listaFiltrada = listaFiltrada.FindAll(x => x.Apellido.ToUpper().EndsWith(txtFiltroAvanzado.Text.ToUpper()));
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
                case "Matrícula":
                    switch (criterio)
                    {
                        case ("Contiene"):
                            listaFiltrada = listaFiltrada.FindAll(x => x.Matricula.ToUpper().Contains(txtFiltroAvanzado.Text.ToUpper()));
                            break;
                        case ("Comienza con"):
                            listaFiltrada = listaFiltrada.FindAll(x => x.Matricula.ToUpper().StartsWith(txtFiltroAvanzado.Text.ToUpper()));
                            break;
                        case ("Termina con"):
                            listaFiltrada = listaFiltrada.FindAll(x => x.Matricula.ToUpper().EndsWith(txtFiltroAvanzado.Text.ToUpper()));
                            break;
                    }
                    break;
                case "DNI":
                    switch (criterio)
                    {
                        case ("Igual a"):
                            listaFiltrada = listaFiltrada.FindAll(x => x.Dni == int.Parse(txtFiltroAvanzado.Text));
                            break;
                        case ("Mayor a"):
                            listaFiltrada = listaFiltrada.FindAll(x => x.Dni > int.Parse(txtFiltroAvanzado.Text));
                            break;
                        case ("Menor a"):
                            listaFiltrada = listaFiltrada.FindAll(x => x.Dni < int.Parse(txtFiltroAvanzado.Text));
                            break;
                    }
                    break;
                case "Fecha de Nacimiento":
                    switch (criterio)
                    {
                        case ("Igual a"):
                            listaFiltrada = listaFiltrada.FindAll(x => x.FechaDeNacimiento == DateTime.Parse(txtFiltroAvanzado.Text));
                            break;
                        case ("Mayor a"):
                            listaFiltrada = listaFiltrada.FindAll(x => x.FechaDeNacimiento > DateTime.Parse(txtFiltroAvanzado.Text));
                            break;
                        case ("Menor a"):
                            listaFiltrada = listaFiltrada.FindAll(x => x.FechaDeNacimiento < DateTime.Parse(txtFiltroAvanzado.Text));
                            break;
                    }
                    break;
                default:
                    break;
            }
            dgvMedicos.DataSource = listaFiltrada;
            dgvMedicos.DataBind();
        }

    
    }
}