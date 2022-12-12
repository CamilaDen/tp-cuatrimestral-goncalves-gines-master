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
    public partial class ABMTurnos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!(Seguridad.esAdmin(Session["usuario"]) || Seguridad.esRecepcionista(Session["usuario"]) || Seguridad.esMedico(Session["usuario"])))
            {
                Session.Add("error", "Se requiere permisos de admin o recepcionista para acceder a esta página");
                Response.Redirect("Error.aspx", false);
            }
            try
            {               
                if (!IsPostBack)
                {
                    EstadoTurnoNegocio estadoTurnoNegocio = new EstadoTurnoNegocio();
                    ddlEstado.DataSource = estadoTurnoNegocio.listarConSP();
                    ddlEstado.DataTextField = "Nombre";
                    ddlEstado.DataValueField = "Id";
                    ddlEstado.DataBind();
                    string id = Request.QueryString["id"] != null ? Request.QueryString["id"].ToString() : "";
                    if (id != "")
                    {
                        TurnoNegocio negocio = new TurnoNegocio();
                        Turno turnoSeleccionado = (negocio.listarConSP(id))[0];
                        txtId.Text = id;
                        txtApellido.Text = turnoSeleccionado.Paciente.Apellido;
                        txtNombre.Text = turnoSeleccionado.Paciente.Nombre;
                        txtDNI.Text = turnoSeleccionado.Paciente.Dni.ToString();
                        txtMail.Text = turnoSeleccionado.Paciente.Mail;
                        ddlEstado.SelectedValue = turnoSeleccionado.Estado.Id.ToString();
                        txtFecha.Text = turnoSeleccionado.Fecha.ToString("dd/MM/yyyy");
                        txtHora.Text = turnoSeleccionado.Hora.ToString() + ":00";
                        txtMedico.Text = turnoSeleccionado.Medico.Nombre + " " + turnoSeleccionado.Medico.Apellido;
                        txtEspecialidades.Text = turnoSeleccionado.Especialidad.Nombre;
                        txtObservacion.Text = turnoSeleccionado.Observaciones;
                        if ((Seguridad.esAdmin(Session["usuario"]) || Seguridad.esRecepcionista(Session["usuario"]) || Seguridad.esMedico(Session["usuario"])) && (ddlEstado.SelectedValue == "1" || ddlEstado.SelectedValue == "4"))
                        {
                            btnEditar.Visible = true;
                        }
                    }
                }
            }catch(Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                Turno turno = new Turno();
                TurnoNegocio negocio = new TurnoNegocio();
                turno.Id = int.Parse(txtId.Text);
                turno.Observaciones = txtObservacion.Text;
                turno.Estado = new EstadoTurno();
                turno.Estado.Id = int.Parse(ddlEstado.SelectedValue);
                negocio.actualizarObsEstado(turno);
                Response.Redirect("Turnos.aspx", false);
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Turnos.aspx",false);
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            if (Seguridad.esAdmin(Session["usuario"]) || Seguridad.esRecepcionista(Session["usuario"]) || Seguridad.esMedico(Session["usuario"]))
            {
                txtObservacion.Enabled = true;
                ddlEstado.Enabled = true;
                btnAceptar.Visible = true;
                btnEditar.Visible = false;
                btnCancelar.Visible = true;
                btnVolver.Visible = false;
            } else if (Seguridad.esAdmin(Session["usuario"])){
                ddlEstado.Enabled = true;
                btnAceptar.Visible = true;
                btnVolver.Visible = false;
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            txtObservacion.Enabled = false;
            ddlEstado.Enabled = false;
            btnAceptar.Visible = false;
            btnEditar.Visible = true;
            btnCancelar.Visible = false;
            btnVolver.Visible = true;
        }
    }
}