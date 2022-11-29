using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
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
            txtId.Enabled = false;

            if (!IsPostBack) {
                TurnoNegocio negocio = new TurnoNegocio();
                List<Turno> lista = negocio.listarConSP();


            }
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Turnos.aspx");
        }
    }
}