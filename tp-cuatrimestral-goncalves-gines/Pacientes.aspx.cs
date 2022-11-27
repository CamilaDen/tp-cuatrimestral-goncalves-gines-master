using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tp_cuatrimestral_goncalves_gines
{
    public partial class Pacientes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            try
            {
                if (!IsPostBack)
                {
                    PacienteNegocio negocio = new PacienteNegocio();
                    Session.Add("listaPacientes", negocio.listarConSP());
                    dgvPacientes.DataSource = Session["listaPacientes"];
                    dgvPacientes.DataBind();
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
            Response.Redirect("ABMPacientes.aspx");
        }

        protected void dgvPacientes_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = dgvPacientes.SelectedDataKey.Value.ToString();
            Response.Redirect("ABMPacientes.aspx?id=" + id);
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
                case "Peso":
                case "Altura":
                    ddlCriterio.Items.Add("Igual a");
                    ddlCriterio.Items.Add("Mayor a");
                    ddlCriterio.Items.Add("Menor a");
                    txtFiltroAvanzado.TextMode = TextBoxMode.Number;
                    btnBuscarAvanzado.Enabled = false;
                    break;
                case "Fecha de Nacimiento":
                    ddlCriterio.Items.Add("Igual a");
                    ddlCriterio.Items.Add("Mayor a");
                    ddlCriterio.Items.Add("Menor a");
                    txtFiltroAvanzado.TextMode = TextBoxMode.Date;
                    btnBuscarAvanzado.Enabled = false;
                    break;
                default:
                    ddlCriterio.Items.Add("Contiene");
                    ddlCriterio.Items.Add("Comienza con");
                    ddlCriterio.Items.Add("Termina con");
                    txtFiltroAvanzado.TextMode = TextBoxMode.SingleLine;
                    btnBuscarAvanzado.Enabled = true;
                    break;
            }

        }

        protected void btnBuscarRapido_Click(object sender, EventArgs e)
        {
            List<Paciente> listaFiltrada = ((List<Paciente>)Session["listaPacientes"]);
            listaFiltrada = listaFiltrada.FindAll(x => x.Nombre.ToUpper().Contains(txtFiltro.Text.ToUpper()) || x.Apellido.ToUpper().Contains(txtFiltro.Text.ToUpper()));
            if (ddlEstado.SelectedItem.ToString() == "Activo")
            {
                listaFiltrada = listaFiltrada.FindAll(x => x.Activo);
            }
            else if (ddlEstado.SelectedItem.ToString() == "Inactivo")
            {
                listaFiltrada = listaFiltrada.FindAll(x => !x.Activo);
            }
            dgvPacientes.DataSource = listaFiltrada;
            dgvPacientes.DataBind();
        }

        protected void txtFiltroAvanzado_TextChanged(object sender, EventArgs e)
        {
            string campo = ddlCampo.SelectedItem.ToString();
            if ((campo == "DNI" || campo == "Fecha de Nacimiento" || campo == "Peso" || campo == "Altura") && (txtFiltroAvanzado.Text == ""))
            {
                btnBuscarAvanzado.Enabled = false;
            }
            else
            {
                btnBuscarAvanzado.Enabled = true;
            }
        }

        protected void btnBuscarAvanzado_Click(object sender, EventArgs e)
        {
            string campo = ddlCampo.SelectedItem.ToString();
            string criterio = ddlCriterio.SelectedItem.ToString();
            List<Paciente> listaFiltrada = ((List<Paciente>)Session["listaPacientes"]);
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
                case "Credencial":
                    switch (criterio)
                    {
                        case ("Contiene"):
                            listaFiltrada = listaFiltrada.FindAll(x => x.Credencial.ToUpper().Contains(txtFiltroAvanzado.Text.ToUpper()));
                            break;
                        case ("Comienza con"):
                            listaFiltrada = listaFiltrada.FindAll(x => x.Credencial.ToUpper().StartsWith(txtFiltroAvanzado.Text.ToUpper()));
                            break;
                        case ("Termina con"):
                            listaFiltrada = listaFiltrada.FindAll(x => x.Credencial.ToUpper().EndsWith(txtFiltroAvanzado.Text.ToUpper()));
                            break;
                    }
                    break;
                case "Cobertura":
                    switch (criterio)
                    {
                        case ("Contiene"):
                            listaFiltrada = listaFiltrada.FindAll(x => x.ObraSocial.Nombre.ToUpper().Contains(txtFiltroAvanzado.Text.ToUpper()));
                            break;
                        case ("Comienza con"):
                            listaFiltrada = listaFiltrada.FindAll(x => x.ObraSocial.Nombre.ToUpper().StartsWith(txtFiltroAvanzado.Text.ToUpper()));
                            break;
                        case ("Termina con"):
                            listaFiltrada = listaFiltrada.FindAll(x => x.ObraSocial.Nombre.ToUpper().EndsWith(txtFiltroAvanzado.Text.ToUpper()));
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
                case "Peso":
                    switch (criterio)
                    {
                        case ("Igual a"):
                            listaFiltrada = listaFiltrada.FindAll(x => x.Peso == int.Parse(txtFiltroAvanzado.Text));
                            break;
                        case ("Mayor a"):
                            listaFiltrada = listaFiltrada.FindAll(x => x.Peso > int.Parse(txtFiltroAvanzado.Text));
                            break;
                        case ("Menor a"):
                            listaFiltrada = listaFiltrada.FindAll(x => x.Peso < int.Parse(txtFiltroAvanzado.Text));
                            break;
                    }
                    break;
                case "Altura":
                    switch (criterio)
                    {
                        case ("Igual a"):
                            listaFiltrada = listaFiltrada.FindAll(x => x.Altura == int.Parse(txtFiltroAvanzado.Text));
                            break;
                        case ("Mayor a"):
                            listaFiltrada = listaFiltrada.FindAll(x => x.Altura > int.Parse(txtFiltroAvanzado.Text));
                            break;
                        case ("Menor a"):
                            listaFiltrada = listaFiltrada.FindAll(x => x.Altura < int.Parse(txtFiltroAvanzado.Text));
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
            dgvPacientes.DataSource = listaFiltrada;
            dgvPacientes.DataBind();
        }

    }
}