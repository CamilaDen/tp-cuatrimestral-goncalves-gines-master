﻿using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tp_cuatrimestral_goncalves_gines
{
    public partial class Turnos : System.Web.UI.Page
    {

        public List<Turnos> ListaTurnos { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            
            try
            {
                if (!IsPostBack) {
                    TurnoNegocio turnoNegocio = new TurnoNegocio();
                    if (Seguridad.esMedico(Session["usuario"]))
                    {
                        Usuario user = (Usuario) Session["usuario"]; //cargo el usuario de sesion en un objeto
                        MedicoNegocio medicoNegocio = new MedicoNegocio();
                        int idMedico = medicoNegocio.buscarPorID(user.Id.ToString());
                        Session.Add("listaTurno", turnoNegocio.ListarTurnosMedico(idMedico.ToString()));
                    }
                    else 
                    {                         
                        Session.Add("listaTurno", turnoNegocio.listarConSP());                                               
                    }
                    dgvPacientesTurnos.DataSource = Session["listaTurno"];
                    dgvPacientesTurnos.DataBind();
                    if (dgvPacientesTurnos.SelectedIndex == -1) {
                        btnReagendar.Enabled = false;
                        btnVer.Enabled = false;
                        btnCancelar.Enabled = false;
                    }
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

        protected void dgvPacientesTurnos_SelectedIndexChanged(object sender, EventArgs e)
        {
            btnVer.Enabled = true;
            Turno turnoSeleccionado = ((List<Turno>)Session["listaTurno"]).Find(x => x.Id == int.Parse(dgvPacientesTurnos.SelectedDataKey.Value.ToString()));
            if ((Seguridad.esRecepcionista(Session["usuario"]) || Seguridad.esAdmin(Session["usuario"])) && (turnoSeleccionado.Estado.Id == 1 || turnoSeleccionado.Estado.Id == 4)) { 
                btnReagendar.Enabled = true;
                btnCancelar.Enabled = true;
            }else
            {
                btnReagendar.Enabled = false;
                btnCancelar.Enabled = false;
            }
        }


        protected void btnCrear_Click(object sender, EventArgs e)
        {
            Response.Redirect("CrearTurno.aspx");
        }

        protected void btnBuscarRapido_Click(object sender, EventArgs e)
        {
            List<Turno> listaFiltrada = (List<Turno>)Session["listaTurno"];
            listaFiltrada = listaFiltrada.FindAll(
                x => x.Paciente.Nombre.ToUpper().Contains(txtFiltro.Text.ToUpper()) 
                || x.Paciente.Apellido.ToUpper().Contains(txtFiltro.Text.ToUpper())
                || x.Paciente.Dni.ToString().ToUpper().Contains(txtFiltro.Text.ToUpper()));
            dgvPacientesTurnos.DataSource = listaFiltrada;
            dgvPacientesTurnos.DataBind();

        }

        protected void btnVer_Click(object sender, EventArgs e)
        {
            string id = dgvPacientesTurnos.SelectedDataKey.Value.ToString();
            Response.Redirect("ABMTurnos.aspx?id=" + id, false);
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            string id = dgvPacientesTurnos.SelectedDataKey.Value.ToString();
            EstadoTurnoNegocio turno = new EstadoTurnoNegocio();
            turno.CancelarTurno(id);
            Response.Redirect("Turnos.aspx");
        }

        protected void btnReagendar_Click(object sender, EventArgs e)
        {
            string id = dgvPacientesTurnos.SelectedDataKey.Value.ToString();     
            Response.Redirect("CrearTurnoManual.aspx?id=" + id, false);
        }

        protected void dgvPacientesTurnos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvPacientesTurnos.PageIndex = e.NewPageIndex;
            dgvPacientesTurnos.DataSource = Session["listaTurno"];
            dgvPacientesTurnos.DataBind();
        }
    }
}