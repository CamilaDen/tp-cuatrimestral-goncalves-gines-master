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
            if (!Seguridad.esAdmin(Session["usuario"]))
            {
                Session.Add("error", "Se requiere permisos de admin para acceder a esta página");
                Response.Redirect("Error.aspx", false);
            }

            txtId.Enabled = false;
            btnActivacion.Visible = false;

            try
            {
                string id = Request.QueryString["id"] != null ? Request.QueryString["id"].ToString() : "";
                if (!IsPostBack)
                {
                    List<Dia> listaDias = new List<Dia>();
                    listaDias.Add(new Dia(1, "Lunes"));
                    listaDias.Add(new Dia(2, "Martes"));
                    listaDias.Add(new Dia(3, "Miércoles"));
                    listaDias.Add(new Dia(4, "Jueves"));
                    listaDias.Add(new Dia(5, "Viernes"));
                    listaDias.Add(new Dia(6, "Sábado"));
                    listaDias.Add(new Dia(7, "Domingo"));
                    ddlDia.DataSource = listaDias;
                    ddlDia.DataTextField = "Nombre";
                    ddlDia.DataValueField = "Id";
                    ddlDia.DataBind();
                    if (id != "")
                    {
                        HorarioNegocio negocio = new HorarioNegocio();
                        Horario horarioSeleccionado = (negocio.listarConSP(id))[0];

                        txtId.Text = id;
                        txtHorarioDesde.Text = horarioSeleccionado.Hora_Desde.ToString();
                        txtHorarioHasta.Text = horarioSeleccionado.Hora_Hasta.ToString();
                        ddlDia.SelectedValue = horarioSeleccionado.Dia.ToString();

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
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Horarios.aspx", false);
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                Horario horario = new Horario();
                HorarioNegocio negocio = new HorarioNegocio();

                horario.Hora_Desde = int.Parse(txtHorarioDesde.Text);
                horario.Hora_Hasta = int.Parse(txtHorarioHasta.Text);
                horario.Dia = new Dia();
                horario.Dia.Id = int.Parse(ddlDia.SelectedValue);

                if (Request.QueryString["id"] != null)
                {
                    horario.Id = int.Parse(txtId.Text);
                    negocio.modificar(horario);
                }
                else negocio.agregar(horario);
                Response.Redirect("Horarios.aspx", false);
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
                HorarioNegocio negocio = new HorarioNegocio();
                Horario HorarioSeleccionado = (Horario)Session["HorarioSeleccionado"];

                negocio.eliminarLogico(HorarioSeleccionado.Id, !HorarioSeleccionado.Activo);
                Response.Redirect("Horarios.aspx", false);

            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}