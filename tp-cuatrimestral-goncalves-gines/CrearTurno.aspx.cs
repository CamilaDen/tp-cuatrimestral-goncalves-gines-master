using System;
using System.Collections.Generic;
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
        bool siguiente = false;
     
        protected void Page_Load(object sender, EventArgs e)
        {
            //txtId.Enabled = false;

            if (!IsPostBack) {
                TurnoNegocio negocio = new TurnoNegocio();
                //List<Turno> nuevoTurno;

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
            Response.Redirect("Turnos.aspx");
        }


        protected bool permiso() {
            if (siguiente) {
                return true;
            }
            return false;
        }


        protected void dgvSeleccionarPaciente_SelectedIndexChanged(object sender, EventArgs e)
        {
            string idP = dgvSeleccionarPaciente.SelectedDataKey.Value.ToString();
        }

        protected void dgvSeleccionarEspecialidad_SelectedIndexChanged(object sender, EventArgs e)
        {
            string idE = dgvSeleccionarEspecialidad.SelectedDataKey.Value.ToString();
            siguiente = true;
            
        }

        protected void Aceptar_Click(object sender, EventArgs e)
        {
            try
            {
                //EmailService emailService = new EmailService();
                //emailService.armarCorreo("","","");
                //Turno nuevo = new Turno();
                //nuevo.IdPaciente.Id = int.Parse( dgvSeleccionarEspecialidad.SelectedDataKey.Value.ToString());
                //nuevo.Especialidad.Id = int.Parse(dgvSeleccionarEspecialidad.SelectedIndex.ToString());
                //nuevo.Fecha = DateTime.Parse(txtFecha.Text);
                //nuevo.Hora = int.Parse(txtHorario.Text);
                //nuevo.IdMedico.Id = int.Parse(txtMedico.Text);
                //nuevo.Observaciones = "";
                //nuevo.Estado = "Nuevo" ;

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void btnBuscarRapido_Click(object sender, EventArgs e)
        {
            List<Paciente> listaPacientesFiltrados = ((List<Paciente>)Session["listaPacientes"]);
            listaPacientesFiltrados = listaPacientesFiltrados.FindAll(x => x.Nombre.ToUpper().Contains(txtPaciente.Text.ToUpper()) || x.Apellido.ToUpper().Contains(txtPaciente.Text.ToUpper()));
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
    }
}