using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tp_cuatrimestral_goncalves_gines
{
    public partial class CrearTurnoManual : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        { 
            try
            {
                if (!(Seguridad.esAdmin(Session["usuario"]) || Seguridad.esRecepcionista(Session["usuario"])))
                {
                    Session.Add("error", "Se requiere permisos de admin para acceder a esta página");
                    Response.Redirect("Error.aspx", false);
                }
                if (!IsPostBack)
                {
                    Especialidad especialidad = (Especialidad)(Session["especialidadSeleccionada"]);
                    if (especialidad != null)
                    {
                        lblSubTituloMedico.Text += especialidad.Nombre.ToString();
                        MedicoNegocio medicoNegocio = new MedicoNegocio();
                        Session.Add("listaMedicos", medicoNegocio.listarConEspecialidadSP(especialidad.Id));
                        dgvSeleccionarMedico.DataSource = Session["listaMedicos"];
                        dgvSeleccionarMedico.DataBind();
                    }

                    if (Request.QueryString["id"] != null){
                        TurnoNegocio negocioT = new TurnoNegocio();
                        List<Turno> lista = negocioT.listarConSP(Request.QueryString["id"].ToString());
                        Turno seleccionado = (negocioT.listarConSP("id"))[0];
                        Session.Add("pacienteSeleccionado", seleccionado.Paciente.ToString());
                        Session.Add("especialidadSeleccionada", seleccionado.Especialidad.ToString());
                    }

                }
            } catch(Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
            
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                Turno nuevoTurno = new Turno();
                string horarioSeleccionado = ddlHorariosDisponibles.SelectedValue.ToString();
                int posicion = horarioSeleccionado.IndexOf(":");
                nuevoTurno.Hora = int.Parse(horarioSeleccionado.Substring(0, posicion));
                nuevoTurno.Fecha = cldDiaTurno.SelectedDate;
                nuevoTurno.Paciente = (Paciente)Session["pacienteSeleccionado"];
                nuevoTurno.Especialidad = (Especialidad)Session["especialidadSeleccionada"];
                nuevoTurno.Medico = (Medico)Session["medicoSeleccionado"];
                nuevoTurno.FechaSolicitado = DateTime.Now;
                nuevoTurno.Observaciones = txtObservacion.Text;
                TurnoNegocio turnoNegocio = new TurnoNegocio();
                turnoNegocio.agregar(nuevoTurno);
                EmailService emailService = new EmailService();
                emailService.armarCorreo(nuevoTurno.Paciente.Mail, "Nuevo turno Agendado", "Hola " + nuevoTurno.Paciente.Nombre + " " + nuevoTurno.Paciente.Apellido + ", su turno está agendado para el día " + nuevoTurno.Fecha.ToShortDateString()
                    + " a las " + nuevoTurno.Hora.ToString() + ":00hrs. con el médico " + nuevoTurno.Medico.Nombre + " " + nuevoTurno.Medico.Apellido + ".");
                emailService.enviarMail();
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
            Session.Remove("turnoSeleccionado");
            Response.Redirect("Turnos.aspx", false);
        }

        protected void dgvSeleccionarMedico_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!cldDiaTurno.Visible)
            {
                lblDiaTurno.Visible = true;
                cldDiaTurno.Visible = true; 
            } else
            {
                cldDiaTurno_SelectionChanged(sender, e);
            }
            int idMedico = int.Parse(dgvSeleccionarMedico.SelectedDataKey.Value.ToString());
            Medico medicoSeleccionado = ((List<Medico>)Session["listaMedicos"]).Find(x=> x.Id == idMedico);
            Session.Add("medicoSeleccionado", medicoSeleccionado);
            lblDiaTurno.Text = "Seleccione una fecha para el médico " + medicoSeleccionado.Nombre + " " + medicoSeleccionado.Apellido;
        }

        protected void btnBuscarRapidoMedico_Click(object sender, EventArgs e)
        {
            List<Medico> listaMedicosFiltradas = ((List<Medico>)Session["listaMedicos"]);
            listaMedicosFiltradas = listaMedicosFiltradas.FindAll(
                x => x.Nombre.ToUpper().Contains(txtMedico.Text.ToUpper())
                || x.Apellido.ToUpper().Contains(txtMedico.Text.ToUpper())
                || x.Dni.ToString().ToUpper().Contains(txtMedico.Text.ToUpper()));
            dgvSeleccionarMedico.DataSource = listaMedicosFiltradas;
            dgvSeleccionarMedico.DataBind();
        }

        protected void cldDiaTurno_SelectionChanged(object sender, EventArgs e)
        {
            int idMedico = int.Parse(dgvSeleccionarMedico.SelectedDataKey.Value.ToString());
            Especialidad especialidad = (Especialidad)Session["especialidadSeleccionada"];
            Paciente paciente = (Paciente)Session["pacienteSeleccionado"]; 
            HorarioNegocio horarioNegocio = new HorarioNegocio();
            List<string> horariosDisponibles = horarioNegocio.cargarddlFecha(especialidad.Id, idMedico, paciente.Id, cldDiaTurno.SelectedDate);
            if (horariosDisponibles.Count() != 0)
            {
                lblHorariosDisponibles.Visible = true;
                ddlHorariosDisponibles.Visible = true;
                ddlHorariosDisponibles.Enabled = true;
                lblSinHorarios.Visible = false;
                btnAceptar.Visible = true;
                lblObservacion.Visible = true;
                txtObservacion.Visible = true;
            }
            else
            {
                ddlHorariosDisponibles.Enabled = false;
                lblSinHorarios.Visible = true;
                btnAceptar.Visible = false;
                lblObservacion.Visible = false;
                txtObservacion.Visible = false;
            }
            ddlHorariosDisponibles.DataSource = horariosDisponibles;
            ddlHorariosDisponibles.DataBind();
            btnAceptar.Visible = true;
            btnVolverTurnos.Visible = true;
            btnVolver.Visible = false;
        }

        protected void cldDiaTurno_DayRender(object sender, DayRenderEventArgs e)
        {
            if (e.Day.Date <= DateTime.Now.Date)
            {
                e.Day.IsSelectable = false;
                e.Cell.ForeColor = System.Drawing.Color.Red;
                e.Cell.Font.Strikeout = true;
            } else
            {
                e.Cell.ForeColor = System.Drawing.Color.Green;
            }
        }

        protected void btnVolverTurnos_Click(object sender, EventArgs e)
        {
            Session.Remove("turnoSeleccionado"); // lo borro para las validaciones de lo que se presenta en pantalla.
            Response.Redirect("Turnos.aspx", false);
        }
    }
}