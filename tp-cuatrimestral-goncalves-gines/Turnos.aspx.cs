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
    public partial class Turnos : System.Web.UI.Page
    {
        public List<Turnos> ListaTurnos { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack) { 
                    TurnoNegocio turno = new TurnoNegocio();
                    Session.Add("listaTurno", turno.listarConSP());
                    dgvPacientesTurnos.DataSource = Session["listaTurno"];
                    dgvPacientesTurnos.DataBind();
                    
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
            string id = dgvPacientesTurnos.SelectedDataKey.ToString();
            Response.Redirect("CrearTurno.aspx?id"+id);
            
        }

        protected void btnConsulta_Click(object sender, EventArgs e)
        {
            Response.Redirect("");
        }

        protected void btnCrear_Click(object sender, EventArgs e)
        {
            Response.Redirect("CrearTurno.aspx");
        }

        protected void btnBuscarRapido_Click(object sender, EventArgs e)
        {
            //List<Turno> listaFiltrada = ((List<Turno>)Session["listaTurno"]);
            //listaFiltrada = listaFiltrada.FindAll(x => x.Nombre.ToUpper().Contains(txtFiltro.Text.ToUpper()));
      
        }
    }
}