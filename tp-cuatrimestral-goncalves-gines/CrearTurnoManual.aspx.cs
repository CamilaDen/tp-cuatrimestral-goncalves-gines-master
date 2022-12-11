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
                        lblTituloABMTurno.Text = "Nuevo Turno";
                        lblSubTituloMedico.Text = "Seleccione un médico de la especialidad " + especialidad.Nombre.ToString();
                        MedicoNegocio medicoNegocio = new MedicoNegocio();
                        Session.Add("listaMedicos", medicoNegocio.listarConEspecialidadSP(especialidad.Id));
                        dgvSeleccionarMedico.DataSource = Session["listaMedicos"];
                        dgvSeleccionarMedico.DataBind();
                    }

                    if (Request.QueryString["id"] != null){
                        TurnoNegocio negocioT = new TurnoNegocio();
                        Turno turnoSeleccionado = (negocioT.listarConSP(Request.QueryString["id"].ToString()))[0];
                        Session.Add("turnoSeleccionado", turnoSeleccionado);
                        Session.Add("pacienteSeleccionado", turnoSeleccionado.Paciente);
                        Session.Add("especialidadSeleccionada", turnoSeleccionado.Especialidad);
                        lblTituloABMTurno.Text = "Reagendar Turno";
                        lblSubTituloMedico.Text = "Seleccione un médico de la especialidad " + turnoSeleccionado.Especialidad.Nombre;
                        txtObservacion.Text = turnoSeleccionado.Observaciones.ToString(); 
                        MedicoNegocio medicoNegocio = new MedicoNegocio();
                        Session.Add("listaMedicos", medicoNegocio.listarConEspecialidadSP(turnoSeleccionado.Especialidad.Id));
                        dgvSeleccionarMedico.DataSource = Session["listaMedicos"];
                        dgvSeleccionarMedico.DataBind();
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
                string idTurnoReagendado = Request.QueryString["id"];
                Turno turno = new Turno();
                string horarioSeleccionado = ddlHorariosDisponibles.SelectedValue.ToString();
                int posicion = horarioSeleccionado.IndexOf(":");
                turno.Hora = int.Parse(horarioSeleccionado.Substring(0, posicion));
                turno.Fecha = cldDiaTurno.SelectedDate;
                turno.Paciente = (Paciente)Session["pacienteSeleccionado"];
                turno.Especialidad = (Especialidad)Session["especialidadSeleccionada"];
                turno.Medico = (Medico)Session["medicoSeleccionado"];
                turno.Observaciones = txtObservacion.Text;
                turno.FechaSolicitado = DateTime.Now;
                TurnoNegocio turnoNegocio = new TurnoNegocio();
                EmailService emailService = new EmailService();
                if (idTurnoReagendado == null)
                {                    
                    turnoNegocio.agregar(turno);
                    emailService.armarCorreo(turno.Paciente.Mail, "Nuevo turno Agendado", "Hola " + turno.Paciente.Nombre + " " + turno.Paciente.Apellido + ", su turno está agendado para el día " + turno.Fecha.ToShortDateString()
                        + " a las " + turno.Hora.ToString() + ":00hrs. con el médico " + turno.Medico.Nombre + " " + turno.Medico.Apellido + ".");
                }
                else
                {
                    Turno turnoAnterior = (Turno)Session["turnoSeleccionado"];
                    turno.Id = int.Parse(idTurnoReagendado);
                    turnoNegocio.reagendar(turno);
                    emailService.armarCorreo(turno.Paciente.Mail, "Turno reagendado", "Hola " + turno.Paciente.Nombre + " " + turno.Paciente.Apellido + ", su turno del día " 
                        + turnoAnterior.Fecha.ToShortDateString() + " a las " + turnoAnterior.Hora +":00hrs. con el médico "
                        + turnoAnterior.Medico.Nombre + " " + turno.Medico.Apellido + ", "
                        + " ha sido reagendado para el día " + turno.Fecha.ToShortDateString()
                        + " a las " + turno.Hora.ToString() + ":00hrs. con el médico " + turno.Medico.Nombre + " " + turno.Medico.Apellido + ".");
                }
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