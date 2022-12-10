using System;
using System.Collections.Generic;
using System.EnterpriseServices;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.DynamicData;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace tp_cuatrimestral_goncalves_gines
{
    public partial class CrearTurno : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                TurnoNegocio negocio = new TurnoNegocio();

                PacienteNegocio negocioPaciente = new PacienteNegocio();
                Session.Add("listaPacientes", negocioPaciente.listarConSP());
                dgvSeleccionarPaciente.DataSource = Session["listaPacientes"];
                dgvSeleccionarPaciente.DataBind();

                EspecialidadNegocio negocioEspecialidad = new EspecialidadNegocio();
                Session.Add("listaEspecialidades", negocioEspecialidad.listarConSP());
                dgvSeleccionarEspecialidad.DataSource = Session["listaEspecialidades"];
                dgvSeleccionarEspecialidad.DataBind();

                MedicoNegocio negocioMedico = new MedicoNegocio();
                Session.Add("listaMedicos", negocioMedico.listarConSP());
            }
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Session.Remove("turnoSeleccionado");
            Response.Redirect("Turnos.aspx", false);
        }


        protected bool turnoSeleccionado()
        {
            return Session["turnoSeleccionado"] != null;
        }


        protected void dgvSeleccionarPaciente_SelectedIndexChanged(object sender, EventArgs e)
        {
            int idPaciente = int.Parse(dgvSeleccionarPaciente.SelectedDataKey.Value.ToString());
            Paciente paciente = ((List<Paciente>)Session["listaPacientes"]).Find(x => x.Id == idPaciente);
            Session.Add("pacienteSeleccionado", paciente);
        }

        protected void dgvSeleccionarEspecialidad_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {                            
                MedicoNegocio medicoNegocio = new MedicoNegocio();
                int idEspecialidad = int.Parse(dgvSeleccionarEspecialidad.SelectedDataKey.Value.ToString());
                int idPaciente = int.Parse(dgvSeleccionarPaciente.SelectedDataKey.Value.ToString());
                Especialidad especialidad = ((List<Especialidad>)Session["listaEspecialidades"]).Find(x => x.Id == idEspecialidad);
                Session.Add("especialidadSeleccionada", especialidad);
                List<Turno> turnosDisponibles = new List<Turno>();
                int dia = 0;
                do
                {
                    dia++;
                    turnosDisponibles.AddRange(medicoNegocio.turnosDisponibles(idPaciente, idEspecialidad, DateTime.Parse(DateTime.Now.AddDays(dia).ToShortDateString())));
                } while (turnosDisponibles.Count < 3);
                Session.Add("listaTurnosDisponibles", turnosDisponibles);
                dgvTurnosPropuestos.DataSource = Session["listaTurnosDisponibles"];
                dgvTurnosPropuestos.DataBind();
                btnCargaManual.Visible = true;

            }
            catch (Exception ex)
            {
                
                throw ex;
            }

        }

        protected void btnBuscarRapido_Click(object sender, EventArgs e)
        {
            List<Paciente> listaPacientesFiltrados = ((List<Paciente>)Session["listaPacientes"]);
            listaPacientesFiltrados = listaPacientesFiltrados.FindAll(
                x => x.Nombre.ToUpper().Contains(txtPaciente.Text.ToUpper()) 
                || x.Apellido.ToUpper().Contains(txtPaciente.Text.ToUpper()) 
                || x.Dni.ToString().ToUpper().Contains(txtPaciente.Text.ToUpper()));
            dgvSeleccionarPaciente.DataSource = listaPacientesFiltrados;
            dgvSeleccionarPaciente.DataBind();
        }

        protected void btnBuscarRapidoEspecialidad_Click(object sender, EventArgs e)
        {
            List<Especialidad> listaEspecialidadesFiltradas = ((List<Especialidad>)Session["listaEspecialidades"]);
            listaEspecialidadesFiltradas = listaEspecialidadesFiltradas.FindAll(x => x.Nombre.ToUpper().Contains(txtEspecialidad.Text.ToUpper()));
            dgvSeleccionarEspecialidad.DataSource = listaEspecialidadesFiltradas;
            dgvSeleccionarEspecialidad.DataBind();
        }

        protected void dgvTurnosPropuestos_SelectedIndexChanged(object sender, EventArgs e)
        {
            int idTurnoSeleccionado = int.Parse(dgvTurnosPropuestos.SelectedDataKey.Value.ToString());
            Turno turno = ((List<Turno>)Session["listaTurnosDisponibles"]).Find(x => x.Id == idTurnoSeleccionado);
            Session.Add("turnoSeleccionado", turno);
            dgvTurnosPropuestos.Visible = false;
            btnAceptar.Visible = true;
            btnVolverTurnos.Visible = true;
            btnVolver.Visible = false;
            Paciente paciente = (Paciente)Session["pacienteSeleccionado"];
            txtApellido.Text = paciente.Apellido;
            txtNombre.Text = paciente.Nombre;
            txtDNI.Text = paciente.Dni.ToString();
            txtMail.Text = paciente.Mail;
            txtFecha.Text = turno.Fecha.ToString("dd/MM/yyyy");
            txtHora.Text = turno.Hora.ToString() + ":00";
            txtMedico.Text = turno.Medico.Nombre.ToString() + " " + turno.Medico.Apellido.ToString();
            txtEspecialidades.Text = turno.Especialidad.Nombre;
            lblSeleccionMedico.Text = "Confirme los datos seleccionados...";
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                Turno nuevoTurno = (Turno)Session["turnoSeleccionado"];
                Session.Remove("turnoSeleccionado"); // lo borro para las validaciones de lo que se presenta en pantalla.
                nuevoTurno.Paciente = (Paciente)Session["pacienteSeleccionado"];
                nuevoTurno.Especialidad = (Especialidad)Session["especialidadSeleccionada"];
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

        protected void btnVolverTurnos_Click(object sender, EventArgs e)
        {
            Session.Remove("turnoSeleccionado"); // lo borro para las validaciones de lo que se presenta en pantalla.
            Response.Redirect("Turnos.aspx", false);
        }

        protected void btnCargaManual_Click(object sender, EventArgs e)
        {
            Response.Redirect("CrearTurnoManual.aspx", false);
        }
    }
}