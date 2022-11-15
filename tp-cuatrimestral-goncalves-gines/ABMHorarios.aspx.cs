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
    public partial class ABMHorarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtId.Enabled = false;
            btnActivacion.Visible = false;
            try
            {
                string id = Request.QueryString["id"] != null ? Request.QueryString["id"].ToString() : "";
                if (id != "" && !IsPostBack)
                {
                    HorarioNegocio negocio = new HorarioNegocio();
                    Horario horarioSeleccionado = (negocio.listarConSP(id))[0];

                    txtId.Text = id;
                    txtHorarioDesde.Text = horarioSeleccionado.Hora_Desde.ToString();
                    txtHorarioHasta.Text = horarioSeleccionado.Hora_Hasta.ToString();
                    txtDia.Text = horarioSeleccionado.Dia.ToString();

                    //Guardo en session para conocer luego el estado de activación o inactivación
                    Session.Add("HorarioSeleccionado", horarioSeleccionado);

                    if (!horarioSeleccionado.Activo)
                    {
                        btnActivacion.Text = "Reactivar";
                        btnActivacion.CssClass = "btn btn-warning";
                    }
                    btnActivacion.Visible = true;

                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                throw;
            }
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Horarios.aspx");
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                Horario horario = new Horario();
                HorarioNegocio negocio = new HorarioNegocio();

                horario.Hora_Desde = int.Parse(txtHorarioDesde.Text);
                horario.Hora_Hasta = int.Parse(txtHorarioHasta.Text);
                horario.Dia = int.Parse(txtDia.Text);

                if (Request.QueryString["id"] != null)
                {
                    horario.Id = int.Parse(txtId.Text);
                    negocio.modificar(horario);
                }
                else negocio.agregar(horario);
                Response.Redirect("Horarios.aspx");
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                throw;
            }
        }

        protected void btnActivacion_Click(object sender, EventArgs e)
        {
            try
            {
                HorarioNegocio negocio = new HorarioNegocio();
                Horario HorarioSeleccionado = (Horario)Session["HorarioSeleccionado"];

                negocio.eliminarLogico(HorarioSeleccionado.Id, !HorarioSeleccionado.Activo);
                Response.Redirect("Horarios.aspx");

            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
            }
        }
    }
}