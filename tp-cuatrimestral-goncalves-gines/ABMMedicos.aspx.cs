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
    public partial class ABMMedicos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtId.Enabled = false;
            btnActivacion.Visible = false;
            try
            {
                if (!IsPostBack)
                {

                    EspecialidadNegocio especialidadNegocio = new EspecialidadNegocio();
                    dgvEspecialidad.DataSource = especialidadNegocio.listarConSP();
                    dgvEspecialidad.DataBind();

                    string id = Request.QueryString["id"] != null ? Request.QueryString["id"].ToString() : "";
                    if (id != "")
                    {
                        MedicoNegocio negocio = new MedicoNegocio();
                        Medico medicoSeleccionado = (negocio.listarConSP(id))[0];

                        txtId.Text = id;
                        txtApellido.Text = medicoSeleccionado.Apellido;
                        txtNombre.Text = medicoSeleccionado.Nombre;
                        txtDNI.Text = medicoSeleccionado.Dni;
                        txtFNacimiento.Text = medicoSeleccionado.FechaDeNacimiento.ToString("yyyy-MM-dd");
                        txtMail.Text = medicoSeleccionado.Mail;
                        txtMatricula.Text = medicoSeleccionado.Matricula;


                        //Guardo en session para conocer luego el estado de activación o inactivación
                        Session.Add("MedicoSeleccionado", medicoSeleccionado);

                        if (!medicoSeleccionado.Activo)
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
                Session.Add("error", ex);
                throw;
            }
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Medicos.aspx");
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                Medico medico = new Medico();
                MedicoNegocio negocio = new MedicoNegocio();

                medico.Apellido = txtApellido.Text;
                medico.Nombre = txtNombre.Text;
                medico.Dni = txtDNI.Text;
                medico.Mail = txtMail.Text;
                medico.FechaDeNacimiento = DateTime.Parse(txtFNacimiento.Text);
                medico.Matricula = txtMatricula.Text;


                if (Request.QueryString["id"] != null)
                {
                    medico.Id = int.Parse(txtId.Text);
                    negocio.modificar(medico);
                }
                else negocio.agregar(medico);
                Response.Redirect("Pacientes.aspx");
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
                MedicoNegocio negocio = new MedicoNegocio();
                Medico MedicoSeleccionado = (Medico)Session["MedicoSeleccionado"];
                negocio.eliminarLogico(MedicoSeleccionado.Id, !MedicoSeleccionado.Activo);
                Response.Redirect("Pacientes.aspx");

            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
            }
        }
    }
}