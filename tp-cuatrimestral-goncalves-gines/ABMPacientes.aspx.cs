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
    public partial class ABMPacientes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!(Seguridad.esAdmin(Session["usuario"]) || Seguridad.esRecepcionista(Session["usuario"])))
            {
                Session.Add("error", "Se requiere permisos de admin o recepcionista para acceder a esta página");
                Response.Redirect("Error.aspx", false);
            }
            txtId.Enabled = false;
            btnActivacion.Visible = false;
            try
            {
                if (!IsPostBack)
                {

                    ObraSocialNegocio obraSocialNegocio = new ObraSocialNegocio();
                    ddlObraSocialCoberturas.DataSource = obraSocialNegocio.listarConSP();
                    ddlObraSocialCoberturas.DataTextField = "Nombre";
                    ddlObraSocialCoberturas.DataValueField = "Id";
                    ddlObraSocialCoberturas.DataBind();

                    string id = Request.QueryString["id"] != null ? Request.QueryString["id"].ToString() : "";
                    if (id != "")
                    {
                        PacienteNegocio negocio = new PacienteNegocio();
                        Paciente pacienteSeleccionado = (negocio.listarConSP(id))[0];

                        txtId.Text = id;
                        txtApellido.Text = pacienteSeleccionado.Apellido;
                        txtNombre.Text = pacienteSeleccionado.Nombre;
                        txtDNI.Text = pacienteSeleccionado.Dni.ToString();
                        txtFNacimiento.Text = pacienteSeleccionado.FechaDeNacimiento.ToString("yyyy-MM-dd");
                        txtMail.Text = pacienteSeleccionado.Mail;
                        txtPeso.Text = pacienteSeleccionado.Peso.ToString();
                        txtAltura.Text = pacienteSeleccionado.Altura.ToString();
                        txtCredencialPaciente.Text = pacienteSeleccionado.Credencial;
                        ddlObraSocialCoberturas.SelectedValue = pacienteSeleccionado.ObraSocial.Id.ToString();

                        //Guardo en session para conocer luego el estado de activación o inactivación
                        Session.Add("PacienteSeleccionado", pacienteSeleccionado);

                        if (!pacienteSeleccionado.Activo)
                        {
                            btnActivacion.Text = "Reactivar";
                            btnActivacion.CssClass = "btn btn-warning";
                        }
                        btnActivacion.Visible = true;

                    }
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
            Response.Redirect("Pacientes.aspx", false);
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                Paciente paciente = new Paciente();
                PacienteNegocio negocio = new PacienteNegocio();

                paciente.Apellido = txtApellido.Text;
                paciente.Nombre = txtNombre.Text;
                paciente.Dni = int.Parse(txtDNI.Text);
                paciente.Mail = txtMail.Text;
                paciente.FechaDeNacimiento = DateTime.Parse(txtFNacimiento.Text);
                paciente.Peso = decimal.Parse(txtPeso.Text);
                paciente.Altura = decimal.Parse(txtAltura.Text);
                paciente.Credencial = txtCredencialPaciente.Text;
                paciente.ObraSocial = new ObraSocial();
                paciente.ObraSocial.Id = int.Parse(ddlObraSocialCoberturas.SelectedValue);


                if (Request.QueryString["id"] != null)
                {
                    paciente.Id = int.Parse(txtId.Text);
                    negocio.modificar(paciente);
                }
                else negocio.agregar(paciente);
                Response.Redirect("Pacientes.aspx", false);
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnActivacion_Click(object sender, EventArgs e)
        {
            try
            {
                PacienteNegocio negocio = new PacienteNegocio();
                Paciente PacienteSeleccionado = (Paciente)Session["PacienteSeleccionado"];
                negocio.eliminarLogico(PacienteSeleccionado.Id, !PacienteSeleccionado.Activo);
                Response.Redirect("Pacientes.aspx", false);
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}